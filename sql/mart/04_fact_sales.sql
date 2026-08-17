-- ============================================================
-- Retail Analytics Data Platform
-- MART: Sales Fact
-- ============================================================
--
-- Purpose:
-- Create the central sales fact table for retail analytics.
--
-- Sources:
-- RETAIL_ANALYTICS.STAGING.STG_ORDER_ITEMS
-- RETAIL_ANALYTICS.STAGING.STG_ORDERS
-- RETAIL_ANALYTICS.MART.DIM_PRODUCT
--
-- Target:
-- RETAIL_ANALYTICS.MART.FACT_SALES
--
-- Grain:
-- One row per order item
--
-- Business Metrics:
-- gross_sales
-- total_cost
-- gross_profit
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.MART.FACT_SALES AS

SELECT

    oi.order_item_id,
    o.order_id,

    o.order_date,

    o.customer_id,
    oi.product_id,

    o.payment_method,
    o.sales_channel,
    o.order_status,

    oi.quantity,
    oi.unit_price,
    oi.total_price,

    dp.cost,

    -- Gross sales
    (oi.quantity * oi.unit_price) AS gross_sales,

    -- Total product cost
    (oi.quantity * dp.cost) AS total_cost,

    -- Gross profit
    (oi.quantity * oi.unit_price)
        - (oi.quantity * dp.cost) AS gross_profit

FROM RETAIL_ANALYTICS.STAGING.STG_ORDER_ITEMS oi

JOIN RETAIL_ANALYTICS.STAGING.STG_ORDERS o
    ON oi.order_id = o.order_id

JOIN RETAIL_ANALYTICS.MART.DIM_PRODUCT dp
    ON oi.product_id = dp.product_id;