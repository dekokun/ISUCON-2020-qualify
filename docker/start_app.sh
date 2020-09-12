#!/bin/bash
CURRENT_DIR=$(
    cd $(dirname $0)
    pwd
)
cd $CURRENT_DIR/../webapp/rust/
export MYSQL_PORT=13306
export MYSQL_HOST=host.docker.internal
make rundev
