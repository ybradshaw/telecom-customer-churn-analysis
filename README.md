# Telecom Customer Churn Analysis

## Business Problem

A  telecommunications company serving 7,043 customers in California wants to understand customer churn, identify key churn drivers, assess revenue impact, and improve customer retention.

This project uses Excel, SQL, and Tableau to transform customer data into actionable business insights.

## Dataset

The dataset contains 7,043 customer records, including demographics, location, subscribed services, account information, monthly charges, and customer status (Joined, Stayed, or Churned).

**Source:** [Maven Analytics — Telecom Customer Churn](https://mavenanalytics.io/data-playground/telecom-customer-churn)

## Business Questions

- How many customers joined during the last quarter?
- How do customers who joined, stayed, or churned differ?
- Which factors are most strongly associated with churn?
- Is the company losing high-value customers, and how could it retain them?

## Tools

- **Excel:** Data quality checks, Pivot Tables, KPI calculations, and exploratory analysis.
- **SQL (Google BigQuery):** Customer segmentation, churn drivers, revenue analysis, and retention priorities.
- **Tableau:** Interactive dashboard, customer comparisons, churn visualization, and business recommendations.

## Key Findings

**1. Customer Churn & Segmentation**

- 454 customers are classified as Joined, 4,720 as Stayed, and 1,869 as Churned.
- The overall churn rate is **28.37%**, excluding newly joined customers.
- Churned customers have a higher average monthly charge ($73.35) than retained customers ($61.74).

**2. Key Churn Drivers**

- Month-to-month contracts have the highest churn rate at **51.69%**, compared with 10.88% for one-year and 2.58% for two-year contracts.
- Customers with 0–9 months of tenure have a **66.45% churn rate**, indicating elevated churn among newer customers.
- Fiber Optic customers have a **42.13% churn rate**, higher than Cable (27.52%) and DSL (19.97%).

**3. Revenue Impact & High-Value Customers**

- Estimated monthly revenue lost to churn is **$137,086.65**, based on monthly charges associated with churned customers.
- Month-to-month customers account for approximately **$118,803** of this amount.
- Customers paying $70–79 per month have a **42.77% churn rate**, highlighting a high-risk segment for retention efforts.

## Business Recommendations

**1. Prioritize Month-to-Month Retention**

Test targeted incentives to encourage month-to-month customers to switch to longer-term contracts.

- **Target:** Month-to-month customers
- **Success KPIs:** Churn rate, contract conversion rate, retained monthly revenue

**2. Improve Early Customer Retention**

Investigate early-tenure churn drivers and test improvements to onboarding, customer engagement, and proactive support.

- **Target:** Customers within their first 9 months
- **Success KPIs:** Early-tenure churn rate, customer retention rate

**3. Improve High-Value Customer Retention**

Customers paying $70–79 per month have a 42.77% churn rate, indicating a high-risk segment.

To improve retention, the company should:

**Test personalized retention offers**, such as temporary discounts or service upgrades, for higher-paying customers at risk of churning.
**Introduce proactive customer outreach** to identify dissatisfaction with pricing, service quality, or support before customers leave.
**Evaluate the effectiveness of these initiatives** through controlled experiments before expanding them to other customer segments.

- **Target:** Higher-paying customers with elevated churn rates ($70–109/month).
- **Success KPIs:** Segment churn rate, retention offer acceptance rate, retained monthly revenue.

## Methodology & Limitations

- Churn rate is calculated as Churned / (Churned + Stayed), excluding Joined customers.
- The dataset identifies 454 Joined customers, but individual join dates are unavailable, so quarterly acquisition timing cannot be independently verified.
- Estimated monthly revenue lost to churn is based on monthly charges, not actual lost profit or confirmed future revenue.
- Identified churn drivers represent statistical associations, not proven causal relationships.

## Project Files

- **Excel Analysis:** Data quality checks, Pivot Tables, KPIs, and business findings.
- **SQL Analysis:** BigQuery scripts covering customer profiles, churn drivers, revenue impact, and retention priorities.
- **Tableau Dashboard:** Interactive visualization of customer segmentation, churn patterns, and business recommendations.

## Dashboard
[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/yuliia.bradshaw/viz/TelecomAnalytics/TelecomCustomerChurnDashboard)
