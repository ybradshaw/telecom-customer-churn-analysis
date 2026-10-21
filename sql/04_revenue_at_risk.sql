-- Purpose: Quantify revenue associated with churned customers and compare their value with retained customers.

-- 1. Compare monthly charges and historical revenue by status
SELECT customer_status,
COUNT(*) AS customer_count,
ROUND(AVG(monthly_charge), 2) AS avg_monthly_charge,
ROUND(SUM(monthly_charge), 2) AS total_monthly_charge,
ROUND(AVG(total_revenue), 2) AS avg_total_revenue,
ROUND(SUM(total_revenue), 2) AS total_historical_revenue
FROM `myprojects-508312`.telecom.telecom_data
WHERE customer_status IN ('Churned', 'Stayed')
GROUP BY customer_status
ORDER BY customer_status

-- 2. Estimate monthly recurring revenue associated with churned customers by contract
SELECT contract,
COUNTIF(customer_status = 'Churned') AS churned_customers,
ROUND(AVG(IF(customer_status = 'Churned', monthly_charge, NULL)), 2) AS avg_churned_monthly_charge,
ROUND(SUM(IF(customer_status = 'Churned', monthly_charge, 0)), 2) AS monthly_charge_total_at_risk,
ROUND(SAFE_DIVIDE(COUNTIF(customer_status = 'Churned'), 
COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100,2) AS churn_rate_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY contract
ORDER BY monthly_charge_total_at_risk DESC

-- 3. Compare historical revenue distribution by customer status
SELECT customer_status,
COUNT(*) AS customer_count,
ROUND(AVG(total_revenue), 2) AS avg_total_revenue,
APPROX_QUANTILES(total_revenue, 100)[OFFSET(50)] AS median_total_revenue,
APPROX_QUANTILES(total_revenue, 100)[OFFSET(75)] AS p75_total_revenue
FROM `myprojects-508312`.telecom.telecom_data
WHERE customer_status IN ('Churned', 'Stayed')
GROUP BY customer_status
ORDER BY avg_total_revenue DESC
