-- Purpose: Prioritize customer segments for retention initiatives based on churn rate, churn volume, and monthly charges at risk.

WITH segment_metrics AS (
SELECT contract,
COUNTIF(customer_status IN ('Churned', 'Stayed')) AS existing_customers,
COUNTIF(customer_status = 'Churned') AS churned_customers,
ROUND(SAFE_DIVIDE(COUNTIF(customer_status = 'Churned'), COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100, 2) AS churn_rate_pct,
ROUND(AVG(IF(customer_status = 'Churned', monthly_charge, NULL)), 2) AS avg_churned_monthly_charge,
ROUND(SUM(IF(customer_status = 'Churned', monthly_charge, 0)), 2) AS monthly_charge_total_at_risk
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY contract
)

SELECT contract, existing_customers, churned_customers, churn_rate_pct, avg_churned_monthly_charge, monthly_charge_total_at_risk,
CASE
WHEN churn_rate_pct >= 40 AND churned_customers >= 100 THEN 'High'
WHEN churn_rate_pct >= 25 AND churned_customers >= 50 THEN 'Medium'
ELSE 'Further investigation'
END AS retention_priority
FROM segment_metrics
ORDER BY
CASE
WHEN churn_rate_pct >= 40 AND churned_customers >= 100 THEN 1
WHEN churn_rate_pct >= 25 AND churned_customers >= 50 THEN 2
ELSE 3
END,
monthly_charge_total_at_risk DESC
