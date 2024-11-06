SELECT *, DATETIME(timestamp_micros(event_timestamp), 'Europe/Paris') AS event_datetime
FROM `the-.analytics_409026738.events_*` AS events
INNER JOIN `the-.analytics_409026738.pseudonymous_users_*` AS users
ON users.pseudo_user_id = events.user_pseudo_id;