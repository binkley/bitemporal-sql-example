#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 "$POSTGRES_DB" "$POSTGRES_USER" <<EOSQL
EOSQL
