#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 "$POSTGRES_DB" "$POSTGRES_USER" <<'EOSQL'
CREATE FUNCTION example_as_of (
    as_of TIMESTAMP
)
RETURNS TABLE(
    key example_p.key%TYPE,
    value example_p.value%TYPE,
    applies_to example_p.applies_to%TYPE,
    effective_at example_p.effective_at%TYPE
)
AS $$
    SELECT (key, value, applies_to, effective_at) from example_p
    WHERE (key, applies_to, effective_at) IN (
        SELECT key, applies_to, max(effective_at)
        FROM example_p
        WHERE effective_at <= as_of
        GROUP BY key, applies_to
    );
$$
LANGUAGE SQL
IMMUTABLE
EOSQL
