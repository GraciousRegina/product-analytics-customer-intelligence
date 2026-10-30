# Customer Intelligence & Retention Analytics Platform
End-to-end retail analytics portfolio project combining **Python, SQL, customer segmentation, cohort analysis, statistical testing, machine learning, market-basket analysis, and Plotly dashboards**.

## Project highlights

- Analyzed **400,916 cleaned transactions**, **19,213 orders**, and **4,312 customers**.
- Measured approximately **$8.80M in revenue** with an average order value of **$457.93**.
- **67.09% of customers were repeat customers** and generated **94.36% of customer revenue**.
- RFM analysis identified five actionable customer segments; **Champions contributed about 67.6% of segmented revenue**.
- **887 of 4,015 products (22.09%) generated about 80% of product revenue**.
- Logistic Regression achieved **ROC-AUC 0.7149** and **F1 0.7164** on the historical retention task.
- The strongest future three-month revenue model achieved approximately **R² 0.528**.
- DuckDB SQL analytics demonstrate aggregations, CTEs, CASE expressions, LAG, DENSE_RANK, NTILE, and reusable views.
- Executive, customer, product, and predictive Plotly dashboard views are included in the executed notebook.

## Business questions

The analysis examines customer value, repeat purchasing, retention, cohort behavior, product performance, revenue concentration, product affinity, cross-selling opportunities, and future customer activity.

## Repository structure

```text
product-analytics-customer-intelligence/
├── README.md
├── requirements.txt
├── .gitignore
├── notebooks/
│   └── product_analytics_customer_intelligence.ipynb
├── sql/
│   └── business_queries.sql
├── outputs/
│   ├── customer_summary.csv
│   ├── product_summary.csv
│   ├── country_summary.csv
│   ├── monthly_revenue.csv
│   ├── cohort_sizes.csv
│   └── cohort_retention_matrix.csv
├── reports/
│   └── executive_summary.md
└── data/
    └── README.md
```

## Analytical workflow

1. Data loading and quality assessment
2. Data cleaning and analytical dataset creation
3. Core business and exploratory analytics
4. RFM customer segmentation
5. Cohort retention analysis
6. Product performance analytics
7. Customer behavior and statistical testing
8. Predictive retention analytics
9. Future customer revenue modeling
10. Product × customer and market-basket analysis
11. SQL analytics layer
12. Executive analytics dashboards

## Key business findings

Repeat purchasing is central to revenue: repeat customers represent roughly two-thirds of customers but contribute more than 94% of customer revenue. Revenue is also concentrated across the product portfolio, with about 22% of products generating approximately 80% of product revenue. These patterns support retention prioritization, customer-value targeting, assortment focus, and cross-selling analysis.

## Predictive modeling

The retention analysis uses a historical observation window and a future purchase window. Logistic Regression produced the strongest ROC-AUC and F1 among the evaluated retention models. Future-revenue regression provides a prioritization signal for customer-value planning; it should not be interpreted as a causal estimate.

## Important analytical notes

- December 2010 is **partial through December 9**, so it is excluded from complete-month trend comparisons where appropriate.
- RFM segments and probability/value bands are analytical business rules, not ground-truth labels.
- Statistical relationships are associations and should not be interpreted as causal effects.
- Revenue is analyzed rather than profit because cost and margin data are unavailable.
- The raw dataset is intentionally excluded; see `data/README.md`.

## Technologies

Python, Pandas, NumPy, SciPy, scikit-learn, DuckDB/SQL, Plotly, Matplotlib, statistical testing, RFM segmentation, cohort analysis, machine learning, and market-basket analysis.

## Main notebook

Start with `notebooks/product_analytics_customer_intelligence.ipynb`. It contains the complete end-to-end workflow and saved outputs from the successful run, including dashboard visualizations.
