#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER elexistest  UNENCRYPTED  PASSWORD 'elexisTestPassword';
    GRANT ALL PRIVILEGES ON DATABASE elexistest TO elexistest;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO elexistest;
EOSQL
