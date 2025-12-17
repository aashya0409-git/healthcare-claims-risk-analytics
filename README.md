# Patient Risk & Utilization Insights – Healthcare Analytics Portfolio Project

This project demonstrates an **end-to-end data engineering and analytics pipeline** built to analyze inpatient healthcare claims and beneficiary data.  
It showcases modern cloud-based ingestion, transformation, modeling, testing, and visualization practices using Azure, dbt, and Power BI.

The goal of this portfolio project is to replicate **real-world enterprise data workflows**, including handling imperfect data, resolving pipeline errors, and delivering analytics-ready datasets for business users.

## Business Problem

A healthcare analytics team wants to monitor patient profiles, chronic condition risks, and hospitalization costs to improve care delivery and identify areas of unusually high utilization or potential inefficiencies.

They lack a centralized system to:

- Profile high-risk patient populations using chronic condition flags (`SP_DIABETES`, `SP_CHF`, etc.)
- Analyze claim payment distributions (`CLM_PMT_AMT`) across counties and states
- Understand how `CLM_UTLZTN_DAY_CNT` (utilization days) varies by demographic groups
- Identify potential fraud or over-utilization using cost and length-of-stay patterns

## Objective

Build an **end-to-end analytics pipeline** to:

- Ingest and clean claims and patient data
- Transform and model data using dbt (staging → intermediate → marts)
- Enforce data quality using schema and custom tests
- Serve analytics-ready data to Power BI
- Deliver executive-ready dashboards with drill-through and insights

## Tech Stack

| Layer | Tools |
|-----|------|
| Storage | Azure Blob Storage (ADLS Gen2) |
| Ingestion | Azure Data Factory |
| Processing | Python (EDA), dbt |
| Data Warehouse | Azure SQL Database |
| Modeling | dbt (staging, dimension, fact models) |
| Testing | dbt tests + dbt_utils |
| Visualization | Power BI |
| Version Control | Git & GitHub |

## Project Structure

├── data/
│ ├── raw/ # Original CSVs (not committed due to compliance)
│ └── cleaned/ # Cleaned datasets from Python EDA
├── notebooks/
│ ├── 01_data_exploration.ipynb
│ └── 02_data_cleaning.ipynb
├── dbt/
│ ├── claims_dbt/
│ │ ├── models/
│ │ │ ├── staging/
│ │ │ ├── intermediate/
│ │ │ ├── marts/
│ │ ├── seeds/
│ │ ├── tests/
│ │ ├── dbt_project.yml
│ │ ├── packages.yml
│ └── profiles.yml (local)
├── adf/
│ └── arm_templates/
├── powerbi/
│ └── Healthcare_Claims_Dashboard.pbix
├── setup.md
├── architecture.md
└── README.md

## Data Modeling Approach

- **Staging models** (`stg_*`):  
  Raw ingestion with type casting, trimming, null handling, and standardization.

- **Intermediate models** (`int_*`):  
  Deduplication logic and business consolidation (e.g., one row per patient).

- **Mart models**:
  - `dim_patient`: Patient demographics + chronic condition flags
  - `fact_inpatient_claims`: Claims, utilization, cost, length of stay
  - `vw_claims_dashboard`: Power BI–friendly reporting view

## Data Quality & Testing

Implemented extensive dbt tests:

- `not_null` on critical identifiers
- `accepted_values` for coded fields (gender, race)
- `unique` and `unique_combination_of_columns` for business keys
- Custom business rule tests:
  - High-cost claim detection
  - Positive utilization days

## Key Challenges Faced & How They Were Resolved

### 1. Duplicate Business Keys
**Issue:**  
`claim_id` was not unique in raw data.

**Fix:**  
Replaced strict uniqueness with:

dbt_utils.unique_combination_of_columns:
  combination_of_columns:
    - claim_id
    - claim_start_date
    - patient_id

2. Data Type Conversion Failures :
Issue:
Errors like: Conversion failed when converting the nvarchar value '5.0' to int
Fix: Used TRY_CAST / TRY_CONVERT in staging models and normalized numeric fields before testing.

3. Missing Dimension Attributes in Power BI: 
Issue: Gender, race, and chronic condition fields appeared as NULL in reporting views.
Root Cause: Patient IDs were inconsistent between claims and beneficiary datasets due to ADF ingestion differences.
Fix: Trimmed and standardized patient_id in staging, Ensured correct joins via int_beneficiary, Rebuilt downstream models

4. dbt Test Compilation Errors:
Issue: Incorrect YAML syntax and deprecated test definitions.
Fix: Corrected test indentation
Migrated to arguments: syntax
Installed and locked dbt_utils via packages.yml

Power BI Dashboard

The final Power BI dashboard includes:
High-cost claim indicators
Utilization trends by demographic
Chronic condition risk profiling
Drill-through from summary → patient detail
Executive KPIs with clean semantic modeling

Current Status: 

✅ Data ingestion completed
✅ dbt models built and tested
✅ Power BI dashboard completed
✅ End-to-end pipeline validated
✅ GitHub repository finalized

Skills Demonstrated: 
1. Cloud data ingestion and orchestration (ADF)
2. SQL-based transformations using dbt
3. Data quality testing and debugging
4. Dimensional modeling
5. BI storytelling and drill-through design
6. Enterprise-style documentation and version control

Last Updated: December 17th 2025