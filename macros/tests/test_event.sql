{% macro test_even(model, column_name) %}
    SELECT {{ column_name}}
    FROM {{ model }}
    WHERE MOD({{column_name}}, 2) <> 0
{% endmacro %}