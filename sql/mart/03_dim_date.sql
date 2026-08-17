-- ============================================================
-- Retail Analytics Data Platform
-- MART: Date Dimension
-- ============================================================
--
-- Purpose:
-- Create a calendar dimension for time-based analysis.
--
-- Source:
-- Generated using Snowflake GENERATOR
--
-- Target:
-- RETAIL_ANALYTICS.MART.DIM_DATE
--
-- Grain:
-- One row per calendar date
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.MART.DIM_DATE AS

SELECT
    DATEADD(day, seq4(), '2024-01-01') AS date,

    YEAR(DATEADD(day, seq4(), '2024-01-01')) AS year,

    QUARTER(DATEADD(day, seq4(), '2024-01-01')) AS quarter,

    MONTH(DATEADD(day, seq4(), '2024-01-01')) AS month,

    MONTHNAME(DATEADD(day, seq4(), '2024-01-01')) AS month_name,

    WEEK(DATEADD(day, seq4(), '2024-01-01')) AS week,

    DAYOFWEEK(DATEADD(day, seq4(), '2024-01-01')) AS day_of_week,

    DAYNAME(DATEADD(day, seq4(), '2024-01-01')) AS day_name

FROM TABLE(GENERATOR(ROWCOUNT => 1095));
