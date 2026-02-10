-- System wait events summary (Oracle 19c)
-- Safe: read-only

SELECT
  event,
  total_waits,
  ROUND(time_waited/100, 2) AS time_waited_sec,
  average_wait
FROM v$system_event
WHERE wait_class <> 'Idle'
ORDER BY time_waited DESC
FETCH FIRST 20 ROWS ONLY;
