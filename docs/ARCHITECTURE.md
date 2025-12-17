# Architecture Overview – Patient Risk & Utilization Analytics

This project follows a **modern ELT architecture**, closely aligned with enterprise analytics platforms.

## High-Level Flow

## Data Architecture Overview

```
                 ┌────────────────────┐
                 │ Raw CSV (Blob Storage) │
                 └─────────┬──────────┘
                           │
           Ingest via Azure Data Factory
                           │
                 ┌────────▼─────────┐
                 │ Azure SQL Staging Tables │
                 └────────┬─────────┘
                           │
           Transform using dbt (models/staging/fact/dim)
                           │
                 ┌────────▼─────────┐
                 │   Azure SQL Curated Layer   │
                 └────────┬─────────┘
                           │
                 Visualize using Power BI
```

## Layered Design

### 1. Ingestion Layer
- Azure Data Factory pipelines ingest CSVs from Blob Storage
- Schema drift handled at source
- Data loaded as-is into Azure SQL raw tables

### 2. Transformation Layer (dbt)

#### Staging
- Type casting (`TRY_CAST`)
- Trimming IDs
- Null normalization
- Code standardization

#### Intermediate
- Deduplication logic
- One-record-per-patient consolidation

#### Marts
- Dimensional models (`dim_patient`)
- Fact models (`fact_inpatient_claims`)
- Reporting views (`vw_claims_dashboard`)

### 3. Data Quality Layer
- dbt schema tests
- Business rule tests
- Composite key enforcement
- Anomaly detection (high-cost claims)

### 4. Analytics Layer
- Power BI semantic model
- Drill-through enabled
- Executive KPIs
- Patient-level analysis

## Why This Architecture Works

- Scalable and modular
- Easy debugging
- Enterprise-aligned
- BI-friendly
- Test-driven transformations

## Design Principles Applied

- ELT over ETL
- SQL-first transformations
- Explicit data contracts
- Analytics-ready outputs

