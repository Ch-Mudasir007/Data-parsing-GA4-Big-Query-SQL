SELECT 
  PARSE_DATE("%Y%m%d", event_date) AS event_date,
  TIMESTAMP_MICROS(event_timestamp) AS event_ts,
  params.*,
  MAX(CASE WHEN params.key = "stream_id" THEN params.value.int_value ELSE NULL END) OVER (PARTITION BY event_timestamp, user_pseudo_id) AS stream_id,
  events.* EXCEPT(event_params, event_date, event_timestamp)
FROM `the-.analytics_409026738.events_*` AS events
LEFT JOIN UNNEST(event_params) AS params
WHERE PARSE_DATE("%Y%m%d", _Table_suffix) >= '2024-03-22';
