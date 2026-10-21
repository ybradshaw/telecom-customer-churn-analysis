-- Purpose: Compare customer profiles, tenure, charges, revenue, and service preferences by customer status.

-- 1. Compare key customer metrics by status
SELECT customer_status,
COUNT(*) AS customer_count,
ROUND(AVG(age), 1) AS avg_age,
ROUND(AVG(tenure_in_months), 1) AS avg_tenure_months,
ROUND(AVG(monthly_charge), 2) AS avg_monthly_charge,
ROUND(AVG(total_revenue), 2) AS avg_total_revenue,
ROUND(AVG(number_of_dependents), 2) AS avg_dependents,
ROUND(AVG(number_of_referrals), 2) AS avg_referrals
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY customer_status
ORDER BY customer_count DESC

-- 2. Compare contract preferences by customer status
SELECT contract, customer_status,COUNT(*) AS customer_count
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY contract, customer_status
ORDER BY contract, customer_status

-- 3. Compare internet types by customer status
SELECT internet_type, customer_status, COUNT(*) AS customer_count
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY internet_type, customer_status
ORDER BY internet_type, customer_status

-- 4. Compare optional service adoption by customer status
SELECT customer_status,
COUNT(*) AS customer_count,
ROUND(AVG(IF(online_security, 1, 0)) * 100, 2) AS online_security_adoption_pct,
ROUND(AVG(IF(online_backup, 1, 0)) * 100, 2) AS online_backup_adoption_pct,
ROUND(AVG(IF(device_protection_plan, 1, 0)) * 100, 2) AS device_protection_adoption_pct,
ROUND(AVG(IF(premium_tech_support, 1, 0)) * 100, 2) AS premium_support_adoption_pct
FROM `myprojects-508312`.telecom.telecom_data
GROUP BY customer_status
ORDER BY customer_status
