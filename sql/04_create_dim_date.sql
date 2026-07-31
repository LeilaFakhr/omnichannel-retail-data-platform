-- Create Date Dimension

CREATE OR REPLACE TABLE dim_date AS

SELECT

    DATEADD(day, seq4(), '2024-01-01') AS date,

    YEAR(DATEADD(day, seq4(), '2024-01-01')) AS year,

    MONTH(DATEADD(day, seq4(), '2024-01-01')) AS month,

    MONTHNAME(DATEADD(day, seq4(), '2024-01-01')) AS month_name,

    QUARTER(DATEADD(day, seq4(), '2024-01-01')) AS quarter,

    DAYOFWEEK(DATEADD(day, seq4(), '2024-01-01')) AS day_of_week


FROM TABLE(GENERATOR(ROWCOUNT => 1095));