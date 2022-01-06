#!/bin/sh

curl -i -X POST -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
    -d '{
      "name": "mysql-source-demo-customers",
      "config": {
            "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
            "tasks.max": "1",
            "topics": "pageviews",
            "connection.url": "jdbc:mysql://mysql:3306/demo?verifyServerCertificate=false&useSSL=false&requireSSL=false",
            "auto.create": "true",
            "connection.user": "mysqluser",
            "connection.password": "mysqlpw",
            "dialect.name": "MySqlDatabaseDialect",
            "key.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.json.JsonSchemaConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081"
       }
    }'


# curl -X DELETE  http://localhost:18083/connectors/mysql-source-demo-customers
