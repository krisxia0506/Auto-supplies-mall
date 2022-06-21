from django.shortcuts import render, redirect
from .models import *
from commodity.models import *
from django.http import JsonResponse
from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.models import User
from django.shortcuts import reverse
from .form import *
from .pays_new import get_pay
import time

# def loginView(request):
#     title = '用户登录'
#     classContent = 'logins'
#     if request.method == 'POST':
#         username = request.POST.get('username', '')
#         password = request.POST.get('password', '')
#         if User.objects.filter(username=username):
#             user = authenticate(username=username, password=password)
#             if user:
#                 login(request, user)
#                 return redirect(reverse('shopper:shopper'))
#         else:
#             state = '注册成功'
#             d = dict(username=username, password=password, is_staff=1, is_active=1)
#             user = User.objects.create_user(**d)
#             user.save()
#     return render(request, 'login.html', locals())

# def loginView(request):
#     title = '用户登录'
#     classContent = 'logins'
#     if request.method == 'POST':
#         infos = LoginForm(data=request.POST)
#         if infos.is_valid():
#             data = infos.cleaned_data
#             username = data['username']
#             password = data['password']
#             if User.objects.filter(username=username):
#                 user = authenticate(username=username, password=password)
#                 if user:
#                     login(request, user)
#                     return redirect(reverse('shopper:shopper'))
#             else:
#                 state = '注册成功'
#                 d = dict(username=username, password=password, is_staff=1, is_active=1)
#                 user = User.objects.create_user(**d)
#                 user.save()
#         else:
#             # 获取错误信息，并以JSON格式输出
#             error_msg = infos.errors.as_json()
#             print(error_msg)
#     else:
#         infos = LoginForm()
#     return render(request, 'login.html', locals())

def loginView(request):
    title = '用户登录'
    classContent = 'logins'
    if request.method == 'POST':
        infos = LoginModelForm(data=request.POST)
        data = infos.data
        username = data['username']
        password = data['password']
        if User.objects.filter(username=username):
            user = authenticate(username=username, password=password)
            if user:
                login(request, user)
                return redirect(reverse('shopper:shopper'))
        else:
            state = '注册成功'
            d = dict(username=username, password=password, is_staff=1, is_active=1)
            user = User.objects.create_user(**d)
            user.save()
    else:
        infos = LoginModelForm()
    return render(request, 'login.html', locals())


@login_required(login_url='/shopper/login.html')
def shopperView(request):
    title = '个人中心'
    classContent = 'informations'
    p = request.GET.get('p', 1)
    # 处理已支付的订单
    t = request.GET.get('t', '')
    payTime = request.session.get('payTime', '')
    if t and payTime and t == payTime:
        payInfo = request.session.get('payInfo', '')
        OrderInfos.objects.create(**payInfo)
        del request.session['payTime']
        del request.session['payInfo']
    # 根据当前用户查询用户订单信息
    orderInfos = OrderInfos.objects.filter(user_id=request.user.id).order_by('-created')
    # 分页功能
    paginator = Paginator(orderInfos, 7)
    try:
        pages = paginator.page(p)
    except PageNotAnInteger:
        pages = paginator.page(1)
    except EmptyPage:
        pages = paginator.page(paginator.num_pages)
    return render(request, 'shopper.html', locals())

def logoutView(request):
    # 使用内置函数logout退出用户登录状态
    logout(request)
    # 网页自动跳转到首页
    return redirect(reverse('index:index'))


@login_required(login_url='/shopper/login.html')
def shopcartView(request):
    title = '我的购物车'
    classContent = 'shopcarts'
    id = request.GET.get('id', '')
    quantity = request.GET.get('quantity', 1)
    userID = request.user.id
    if id:
        CartInfos.objects.update_or_create(commodityInfos_id=id, user_id=userID, quantity=quantity)
        return redirect('shopper:shopcart')
    getUserId = CartInfos.objects.filter(user_id=userID)
    commodityDcit = {x.commodityInfos_id: x.quantity for x in getUserId}
    commodityInfos = CommodityInfos.objects.filter(id__in=commodityDcit.keys())
    return render(request, 'shopcart.html', locals())

def deleteAPI(request):
    result = {'state': 'success'}
    userId = request.GET.get('userId', '')
    commodityId = request.GET.get('commodityId', '')
    if userId:
        CartInfos.objects.filter(user_id=userId).delete()
    elif commodityId:
        CartInfos.objects.filter(commodityInfos_id=commodityId).delete()
    else:
        result = {'state': 'fail'}
    return JsonResponse(result)


def paysView(request):
    total = request.GET.get('total', 0)
    total = float(str(total).replace('￥', ''))
    if total:
        out_trade_no = str(int(time.time()))
        payInfo = dict(price=total, user_id=request.user.id, state='已支付')
        request.session['payInfo'] = payInfo
        request.session['payTime'] = out_trade_no
        return_url = 'http://' + request.get_host() + '/shopper.html'
        url = get_pay(out_trade_no, total, return_url)
        return redirect(url)
    else:
        return redirect('shopper:shopcart')

