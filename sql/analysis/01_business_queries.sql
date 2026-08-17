-- ============================================================
-- Retail Analytics Data Platform
-- Business Analysis Queries
-- ============================================================
--
-- Purpose:
-- Answer common retail business questions using the MART layer.
--
-- These queries demonstrate how the dimensional model can be
-- used for business reporting and decision-making.
-- ============================================================


-- ============================================================
-- 1. Monthly Revenue
-- ============================================================

SELECT
    DATE_TRUNC('MONTH', order_date) AS month,
    SUM(gross_sales) AS total_revenue

FROM RETAIL_ANALYTICS.MART.FACT_SALES

GROUP BY
    DATE_TRUNC('MONTH', order_date)

ORDER BY
    month;


-- ============================================================
-- 2. Revenue by Sales Channel
-- ============================================================

SELECT
    sales_channel,
    SUM(gross_sales) AS total_revenue

FROM RETAIL_ANALYTICS.MART.FACT_SALES

GROUP BY
    sales_channel

ORDER BY
    total_revenue DESC;


-- ============================================================
-- 3. Top 10 Products by Revenue
-- ============================================================

SELECT
    dp.product_name,
    dp.category,
    SUM(fs.quantity) AS units_sold,
    SUM(fs.gross_sales) AS total_revenue

FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

JOIN RETAIL_ANALYTICS.MART.DIM_PRODUCT dp
    ON fs.product_id = dp.product_id

GROUP BY
    dp.product_name,
    dp.category

ORDER BY
    total_revenue DESC

LIMIT 10;


-- ============================================================
-- 4. Revenue by Product Category
-- ============================================================

SELECT
    dp.category,
    SUM(fs.quantity) AS units_sold,
    SUM(fs.gross_sales) AS total_revenue,
    SUM(fs.gross_profit) AS total_profit

FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

JOIN RETAIL_ANALYTICS.MART.DIM_PRODUCT dp
    ON fs.product_id = dp.product_id

GROUP BY
    dp.category

ORDER BY
    total_revenue DESC;


-- ============================================================
-- 5. Revenue by Country
-- ============================================================

SELECT
    dc.country,
    SUM(fs.gross_sales) AS total_revenue,
    SUM(fs.gross_profit) AS total_profit

FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

JOIN RETAIL_ANALYTICS.MART.DIM_CUSTOMER dc
    ON fs.customer_id = dc.customer_id

GROUP BY
    dc.country

ORDER BY
    total_revenue DESC;


-- ============================================================
-- 6. Profit Margin by Category
-- ============================================================

SELECT
    dp.category,

    SUM(fs.gross_sales) AS total_revenue,

    SUM(fs.gross_profit) AS total_profit,

    ROUND(
        SUM(fs.gross_profit)
        / NULLIF(SUM(fs.gross_sales), 0) * 100,
        2
    ) AS profit_margin_pct

FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

JOIN RETAIL_ANALYTICS.MART.DIM_PRODUCT dp
    ON fs.product_id = dp.product_id

GROUP BY
    dp.category

ORDER BY
    profit_margin_pct DESC;


-- ============================================================
-- 7. Order Status Performance
-- ============================================================

SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(gross_sales) AS total_revenue

FROM RETAIL_ANALYTICS.MART.FACT_SALES

GROUP BY
    order_status

ORDER BY
    total_orders DESC;