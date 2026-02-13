# HR_DEMO_SLOW - Evidence (Oracle 19c)

## Query
```sql
SELECT /*+ gather_plan_statistics HR_DEMO_SLOW */
       e.department_id,
       COUNT(*) AS emp_count
FROM employees e
JOIN job_history j
  ON j.employee_id = e.employee_id
GROUP BY e.department_id
ORDER BY emp_count DESC;