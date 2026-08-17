-- ============================================================
-- Retail Analytics Data Platform
-- STAGING: Customers
-- ============================================================
--
-- Purpose:
-- Create a standardized staging table from the RAW customer data.
--
-- Source:
-- RETAIL_ANALYTICS.RAW_DATA.CUSTOMERS
--
-- Target:
-- RETAIL_ANALYTICS.STAGING.STG_CUSTOMERS
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.STAGING.STG_CUSTOMERS AS

SELECT
    customer_id,
    name,
    country,
    age,
    total_orders,
    total_spent

FROM RETAIL_ANALYTICS.RAW_DATA.CUSTOMERS;