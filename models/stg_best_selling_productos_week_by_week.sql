with stg_best_selling_productos_week_by_week AS (
    SELECT
    DATE_TRUNC(purchased_at, WEEK) AS week,
    p.model AS product,
    COUNT(*) AS total_sales
    FROM bigdata-uc-422022.DataSet_UC_Airbyte.purchases AS pur
    JOIN bigdata-uc-422022.DataSet_UC_Airbyte.products AS p ON pur.product_id = p.id
    GROUP BY week, product
    ORDER BY week, total_sales DESC
)

select * from stg_best_selling_productos_week_by_week