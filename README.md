# Enterprise Oracle Performance Optimization Framework (Oracle 19c)

![Oracle](https://img.shields.io/badge/Oracle-19c-red)
![Performance Engineering](https://img.shields.io/badge/Focus-Performance%20Engineering-blue)
![SQL Optimization](https://img.shields.io/badge/SQL-Optimization-green)
![Status](https://img.shields.io/badge/Project-Active-success)
![License](https://img.shields.io/badge/License-MIT-yellow)

**Author:** Sultan Mahmood  
**Focus:** Oracle 19c Performance Engineering | SQL Optimization | Cost-Based Optimizer Analysis

## Overview

This project provides a structured, evidence-driven methodology for analyzing and optimizing SQL performance in Oracle Database 19c.

It demonstrates real-world performance engineering using:

- Execution plan analysis (DBMS_XPLAN)
- Runtime statistics (ALLSTATS LAST)
- Cost-Based Optimizer behavior analysis
- Predicate selectivity impact
- Index design strategy
- Logical I/O measurement
- Before vs After benchmarking

This is not theoretical tuning — it is measurable performance engineering.

---

## Demonstrated Performance Impact

### PERF_DEMO Case Study (Oracle 19c)

| Metric | Baseline | Tuned | Improvement |
|---------|----------|--------|------------|
| Logical I/O (Buffers) | 9776 | 1693 | ↓ 83% |
| Execution Time | 0.22s | 0.05s | ↓ 77% |
| Access Path | Full Table Scan | Index Range Scan | Optimized |

### What Changed?

- Created composite index (status, order_date, customer_id)
- Analyzed predicate selectivity
- Observed optimizer access path shift
- Verified measurable logical I/O reduction

---

## Framework Methodology

### 1️⃣ Identify Expensive SQL
- Query V$SQL
- Capture SQL_ID
- Analyze execution statistics

### 2️⃣ Capture Runtime Execution Plan
- Enable statistics_level = ALL
- Use gather_plan_statistics hint
- Extract plan with DBMS_XPLAN.DISPLAY_CURSOR(... 'ALLSTATS LAST')

### 3️⃣ Measure Baseline
- Logical reads (Buffers)
- Actual execution time
- Rows processed
- Access path

### 4️⃣ Apply Tuning Strategy
- Index design
- Predicate optimization
- Join method evaluation
- Cardinality analysis

### 5️⃣ Re-measure and Compare
- Capture new execution plan
- Calculate logical I/O reduction
- Quantify performance improvement

---

## Project Structure

