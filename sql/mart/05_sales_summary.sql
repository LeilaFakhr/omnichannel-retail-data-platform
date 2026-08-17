-- ============================================================
-- Retail Analytics Data Platform
-- MART: Sales Summary
-- ============================================================
--
-- Purpose:
-- Create an aggregated business summary for reporting and
-- Power BI analysis.
--
-- Sources:
-- RETAIL_ANALYTICS.MART.FACT_SALES
-- RETAIL_ANALYTICS.MART.DIM_PRODUCT
-- RETAIL_ANALYTICS.MART.DIM_CUSTOMER
--
-- Target:
-- RETAIL_ANALYTICS.MART.SALES_SUMMARY
--
-- Grain:
-- One row per date, category, product, country, and
-- sales channel combination.
--
-- Metrics:
-- total_quantity
-- total_revenue
-- total_cost
-- total_profit
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.MART.SALES_SUMMARY AS

SELECT

    fs.order_date,

    dp.category,

    dp.product_name,

    dc.country,

    fs.sales_channel,

    SUM(fs.quantity) AS total_quantity,

    SUM(fs.gross_sales) AS total_revenue,

    SUM(fs.total_cost) AS total_cost,

    SUM(fs.gross_profit) AS total_profit

FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

JOIN RETAIL_ANALYTICS.MART.DIM_PRODUCT dp
    ON fs.product_id = dp.product_id

JOIN RETAIL_ANALYTICS.MART.DIM_CUSTOMER dc
    ON fs.customer_id = dc.customer_id

GROUP BY
    fs.order_date,
    dp.category,
    dp.product_name,
    dc.country,
    fs.sales_channel;