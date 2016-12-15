#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    create user elexis with password 'elexisTest';
    CREATE DATABASE tst_upgrade;
    GRANT ALL PRIVILEGES ON tst_upgrade TO elexis;
EOSQL

