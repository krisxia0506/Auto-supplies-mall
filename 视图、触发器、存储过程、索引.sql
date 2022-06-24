# 视图
# 用于在index页面展示三个类目销量前五项的商品
drop view if exists commodity_limit5;
create view commodity_limit5 as
select *
from (select commodity_commodityinfos.id, img, name, sold, types, firsts
      from commodity_commodityinfos
               join commodity_types on types = seconds
      where firsts = '行车安全'
      ORDER BY sold desc
      limit 5) as ccct0
union all
select *
from (select commodity_commodityinfos.id, img, name, sold, types, firsts
      from commodity_commodityinfos
               join commodity_types on types = seconds
      where firsts = '用车舒适'
      ORDER BY sold desc
      limit 5) as ccct1
union all
select *
from (select commodity_commodityinfos.id, img, name, sold, types, firsts
      from commodity_commodityinfos
               join commodity_types on types = seconds
      where firsts = '车内配件'
      ORDER BY sold desc
      limit 5) as ccct2;

# 触发器
#购物车结算时，执行sql，减少相应商品的库存。当库存变少时，触发器触发，增加sold字段。
# 商品库存减少时触发
drop trigger if exists commodity_limit5_trigger;
create trigger commodity_limit5_trigger
    after update
    on commodity_commodityinfos
    for each row
begin
    if old.stock > new.stock then
        update commodity_sold set sold = sold + 1 where id = new.id;
    end if;
END;
# 存储过程
# 创建一个存储过程，查询销量前8的商品
drop procedure if exists commodity_sold_procedure;
create procedure commodity_sold_procedure()
begin
    select id,img,name,discount,price from commodity_commodityinfos
    order by sold desc
    limit 8;
end;
call commodity_sold_procedure();

# 索引
drop index index_name on commodity_commodityinfos;
ALTER TABLE commodity_commodityinfos
    ADD INDEX index_name (name);


