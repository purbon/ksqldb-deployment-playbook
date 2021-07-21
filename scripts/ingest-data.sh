#!/usr/bin/env bash

HOME_DIR=`pwd`
NETWORK="plain_default"

docker run -v $HOME_DIR:/plain --network $NETWORK \
    confluentinc/ksql-examples ksql-datagen \
    bootstrap-server=broker:9092 \
    quickstart=pageviews \
    topic=pageviews \
    iterations=500000000
