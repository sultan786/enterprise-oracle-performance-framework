-- Top SQL by total elapsed time (Oracle 19c)
-- Safe: read-only

SELECT *
FROM (
  SELECT
    sql_id,
    plan_hash_value,
    executions,
    ROUND(elapsed_time/1e6, 2) AS elapsed_sec_total,
    ROUND((elapsed_time/NULLIF(executions,0))/1e6, 6) AS elapsed_sec_avg,
    ROUND(cpu_time/1e6, 2) AS cpu_sec_total,
    buffer_gets,
    disk_reads,
    rows_processed,
    parsing_schema_name,
    module,
    SUBSTR(REPLACE(REPLACE(sql_text, CHR(10), ' '), CHR(13), ' '), 1, 120) AS sql_text_120
  FROM v$sql
  WHERE executions > 0
  ORDER BY elapsed_time DESC
)
WHERE ROWNUM <= 20;
