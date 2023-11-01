select
      sales_margin.orders_id
    , sales_margin.date_date
    , sales_margin.revenue
    , sales_margin.quantity
    , sales_margin.purchase_cost
    , sales_margin.margin 
    , ship.shipping_fee
    , CAST(ship.ship_cost AS FLOAT64) AS ship_cost
    , ship.logcost
    , ROUND(sales_margin.margin + ship.shipping_fee - ship.logcost - CAST(ship.ship_cost AS FLOAT64),2) as operational_margin
from {{ ref('int_orders_margin')}} as sales_margin
join {{ ref('stg_raw__ship')}} as ship
using (orders_id)
ORDER BY orders_id desc