#!/bin/bash

set -x

CURRENT_DIR=$(
    cd $(dirname $0)
    pwd
)
DIR=$SCRIPT_DIR/../admin/
export MYSQL_HOST=${MYSQL_HOST:-127.0.0.1}
export MYSQL_PORT=13306
export LANG="C.UTF-8"
# mysql -h $MYSQL_HOST -P $MYSQL_PORT -uroot -pisucon -e "SET @@global.sql_mode='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';"
$CURRENT_DIR/../webapp/mysql/db/init.sh
