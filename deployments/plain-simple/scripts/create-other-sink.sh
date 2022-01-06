#!/bin/sh

curl -i -X POST -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
    -d '{
      "name": "other-source-demo-customers",
      "config": {
            "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
            "tasks.max": "1",
            "topics": "pageviews",
            "connection.url": "jdbc:mysql://mysql:3306/demo?verifyServerCertificate=false&useSSL=false&requireSSL=false",
            "auto.create": "true",
            "connection.user": "mysqluser",
            "connection.password": "mysqlpw",
            "dialect.name": "GenericDatabaseDialect",
            "key.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081"
       }
    }'


# curl -X DELETE  http://localhost:18083/connectors/other-source-demo-customers



curl -i -X POST -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
    -d '{
      "name": "h2-sink-connector",
      "config": {
            "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
            "tasks.max": "1",
            "topics": "pageviews",
            "connection.url": "jdbc:h2:tcp://h2:9092/baz",
            "auto.create": "true",
            "connection.user": "sa",
            "connection.password": "tiger",
            "dialect.name": "GenericDatabaseDialect",
            "key.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081"
       }
    }'

    curl -i -X POST -H "Accept:application/json" \
        -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
        -d '{
          "name": "h2-sink-connector",
          "config": {
                "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
                "tasks.max": "1",
                "topics": "pageviews",
                "connection.url": "jdbc:h2:tcp://h2:9092/baz",
                "auto.create": "true",
                "connection.user": "sa",
                "connection.password": "tiger",
                "dialect.name": "H2Dialect",
                "key.converter": "io.confluent.connect.json.JsonSchemaConverter",
                "key.converter.schema.registry.url": "http://schema-registry:8081",
                "value.converter": "io.confluent.connect.json.JsonSchemaConverter",
                "value.converter.schema.registry.url": "http://schema-registry:8081"
           }
        }'

# curl -X DELETE  http://localhost:18083/connectors/h2-sink-connector


curl -i -X POST -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
    -d '{
      "name": "h2-source-connector",
      "config": {
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "tasks.max": "1",
            "table.whitelist": "pageviews",
            "topic.prefix": "bar.",
            "connection.url": "jdbc:h2:tcp://h2:9092/baz",
            "mode": "bulk",
            "connection.user": "sa",
            "connection.password": "tiger",
            "dialect.name": "GenericDatabaseDialect",
            "key.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081"
       }
    }'

# "dialect.name": "GenericDatabaseDialect",
# curl -X DELETE  http://localhost:18083/connectors/h2-source-connector
