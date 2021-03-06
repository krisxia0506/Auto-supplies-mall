import pymysql
from django.views.generic.base import TemplateView

from babys.settings import DATABASES
from commodity.models import *


# Create your views here.

class indexClassView(TemplateView):
    template_name = 'index.html'
    template_engine = None
    content_type = None
    extra_context = {'title': '首页', 'classContent': ''}

    # 重新定义模板上下文的获取方式
    def get_context_data(self, **kwargs):
        connection = pymysql.connect(user='root', password='2547359996', db='car')
        cursor = connection.cursor()
        # 执行查询视图某个类目前5个商品的sql语句
        def sqldoce(a):
            sql = f"select id,img " \
                  f"from commodity_limit5 " \
                  f"where firsts='{a}'".format(a=a)
            cursor.execute(sql)
            return cursor.fetchall()
        context = super().get_context_data(**kwargs)
        # 调用存储过程
        def sqlprocedure():
            sql = "call commodity_sold_procedure()"
            cursor.execute(sql)
            return cursor.fetchall()
        # 根据销量选出8个商品
        context['commodityInfos'] = sqlprocedure()
        # 行车安全
        context['safe'] = sqldoce('行车安全')
        # 用车舒适
        context['comfortable'] = sqldoce('用车舒适')
        # 车内配件
        context['goods'] = sqldoce('车内配件')
        # 关闭游标和连接
        cursor.close()
        connection.close()
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
