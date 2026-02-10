-- Top SQL by logical reads (buffer gets) (Oracle 19c)
-- Safe: read-only

SELECT *
FROM (
  SELECT
    sql_id,
    plan_hash_value,
    executions,
    buffer_gets                                   AS buffer_gets_total,
    ROUND(buffer_gets/NULLIF(executions,0), 2)    AS buffer_gets_avg,
    ROUND(elapsed_time/1e6, 2)                    AS elapsed_sec_total,
    ROUND((elapsed_time/NULLIF(executions,0))/1e6, 6) AS elapsed_sec_avg,
    ROUND(cpu_time/1e6, 2)                        AS cpu_sec_total,
    disk_reads,
    rows_processed,
    parsing_schema_name,
    module,
    SUBSTR(REPLACE(REPLACE(sql_text, CHR(10), ' '), CHR(13), ' '), 1, 120) AS sql_text_120
  FROM v$sql
  WHERE executions > 0
  ORDER BY buffer_gets DESC
)
WHERE ROWNUM <= 25;
