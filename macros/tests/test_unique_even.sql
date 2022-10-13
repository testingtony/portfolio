{% macro test_unique_even(model, column_name) %}
{{ config(fail_calc = "SUM(CASE WHEN result = 'FAIL' THEN 1 ELSE 0 END)") }}
WITH unique_test AS (
    {{- test_unique(model, column_name) -}}
)
, even_test AS (
    {{- test_even(model, column_name) -}}
)
, results AS (
    SELECT
        'unique' AS "test name",
        COUNT(1) AS "errors",
        CASE WHEN COUNT(1) = 0 THEN 'pass' ELSE 'FAIL' END AS "result"
    FROM unique_test

    UNION ALL
    SELECT 
        'even' AS "test name",
        COUNT(1) AS "errors", 
        CASE WHEN COUNT(1) = 0 THEN 'pass' ELSE 'FAIL' END AS "result"
    FROM even_test
)
SELECT *
FROM results
{% endmacro %}