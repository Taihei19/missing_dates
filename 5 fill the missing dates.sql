select g.orderdate
      ,coalesce(s.orderid,'') as orderid
      ,coalesce(s.customerid,'') as customerid
      ,coalesce(s.store,'') as store
      ,g.productid
      ,g.productname
      ,g.categoryid
      ,g.categoryname
      ,coalesce(s.cost,0) as cost
      ,coalesce(s.salesprice,0) as salesprice
      ,coalesce(s.quantity,0) as quantity
      ,coalesce(s.amountcost,0) as amountcost
      ,coalesce(s.amountsales,0) as amountsales
      ,coalesce(s.profit,0) as profit
  from(
select cast(generate_series as date) as orderdate
      ,p.productid
      ,p.productname
      ,p.categoryid
      ,p.categoryname
  from generate_series((select min(orderdate) from sales), (select max(orderdate) from sales), '1 day')
 cross join product p ) g
  left join sales s
    on g.orderdate = s.orderdate
   and g.productid = s.productid
