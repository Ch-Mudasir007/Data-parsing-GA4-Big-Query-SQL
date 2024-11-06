event_aggregated AS (
  SELECT 
    event_date,
    event_ts,
    ga_session_id,
    user_pseudo_id,
    user_first_touch_ts,
    event_name,
    MAX(CASE WHEN param_key = 'page_title' THEN params_string_value ELSE NULL END) AS page_title,
    MAX(CASE WHEN param_key = 'page_location' THEN params_string_value ELSE NULL END) AS page_location,
    MAX(CASE WHEN param_key = 'page_referrer' THEN params_string_value ELSE NULL END) AS page_referrer,
    MAX(channel) AS channel,
    MAX(utm_medium) AS utm_medium,
    MAX(utm_source) AS utm_source,
    MAX(continent) AS continent,
    MAX(sub_continent) AS sub_continent,
    MAX(country) AS country,
    MAX(region) AS region,
    MAX(city) AS city,
    MAX(device_category) AS device_category,
    MAX(device_brand) AS device_brand,
    MAX(device_model) AS device_model,
    MAX(os) AS device_os,
    MAX(device_os_version) AS device_os_version,
    MAX(device_language) AS device_language,
    MAX(device_is_limited_ad_tracking) AS device_is_limited_ad_tracking,
    MAX(device_browser) AS device_browser,
    MAX(device_browser_version) AS device_browser_version
  FROM _source
  GROUP BY event_date, event_ts, ga_session_id, user_pseudo_id, user_first_touch_ts, event_name 
)
