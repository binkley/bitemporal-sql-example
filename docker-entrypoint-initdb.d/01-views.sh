#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 "$POSTGRES_DB" "$POSTGRES_USER" <<EOSQL
CREATE VIEW example_latest AS SELECT * from example_p WHERE (key, applies_to, effective_at) IN (SELECT key, applies_to, max(effective_at) FROM example_p GROUP BY key, applies_to);
EOSQL
