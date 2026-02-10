-- Blocking and blocked sessions overview (Oracle 19c)
-- Safe: read-only

WITH sess AS (
  SELECT
    s.sid,
    s.serial#,
    s.username,
    s.status,
    s.machine,
    s.program,
    s.module,
    s.sql_id,
    s.event,
    s.wait_class,
    s.seconds_in_wait,
    s.blocking_session,
    s.blocking_session_status
  FROM v$session s
  WHERE s.type = 'USER'
)
SELECT
  b.sid || ',' || b.serial#                       AS blocked_session,
  b.username                                      AS blocked_user,
  b.status                                        AS blocked_status,
  b.machine                                       AS blocked_machine,
  b.program                                       AS blocked_program,
  b.module                                        AS blocked_module,
  b.sql_id                                        AS blocked_sql_id,
  b.event                                         AS blocked_event,
  b.seconds_in_wait                               AS blocked_seconds,
  bl.sid || ',' || bl.serial#                     AS blocking_session,
  bl.username                                     AS blocking_user,
  bl.status                                       AS blocking_status,
  bl.machine                                      AS blocking_machine,
  bl.program                                      AS blocking_program,
  bl.module                                       AS blocking_module,
  bl.sql_id                                       AS blocking_sql_id
FROM sess b
LEFT JOIN sess bl
  ON bl.sid = b.blocking_session
WHERE b.blocking_session IS NOT NULL
ORDER BY b.seconds_in_wait DESC;
