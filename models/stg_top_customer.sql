with stg_top_customer AS (
    SELECT
    u.id AS user_id,
    u.name AS user_name,
    EXTRACT(YEAR FROM p.purchased_at) AS year,
    EXTRACT(MONTH FROM p.purchased_at) AS month,
    COUNT(*) AS total_purchases
    FROM DataSet_UC_Airbyte.purchases p
    JOIN DataSet_UC_Airbyte.users u ON p.user_id = u.id
    WHERE p.purchased_at IS NOT NULL
    GROUP BY user_id, user_name, year, month
    ORDER BY year, month, total_purchases DESC
)

select * from stg_top_customer