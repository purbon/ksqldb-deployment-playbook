
/* will replace the stream if user has permissions to write new commands and access to the backend topic*/
CREATE OR REPLACE STREAM pageviews (
    page_id BIGINT,
    viewtime BIGINT,
    user_id VARCHAR,
    name VARCHAR
  ) WITH (
    KAFKA_TOPIC = 'keyless-pageviews-topic',
    VALUE_FORMAT = 'JSON'
  );

/* change of topic will break the upgrade as is not a valid operation*/
  CREATE OR REPLACE STREAM pageviews (
      page_id BIGINT,
      viewtime BIGINT,
      user_id VARCHAR,
      name VARCHAR
    ) WITH (
      KAFKA_TOPIC = 'keyless-pageviews-topic2',
      VALUE_FORMAT = 'JSON'
    );

/* removal of attribute is as well not supported during replace of stream */
CREATE OR REPLACE STREAM pageviews (
        page_id BIGINT,
        viewtime BIGINT,
        user_id VARCHAR
      ) WITH (
        KAFKA_TOPIC = 'keyless-pageviews-topic',
        VALUE_FORMAT = 'JSON'
      );

/* should break because the stream pageviews already exist*/

CREATE TABLE acounts AS
  SELECT user_id as user_id, sum(viewtime) as totaltime
  FROM pageviews
  WINDOW TUMBLING (SIZE 20 SECONDS)
  GROUP BY user_id
  EMIT CHANGES;

  INSERT INTO pageviews VALUES (1, 3, '1234', 'foobar');
  INSERT INTO pageviews VALUES (2, 30, '1234', 'foobar');
