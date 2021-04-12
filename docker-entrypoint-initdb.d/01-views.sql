CREATE VIEW example_latest AS
SELECT key, value, applies_to, effective_at
FROM example_p
WHERE (key, applies_to, effective_at) IN (
    SELECT key, applies_to, max(effective_at)
    FROM example_p
    GROUP BY key, applies_to
);
