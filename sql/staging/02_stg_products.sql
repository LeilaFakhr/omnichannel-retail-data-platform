-- ============================================================
-- Retail Analytics Data Platform
-- STAGING: Products
-- ============================================================
--
-- Purpose:
-- Create a standardized staging table from the RAW product data.
--
-- Source:
-- RETAIL_ANALYTICS.RAW_DATA.PRODUCTS
--
-- Target:
-- RETAIL_ANALYTICS.STAGING.STG_PRODUCTS
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.STAGING.STG_PRODUCTS AS

SELECT
    product_id,
    SKU,
    product_name,
    category,
    color,
    material,
    collection,
    size,
    cost,
    unit_price

FROM RETAIL_ANALYTICS.RAW_DATA.PRODUCTS;
