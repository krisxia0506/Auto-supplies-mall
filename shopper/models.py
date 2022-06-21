from django.db import models

STATE = (
    ('待支付', '待支付'),
    ('已支付', '已支付'),
    ('发货中', '发货中'),
    ('已签收', '已签收'),
    ('退货中', '退货中'),
)

class CartInfos(models.Model):
    id = models.AutoField(primary_key=True)
    quantity = models.IntegerField('购买数量')
    commodityInfos_id = models.IntegerField('商品ID')
    user_id = models.IntegerField('用户ID')

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = '购物车'
        verbose_name_plural = '购物车'

class OrderInfos(models.Model):
    id = models.AutoField(primary_key=True)
    price = models.FloatField('订单总价')
    created = models.DateField('创建时间', auto_now_add=True)
    user_id = models.IntegerField('用户ID')
    state = models.CharField('订单状态', max_length=20, choices=STATE)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = '订单信息'
        verbose_name_plural = '订单信息'
