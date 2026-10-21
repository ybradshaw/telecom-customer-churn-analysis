# SQL Analysis Findings

## Data Quality

- **Total records:** 7,043.
- **Unique customers:** 7,043.
- **Duplicate customer IDs:** None found.
- **Missing values:** No missing values were found in customer_id, customer_status, tenure_in_months, monthly_charge, or total_revenue.
- **Negative monthly charges:** 120 customers have negative monthly charges; no customers have a zero monthly charge. The minimum monthly charge is -$10.00 and the maximum is $118.75. 

## Customer Churn

- **Customer status:** 1,869 Churned, 4,720 Stayed, and 454 Joined.
- **Overall churn rate:** 28.37% among existing customers (Churned + Stayed).
- **Highest-risk contract:** Month-to-month, with a 51.69% churn rate (1,655 churned out of 3,202 existing customers).
- **Highest-risk tenure segment:** Customers with 0–9 months of tenure, with a 66.45% churn rate (923 churned out of 1,389 existing customers).
- **Highest-risk internet type:** Fiber Optic, with a 42.13% churn rate (1,236 churned out of 2,934 existing customers).
- **Other notable associations:** The churn rate is 41.40% among customers paying by mailed check and 35.65% among customers using bank withdrawal, compared with 15.81% among credit-card customers. In the Excel analysis, customers aged 65+ also had a higher churn rate than younger customers.
- **Optional services:** Adoption rates for online security, online backup, device protection, and premium tech support are lower among churned customers than among retained customers. This is an association, not proof that service adoption prevents churn.
- **Internet type note:** The `internet_type` value is `NULL` for 1,344 customers. Their churn rate is 8.41%. Confirm the meaning of these nulls in the data dictionary before labeling them as customers without internet service.

## Revenue at Risk

- **Average monthly charge of churned customers:** $73.35.
- **Average monthly charge of retained customers:** $61.74.
- **Difference in average monthly charge:** $11.61 higher among churned customers (approximately 18.8%).
- **Monthly charges associated with churned customers:** $137,086.65 per month, based on the current monthly charges of churned customers.
- **Contract segment with the highest monthly charges at risk:** Month-to-month, at $118,802.90 per month. This segment includes 1,655 churned customers and has a 51.69% churn rate.
- **Historical revenue:** Average total revenue was $1,971.35 for churned customers and $3,735.68 for retained customers. Median total revenue was $893.55 for churned customers and $2,959.89 for retained customers.

## Retention Priorities

1. **Prioritize month-to-month customers.** This segment has the highest churn rate (51.69%), the largest number of churned customers (1,655), and the largest monthly charges associated with churned customers ($118,802.90).
2. **Focus on early-tenure customers.** Customers with 0–9 months of tenure have a 66.45% churn rate. Consider reviewing onboarding, early customer experience, and proactive support for this group.
3. **Investigate Fiber Optic customers.** Their churn rate is 42.13%, the highest among the listed internet types. Further analysis should explore pricing, service issues, and customer needs before deciding on interventions.
4. **Review payment-method differences.** Churn is higher among customers paying by mailed check or bank withdrawal than among credit-card customers. Investigate possible differences in customer profile and payment experience before interpreting this as a direct relationship.
5. **Investigate negative monthly charges.** Validate the 120 negative-charge records to understand whether they reflect credits, adjustments, or data-quality issues.

## Business Implications

- Month-to-month customers are the clearest first priority for retention because they combine a high churn rate with a high volume of churned customers and monthly charges associated with churn.
- The first 9 months appear to be a critical retention period, so early engagement and onboarding are reasonable areas to investigate.
- Churned customers have higher average monthly charges but lower historical revenue than retained customers. This is consistent with churned customers having shorter relationships with the company; it does not establish why they left.
- Lower optional-service adoption among churned customers may help identify a segment for further investigation, but the data does not show that selling more optional services will necessarily reduce churn.

## Limitations

- Negative monthly charges require investigation.
- The meaning of null in internet_type values should be verified.
