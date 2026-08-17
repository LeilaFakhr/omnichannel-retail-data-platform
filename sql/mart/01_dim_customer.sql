-- ============================================================
-- Retail Analytics Data Platform
-- MART: Customer Dimension
-- ============================================================
--
-- Purpose:
-- Create the customer dimension used for analytical reporting.
--
-- Source:
-- RETAIL_ANALYTICS.STAGING.STG_CUSTOMERS
--
-- Target:
-- RETAIL_ANALYTICS.MART.DIM_CUSTOMER
--
-- Grain:
-- One row per customer
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.MART.DIM_CUSTOMER AS

SELECT
    customer_id,
    name,
    country,
    age,
    total_orders,
    total_spent

FROM RETAIL_ANALYTICS.STAGING.STG_CUSTOMERS;