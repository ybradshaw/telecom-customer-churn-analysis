-- Purpose: Identify customer segments associated with higher churn rates.

-- 1. Calculate churn rate by contract type
SELECT contract,
COUNTIF(customer_status = 'Churned') AS churned_customers,
COUNTIF(customer_status IN ('Churned', 'Stayed')) AS churned_stayed_customers,
ROUND(SAFE_DIVIDE(COUNTIF(customer_status = 'Churned'), COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100, 2) AS churn_rate_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY contract
ORDER BY churn_rate_pct DESC

-- 2. Calculate churn rate by tenure group
SELECT CASE 
WHEN tenure_in_months < 10 THEN '0-9 months'
WHEN tenure_in_months < 20 THEN '10-19 months'
WHEN tenure_in_months < 30 THEN '20-29 months'
WHEN tenure_in_months < 40 THEN '30-39 months'
WHEN tenure_in_months < 50 THEN '40-49 months'
ELSE '50+ months'
END AS tenure_group,
COUNTIF(customer_status = 'Churned') AS churned_customers,
COUNTIF(customer_status IN ('Churned', 'Stayed')) AS churned_stayed_customers,
ROUND(SAFE_DIVIDE( COUNTIF(customer_status = 'Churned'), COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100,2) AS churn_rate_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY tenure_group
ORDER BY churn_rate_pct DESC

-- 3. Calculate churn rate by internet type
SELECT internet_type,
COUNTIF(customer_status IN ('Churned', 'Stayed')) AS existing_customers,
COUNTIF(customer_status = 'Churned') AS churned_customers,
ROUND(SAFE_DIVIDE(COUNTIF(customer_status = 'Churned'),COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100, 2) AS churn_rate_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY internet_type
ORDER BY churn_rate_pct DESC

-- 4. Compare churn across monthly charge groups
SELECT CASE
WHEN monthly_charge < 0 THEN 'Negative'
WHEN monthly_charge < 10 THEN '$0-9'
WHEN monthly_charge < 20 THEN '$10-19'
WHEN monthly_charge < 30 THEN '$20-29'
WHEN monthly_charge < 40 THEN '$30-39'
WHEN monthly_charge < 50 THEN '$40-49'
WHEN monthly_charge < 60 THEN '$50-59'
WHEN monthly_charge < 70 THEN '$60-69'
WHEN monthly_charge < 80 THEN '$70-79'
WHEN monthly_charge < 90 THEN '$80-89'
WHEN monthly_charge < 100 THEN '$90-99'
WHEN monthly_charge < 110 THEN '$100-109'
ELSE '$110+'
END AS monthly_charge_group,
COUNTIF(customer_status IN ('Churned', 'Stayed')) AS existing_customers,
COUNTIF(customer_status = 'Churned') AS churned_customers,
ROUND(SAFE_DIVIDE(COUNTIF(customer_status = 'Churned'), COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100, 2) AS churn_rate_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY monthly_charge_group
ORDER BY churn_rate_pct DESC

-- 5. Calculate churn rate by payment method
SELECT payment_method,
COUNTIF(customer_status IN ('Churned', 'Stayed')) AS existing_customers,
COUNTIF(customer_status = 'Churned') AS churned_customers,
ROUND(SAFE_DIVIDE(COUNTIF(customer_status = 'Churned'), COUNTIF(customer_status IN ('Churned', 'Stayed'))) * 100, 2) AS churn_rate_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY payment_method
ORDER BY churn_rate_pct DESC
