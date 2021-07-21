#!/usr/bin/env bash

HOME_DIR=`pwd`
NETWORK="plain_default"


 docker run  --network "plain_default" \
      gaiaadm/pumba \
      stress ksqldb-server \
      -d 30m
