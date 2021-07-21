CREATE STREAM pageviews (
    page_id BIGINT,
    viewtime BIGINT,
    user_id VARCHAR
  ) WITH (
    KAFKA_TOPIC = 'keyless-pageviews-topic',
    PARTITIONS=2, REPLICAS=1,
    VALUE_FORMAT = 'JSON'
  );


CREATE OR REPLACE TABLE counts AS
  SELECT user_id as user_id, sum(viewtime) as totaltime
  FROM pageviews
  WINDOW TUMBLING (SIZE 20 SECONDS)
  GROUP BY user_id
  EMIT CHANGES;
 
  /*
  Cannot upgrade data source: DataSource '`COUNTS`' has schema = `USER_ID` STRING KEY,
  `TOTALTIME` BIGINT which is not upgradeable to `USER_ID` STRING KEY, `TOTALTIME` DOUBLE.
   (The following columns are changed, missing or reordered: [`TOTALTIME` BIGINT])

  when changing sum for avg as function
  *
