from django.contrib import admin
from .models import *

# admin.site.register(CartInfos)
# admin.site.register(OrderInfos)

@admin.register(CartInfos)
class CartInfosAdmin(admin.ModelAdmin):
    list_display = ['id', 'quantity']


@admin.register(OrderInfos)
class OrderInfosAdmin(admin.ModelAdmin):
    list_display = ['id', 'price', 'created', 'state']
    list_filter = ['state']
    date_hierarchy = 'created'