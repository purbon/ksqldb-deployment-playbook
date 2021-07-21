CREATE STREAM pageviews (
    viewtime bigint,
    userid varchar,
    pageid varchar
  ) WITH (
    kafka_topic='pageviews',
    value_format='JSON',
    PARTITIONS=3, REPLICAS=1
  );


  CREATE OR REPLACE TABLE counts AS
      SELECT userid, sum(viewtime) as totaltime
      FROM pageviews
      GROUP BY userid
      EMIT CHANGES;



  CREATE OR REPLACE TABLE counts AS
    SELECT userid as user_id, sum(viewtime) as totaltime
    FROM pageviews
    WINDOW TUMBLING (SIZE 20 SECONDS)
    GROUP BY user_id
    EMIT CHANGES;
