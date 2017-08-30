#!/bin/bash
max_connections=16
if [ "$#" -ne 1 ]; then
    echo "usage: test_aria.sh TEST_URL"
    echo "exit 1"
    exit 1
fi
aria2c \
    -d /dev \
    -o null \
    --allow-overwrite=true \
    -x $max_connections \
    -s $max_connections \
    $1 \
    --file-allocation=none 

rc=$?
if [[ $rc != 0 ]]; then
    echo "exit $rc"
    exit $rc
fi
