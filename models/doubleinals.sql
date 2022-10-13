SELECT
    id * 2 AS id,
    CONCAT("name", ' times two') AS "name"
FROM
    {{ ref('ordinals') }}

-- UNION
-- SELECT 23, 'twenty three'
