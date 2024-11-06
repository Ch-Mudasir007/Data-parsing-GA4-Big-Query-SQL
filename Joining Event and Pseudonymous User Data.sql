SELECT *, DATETIME(timestamp_micros(event_timestamp), 'Europe/Paris') AS event_datetime
FROM `the-.analytics_.events_*` AS events
INNER JOIN `the-.analytics_.pseudonymous_users_*` AS users
ON users.pseudo_user_id = events.user_pseudo_id;
