with stg_products_with_falling_sales AS (

    WITH sales_period_comparison AS (
    SELECT 
        pr.id as product_id,
        pr.model as product_model,
        EXTRACT(YEAR FROM p.purchased_at) as year,
        EXTRACT(MONTH FROM p.purchased_at) as month,
        COUNT(*) as monthly_sales
    FROM DataSet_UC_Airbyte.purchases p
    JOIN DataSet_UC_Airbyte.products pr ON p.product_id = pr.id
    GROUP BY product_id, product_model, year, month
    ),
    monthly_change AS (
    SELECT 
        *,
        LAG(monthly_sales) OVER (PARTITION BY product_id ORDER BY year, month) as prev_month_sales
    FROM sales_period_comparison
    )
    SELECT 
    product_id,
    product_model,
    year,
    month,
    monthly_sales,
    prev_month_sales,
    (monthly_sales - prev_month_sales) as sales_change
    FROM monthly_change
    WHERE monthly_sales < prev_month_sales

)

select * from stg_products_with_falling_sales