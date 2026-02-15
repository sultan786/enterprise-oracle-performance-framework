# PERF_DEMO Case Study – Index-Based Performance Optimization (Oracle 19c)

## Scenario

A reporting query filtering by:
- status = 'PAID'
- order_date >= SYSDATE - N
- Join on customer_id

Initial execution resulted in FULL TABLE SCAN on ORDERS.

## Baseline (Full Table Scan)

- Buffers: 9776
- A-Time: 0.22s
- Access Path: TABLE ACCESS FULL ORDERS
- Join Method: HASH JOIN

## Tuning Approach

1. Created composite index:
   (status, order_date, customer_id)
2. Analyzed data selectivity
3. Adjusted predicate selectivity (SYSDATE - 1)
4. Re-evaluated execution plan

## Result (Index Range Scan)

- Buffers: 1693
- A-Time: 0.05s
- Access Path: INDEX RANGE SCAN + TABLE ACCESS BY ROWID

## Improvement

- Logical I/O reduced by ~83%
- Execution time improved by ~77%
- Optimizer automatically switched access path

## Key Learning

Cost-Based Optimizer decisions depend heavily on:
- Predicate selectivity
- Data distribution
- Table size
- Logical I/O cost estimation

Index creation alone does not guarantee usage.
Selectivity drives optimizer decisions.
