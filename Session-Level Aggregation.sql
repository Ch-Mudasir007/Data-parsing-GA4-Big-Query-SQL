sessions AS (
  SELECT
    ga_session_id,
    user_pseudo_id,
    MIN(event_date) AS date,
    MIN(user_first_touch_ts) AS user_first_touch_ts,
    MAX(channel) AS channel,
    MAX(utm_medium) AS utm_medium,
    MAX(utm_source) AS utm_source,
    MAX(page_title) AS page_title,
    MAX(page_location) AS page_location,
    MAX(page_referrer) AS page_referrer,
    MAX(continent) AS continent,
    MAX(country) AS country,
    MAX(device_category) AS device_category,
    MAX(device_os) AS device_os,
    MAX(device_browser) AS device_browser
  FROM event_aggregated
  GROUP BY ga_session_id, user_pseudo_id
  ORDER BY date DESC
)
