-- ============================================================
-- Retail Analytics Data Platform
-- STAGING: Orders
-- ============================================================
--
-- Purpose:
-- Standardize order data from the RAW layer.
--
-- Source:
-- RETAIL_ANALYTICS.RAW_DATA.ORDERS
--
-- Target:
-- RETAIL_ANALYTICS.STAGING.STG_ORDERS
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.STAGING.STG_ORDERS AS

SELECT
    order_id,
    customer_id,
    TO_DATE(order_date) AS order_date,
    payment_method,
    order_status,
    sales_channel

FROM RETAIL_ANALYTICS.RAW_DATA.ORDERS;