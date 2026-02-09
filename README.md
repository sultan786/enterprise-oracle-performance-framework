# Enterprise Oracle Performance Optimization Framework (Oracle 19c)

A production-oriented toolkit for diagnosing, analyzing, and improving Oracle Database performance in enterprise environments.

## Scope
- Target: Oracle Database 19c
- Focus: SQL performance diagnostics, plan inspection, safe tuning workflow, and audit-friendly logging

## Repository structure
- `sql/diagnostics` : read-only scripts (top SQL, waits, blocking, stats health)
- `sql/plans`       : plan inspection helpers (DBMS_XPLAN)
- `sql/maintenance` : controlled maintenance scripts (stats, index guidance)
- `plsql/logging`   : structured tuning logs (before/after + change summary)
- `docs/`           : methodology & architecture
- `examples/`       : demo runbook & reproducible cases

## Quick start
1. Connect to your PDB service (e.g., `ORCLPDB`)
2. Run diagnostic scripts in `sql/diagnostics`
3. Use `plsql/logging` to record before/after tuning evidence
4. Capture a runbook in `examples/runbook.md`

## Author
Sultan Mahmood
