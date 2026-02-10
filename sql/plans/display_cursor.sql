-- Display actual execution plan from cursor cache (Oracle 19c)
-- Usage:
-- VAR sql_id VARCHAR2(13); EXEC :sql_id := 'xxxxxxxxxxxxx';
-- VAR child_no NUMBER;     EXEC :child_no := 0;
-- Then run this script.
--
-- Safe: read-only

SELECT *
FROM TABLE(
  DBMS_XPLAN.DISPLAY_CURSOR(
    sql_id => :sql_id,
    cursor_child_no => :child_no,
    format => 'ALLSTATS LAST +PEEKED_BINDS +OUTLINE'
  )
);
