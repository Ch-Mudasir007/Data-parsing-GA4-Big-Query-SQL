WITH _source AS (
  SELECT 
    PARSE_DATE("%Y%m%d", event_date) AS event_date,
    TIMESTAMP_MICROS(event_timestamp) AS event_ts,
    params.*,
    MAX(CASE WHEN params.key = 'ga_session_id' THEN params.value.int_value ELSE NULL END) OVER (PARTITION BY event_timestamp, user_pseudo_id) AS ga_session_id,
    user_id,
    TIMESTAMP_MICROS(user_first_touch_timestamp) AS user_first_touch_ts,
    params.key AS param_key,
    params.value.string_value AS params_string_value,
    params.value.int_value AS params_int_value,
    params.value.float_value AS params_float_value,
    params.value.double_value AS params_double_value,
    traffic_source.name AS channel,
    traffic_source.medium AS utm_medium,
    traffic_source.source AS utm_source,
    geo.continent AS continent,
    geo.sub_continent AS sub_continent, 
    geo.country AS country,
    geo.region AS region,
    geo.city AS city,
    device.category AS device_category,
    device.mobile_brand_name AS device_brand,
    device.mobile_model_name AS device_model,
    device.operating_system AS os,
    device.operating_system_version AS device_os_version,
    device.language AS device_language,
    device.is_limited_ad_tracking AS device_is_limited_ad_tracking,
    device.web_info.browser AS device_browser,
    device.web_info.browser_version AS device_browser_version,
    events.* EXCEPT(event_params, event_date, event_timestamp)
  FROM 
    `the-gallery.analytics_4.events_*` AS events
  LEFT JOIN UNNEST(event_params) AS params
  WHERE 
    PARSE_DATE("%Y%m%d", _table_suffix) >= '2024-03-22'
)
