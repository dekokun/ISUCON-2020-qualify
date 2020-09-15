#!/bin/bash
CURRENT_DIR=$(
    cd $(dirname $0)
    pwd
)
cd $CURRENT_DIR/../webapp/rust/
export CARGO_HOME=/webapp/cargo_home
make rundev
