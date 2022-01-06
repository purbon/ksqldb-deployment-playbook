FROM confluentinc/cp-kafka-connect:7.0.1

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"

COPY tx.avro /tx.avro
COPY users.avro /users.avro


RUN confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:0.5.0 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.2.0

#COPY mysql-connector-java-8.0.26.jar /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc
