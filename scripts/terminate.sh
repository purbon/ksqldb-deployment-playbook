#!/usr/bin/env bash


curl -X "POST" "http://localhost:8088/ksql" \
     -H "Content-Type: application/vnd.ksql.v1+json; charset=utf-8" \
     -d $'{
  "ksql": "TERMINATE CTAS_COUNTS_3;",
  "streamsProperties": {}
}'



curl -X "POST" "http://localhost:8088/ksql" \
     -H "Content-Type: application/vnd.ksql.v1+json; charset=utf-8" \
     -d $'{
  "ksql": "show queries extended;",
  "streamsProperties": {}
}' | jq .


curl -X "POST" "http://localhost:8088/ksql/terminate" \
     -H "Content-Type: application/vnd.ksql.v1+json; charset=utf-8" \
     -d $'{}' | jq .
