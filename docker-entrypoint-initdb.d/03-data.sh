#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 "$POSTGRES_DB" "$POSTGRES_USER" <<EOSQL
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('A', 3, '2021-02-01', '2021-02-01');
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('B', 17, '2021-02-01', '2021-02-01');
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('A', 4, '2021-02-01', '2021-02-02');
INSERT INTO example_p (key, value, applies_to, effective_at)
VALUES ('A', 2, '2021-02-01', '2021-02-03');
EOSQL
