import pymysql
from django.views.generic.base import TemplateView
from commodity.models import *

# Create your views here.
connection = pymysql.connect(user='root', password='2547359996', db='car')
cursor = connection.cursor()


# 执行查询每个类目前5个商品的sql语句
def sqldoce(a):
    sql = f"select id,img from commodity_limit5 where firsts='{a}'"
    cursor.execute(sql)
    return cursor.fetchall()


# def indexView(request):
#     title = '首页'
#     classContent = ''
#     # 根据销量选出8个商品
#     commodityInfos = CommodityInfos.objects.order_by('-sold').all()[:8]
#
#     types = Types.objects.all()
#     # 行车安全
#     # cl = [x.seconds for x in types if x.firsts == '行车安全']
#     # clothes = CommodityInfos.objects.filter(types__in=cl).order_by('-sold')[:5]
#
#     clothess = sqldoce('行车安全')
#
#     # 用车舒适
#     food = sqldoce('用车舒适')
#
#     # 车内配件
#     goods = food = sqldoce('车内配件')
#     return render(request, 'index.html', locals())


class indexClassView(TemplateView):
    template_name = 'index.html'
    template_engine = None
    content_type = None
    extra_context = {'title': '首页', 'classContent': ''}

    # 重新定义模板上下文的获取方式
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # 根据销量选出8个商品
        context['commodityInfos'] = CommodityInfos.objects.order_by('-sold').all()[:8]
        types = Types.objects.all()

        # 行车安全
        # cl = [x.seconds for x in types if x.firsts == '行车安全']
        # context['clothes'] = CommodityInfos.objects.filter(types__in=cl).order_by('-sold')[:5]
        context['clothes'] = sqldoce('行车安全')

        # 用车舒适
        context['food'] = sqldoce('用车舒适')

        # 车内配件
        context['goods'] = sqldoce('车内配件')
        return context

    # 定义HTTP的GET请求处理方法
    # 参数request代表HTTP请求信息
    # 若路由设有路由变量，则可从参数kwargs里获取
    def get(self, request, *args, **kwargs):
        pass
        context = self.get_context_data(**kwargs)
        return self.render_to_response(context)

    # 定义HTTP的POST请求处理方法
    # 参数request代表HTTP请求信息
    # 若路由设有路由变量，则可从参数kwargs里获取
    def post(self, request, *args, **kwargs):
        pass
        context = self.get_context_data(**kwargs)
        return self.render_to_response(context)
