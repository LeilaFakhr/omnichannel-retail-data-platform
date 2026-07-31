-- Create Business Summary Table

CREATE OR REPLACE TABLE sales_summary AS

SELECT

    fs.order_date,
    dp.category,
    dp.product_name,
    dc.country,
    fs.sales_channel,

    SUM(fs.quantity) AS total_quantity,

    SUM(fs.gross_sales) AS total_revenue,

    SUM(
        (dp.unit_price - dp.cost) * fs.quantity
    ) AS total_profit


FROM fact_sales fs

JOIN dim_product dp

ON fs.product_id = dp.product_id


JOIN dim_customer dc

ON fs.customer_id = dc.customer_id


GROUP BY

    fs.order_date,
    dp.category,
    dp.product_name,
    dc.country,
    fs.sales_channel;