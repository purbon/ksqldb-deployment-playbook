select user_id, sum(viewtime)
FROM pageviews
WINDOW TUMBLING (SIZE 20 SECONDS)
GROUP BY user_id
EMIT CHANGES;
