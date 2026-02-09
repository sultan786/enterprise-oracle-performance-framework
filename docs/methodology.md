# Performance Tuning Methodology (Oracle 19c)

Evidence-driven tuning workflow:
1) Identify hotspots (Top SQL / waits / blocking)
2) Inspect plan (DBMS_XPLAN)
3) Apply controlled change (stats/index/query rewrite)
4) Measure before/after
5) Document and log outcomes
