CREATE STREAM pageviews (
    page_id BIGINT,
    viewtime BIGINT,
    user_id VARCHAR
  ) WITH (
    KAFKA_TOPIC = 'keyless-pageviews-topic',
    PARTITIONS=2, REPLICAS=1,
    VALUE_FORMAT = 'JSON'
  );


CREATE TABLE counts AS
  SELECT user_id as user_id, sum(viewtime) as totaltime
  FROM pageviews
  WINDOW TUMBLING (SIZE 20 SECONDS)
  GROUP BY user_id
  EMIT CHANGES;
