SELECT *
FROM `the-.analytics_409026738.merged_data`
WHERE PARSE_DATE("%Y%m%d", _Table_suffix) > DATE_ADD(CURRENT_DATE(), INTERVAL -3 DAY)
  AND _table_suffix NOT LIKE "%intr%";
