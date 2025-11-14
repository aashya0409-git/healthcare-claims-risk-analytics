
# Patient Risk & Utilization Insights – Healthcare Analytics Portfolio Project

This project simulates end-to-end data engineering and analytics pipeline for a healthcare provider aiming to better understand **hospitalization costs**, **chronic condition patterns**, and **resource utilization** using anonymized inpatient claims and beneficiary data.

## Business Problem

A healthcare analytics team wants to monitor patient profiles, chronic condition risks, and hospitalization costs to improve care delivery and flag areas with unusually high utilization or potential inefficiencies.

They lack a centralized system to:
- Profile high-risk patient populations using chronic condition flags (`SP_DIABETES`, `SP_CHF`, etc.)
- Analyze claim payment distributions (`CLM_PMT_AMT`) across counties and states
- Understand how `CLM_UTLZTN_DAY_CNT` (utilization days) varies for different demographic groups
- Identify possible fraud or over-utilization based on patterns in admission/discharge timing

## Objective

Build an **end-to-end pipeline** to:
- Ingest and clean claims + patient data
- Transform and model it using modern tools (DBT, Azure SQL, ADF)
- Load it into a BI tool (Power BI)
- Present insights in an interactive dashboard

## Tech Stack

| Layer         | Tools                               |
|---------------|--------------------------------------|
| Storage       | Azure Blob Storage (Data Lake Gen2)  |
| Ingestion     | Azure Data Factory                   |
| Processing    | Python (pandas), DBT                 |
| Modeling      | Azure SQL Database                   |
| Visualization | Power BI                             |
| Versioning    | Git & GitHub                         |

##  Project Structure

```
├── data/
│   ├── raw/               # Original CSVs (from Kaggle) - didnt upload due to complaince
│   └── cleaned/           # Post-EDA & cleaning
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   └── 02_data_cleaning.ipynb
├── sql/
│   ├── create_staging_tables.sql
│   └── create_data_model.sql
├── dbt/
│   ├── models/
│   └── dbt_project.yml
├── adf/
│   └── arm_template/
├── powerbi/
│   └── healthcare_claims_dashboard.pbix
├── setup.md
├── architecture.md
└── README.md
```

## Status

✅ Dataset downloaded  
✅ Exploratory Analysis in Jupyter using Python 
✅ Cleaned datasets saved  
✅ Blob Storage + ADF pipeline created  
✅ Azure SQL tables created + loaded  
✅ commited everything done so far to Git repository

Next:
- DBT models for Fact + Dimension tables  
- Power BI Dashboard build  
- Publish write-up and insights

  ##  Key Metrics & Use Cases  
- Number of hospital admissions by chronic condition  
- Average cost and length of stay per condition and patient demographic  
- County/state breakdown of inpatient claims  
- High resource‑use patient flags (long stay + high cost)

---

##  Source  
Data from: [Kaggle – Medicare Provider Utilization and Payment Data] (link) – anonymized and reduced sample for portfolio use.

---

##  Skills Demonstrated  
- Cloud‑based ingestion and processing (Azure Blob, ADF, Azure SQL)  
- Data modeling/fact‑dimension structures using DBT
- Notebook‑based data exploration & cleaning  
- BI dashboard creation with Power BI  
- Portfolio‑worthy presentation of end‑to‑end flow

---

Last Updated: November 11, 2025
