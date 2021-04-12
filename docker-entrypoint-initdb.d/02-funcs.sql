CREATE FUNCTION example_as_of(
    as_of TIMESTAMP
)
    RETURNS TABLE
            (
                key        example_p.key%TYPE,
                value      example_p.value%TYPE,
                applies_to example_p.applies_to%TYPE
            )
AS
$$
SELECT (key, value, applies_to)
FROM example_p
WHERE (key, applies_to, effective_at) IN (
    SELECT key, applies_to, max(effective_at)
    FROM example_p
    WHERE effective_at <= as_of
    GROUP BY key, applies_to
);
$$
    LANGUAGE SQL
    IMMUTABLE;
