-- ============================================================
-- Retail Analytics Data Platform
-- MART: Product Dimension
-- ============================================================
--
-- Purpose:
-- Create the product dimension used for analytical reporting.
--
-- Source:
-- RETAIL_ANALYTICS.STAGING.STG_PRODUCTS
--
-- Target:
-- RETAIL_ANALYTICS.MART.DIM_PRODUCT
--
-- Grain:
-- One row per product
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.MART.DIM_PRODUCT AS

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

FROM RETAIL_ANALYTICS.STAGING.STG_PRODUCTS;