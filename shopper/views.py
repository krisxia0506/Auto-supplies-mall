import time

import pymysql
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.decorators import login_required
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.shortcuts import reverse

from commodity.models import *
from .form import *
from .models import *
from .pays_new import get_pay


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
                state = '密码错误'
        else:
            state = '注册成功'
            d = dict(username=username, password=password, is_staff=1, is_active=1)
            user = User.objects.create_user(**d)
            user.save()
    else:
        infos = LoginModelForm()
    return render(request, 'login.html', locals())


def deleteAPI(userId, commodityId):
    result = {'state': 'success'}
    if userId:
        for c in commodityId.split(','):
            CartInfos.objects.filter(user_id=userId, commodityInfos_id=c).delete()
    else:
        result = {'state': 'fail'}
    return JsonResponse(result)


@login_required(login_url='/shopper/login.html')
def shopperView(request):
    title = '个人中心'
    classContent = 'informations'
    p = request.GET.get('p', 1)
    # 处理已支付的订单
    t = request.GET.get('t', '')
    payTime = request.session.get('payTime', '')
    # 如果支付成功，则更新订单状态
    if t and payTime and t == payTime:
        payInfo = request.session.get('payInfo', '')
        userId = request.session.get('userId', '')
        commodityId = request.session.get('commodityId', '')
        # 删除购物车中的商品，减少库存
        for c in commodityId.split(','):
            deleteAPI(userId, c)
            commoditysql(c)
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


# 执行sql结算的物品库存减一
def commoditysql(commodity):
    connection = pymysql.connect(user='root', password='2547359996', db='car')
    # 创建游标对象
    cursor = connection.cursor()
    # 执行sql语句
    sql = 'update commodity_commodityinfos set stock = stock-1 where id = %s' % commodity
    print(sql)
    cursor.execute(sql)
    connection.commit()
    cursor.close()
    connection.close()


def paysView(request):
    # deleteAPI(request)
    total = request.GET.get('total', 0)
    userId = request.user.id
    commodityId = request.GET.get('commodityId', '')
    print('paysView:' + commodityId)
    total = float(str(total).replace('￥', ''))
    if total:
        out_trade_no = str(int(time.time()))
        payInfo = dict(price=total, user_id=request.user.id, state='已支付')
        request.session['payInfo'] = payInfo
        request.session['payTime'] = out_trade_no
        request.session['commodityId'] = commodityId
        request.session['userId'] = userId
        return_url = 'http://' + request.get_host() + '/shopper.html'
        url = get_pay(out_trade_no, total, return_url)
        return redirect(url)
    else:
        return redirect('shopper:shopcart')
