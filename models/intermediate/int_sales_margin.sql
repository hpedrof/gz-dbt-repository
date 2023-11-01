select
    sales.*
    , products.purchase_price
    , sales.quantity*CAST(products.purchase_price as float64) as purchase_cost
    , ROUND((sales.revenue - (CAST(products.purchase_price AS float64)*sales.quantity)),2) AS margin
FROM {{ref('stg_raw__sales')}} AS sales
JOIN {{ref('stg_raw__product')}} AS products
ON sales.products_id = products.products_id