with stg_sales_volume_trend AS (

    SELECT
        EXTRACT(YEAR FROM purchased_at) AS year,
        EXTRACT(MONTH FROM purchased_at) AS month,
        COUNT(*) AS volume
    FROM DataSet_UC_Airbyte.purchases
    GROUP BY EXTRACT(YEAR FROM purchased_at), EXTRACT(MONTH FROM purchased_at)
    ORDER BY year, month

)

select * from stg_sales_volume_trend