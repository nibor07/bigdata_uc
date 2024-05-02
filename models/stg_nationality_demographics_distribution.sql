with stg_nationality_demographics_distribution AS (
    SELECT 
        nationality,age, gender,
        COUNT(*) as count
    FROM DataSet_UC_Airbyte.users
    GROUP BY nationality,age, gender
)

select * from stg_nationality_demographics_distribution