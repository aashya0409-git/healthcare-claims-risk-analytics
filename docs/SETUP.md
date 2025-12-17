# Project Setup Guide

This guide explains how to run the project end-to-end locally.

## Prerequisites

- Azure SQL Database
- Azure Data Factory
- Python 3.9+
- dbt Core
- Power BI Desktop
- Git

## Step 1: Clone Repository

```bash
git clone https://github.com/<your-username>/healthcare_claims_risk_analytics.git
cd healthcare_claims_risk_analytics

## Step 2: Azure Setup
Upload raw CSV files to Azure Blob Storage
Configure Azure Data Factory pipelines
Load data into Azure SQL raw tables

## Step 3: dbt Setup
cd dbt/claims_dbt
dbt deps
dbt run
dbt test

Optional:

dbt docs generate
dbt docs serve

## Step 4: Power BI
Open Healthcare_Claims_Dashboard.pbix
Connect to Azure SQL Database
Refresh datasets
Validate visuals and drill-throughs

## Common Issues & Fixes: 
Issue	             |  Resolution
----------------------------------------------------
Data type errors	 |  Use TRY_CAST in staging
Missing joins	     |  Standardize business keys
Failing dbt tests	 |  Fix YAML syntax & logic
Duplicate keys	     |  Use composite uniqueness

## Git Best Practices : 
Do not commit raw data
Commit dbt models, tests, docs
Commit Power BI .pbix
Use .gitignore for secrets

Recommended .gitignore: 

target/
dbt_packages/
.env
profiles.yml
*.csv
