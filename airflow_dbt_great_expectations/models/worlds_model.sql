
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

WITH
    names AS (SELECT * FROM test.world_names),
    aliases AS (SELECT * FROM test.world_aliases),

    joined AS (
        SELECT
            names.id,
            names.name,
            aliases.alias,
            names.description
        FROM
            names
            LEFT JOIN aliases ON names.name = aliases.name
    )

SELECT *
FROM joined
