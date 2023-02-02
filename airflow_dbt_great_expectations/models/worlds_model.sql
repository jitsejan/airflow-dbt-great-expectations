{{ config(materialized='table') }}

WITH
    names AS (SELECT * FROM {{ ref('world_names')}}),
    aliases AS (SELECT * FROM {{ ref('world_aliases')}}),

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
