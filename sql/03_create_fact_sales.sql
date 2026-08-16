-- Create Sales Fact Table

CREATE OR REPLACE TABLE fact_sales AS

SELECT

    o.order_id,
    oi.order_item_id,

    o.order_date,

    o.customer_id,
    oi.product_id,

    o.payment_method,
    o.sales_channel,
    o.order_status,

    oi.quantity,
    oi.unit_price,
    oi.total_price,

    -- Business metrics

    (oi.quantity * oi.unit_price) AS gross_sales


FROM orders o

JOIN order_items oi

ON o.order_id = oi.order_id;