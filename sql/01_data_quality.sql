-- Purpose: Check dataset completeness, customer ID uniqueness, and potential data quality issues.

-- 1. Check total rows and unique customers
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT customer_id) AS unique_customers
FROM `myprojects-508312`.telecom.telecom_data

-- 2. Check customer status distribution
SELECT customer_status, COUNT(*) AS customer_count,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_customers
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY customer_status
ORDER BY customer_count DESC

-- 3. Identify duplicate customer IDs
SELECT customer_id, COUNT(*) AS record_count
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY record_count DESC;

-- 4. Check missing values
SELECT
COUNTIF(customer_id IS NULL) AS missing_customer_id,
COUNTIF(customer_status IS NULL) AS missing_customer_status,
COUNTIF(tenure_in_months IS NULL) AS missing_tenure,
COUNTIF(monthly_charge IS NULL) AS missing_monthly_charge,
COUNTIF(total_revenue IS NULL) AS missing_total_revenue
FROM `myprojects-508312`.telecom.telecom_data

-- 5. Investigate zero and negative monthly charges
SELECT
COUNTIF(monthly_charge < 0) AS negative_monthly_charges,
COUNTIF(monthly_charge = 0) AS zero_monthly_charges,
MIN(monthly_charge) AS minimum_monthly_charge,
MAX(monthly_charge) AS maximum_monthly_charge
FROM `myprojects-508312`.telecom.telecom_data
