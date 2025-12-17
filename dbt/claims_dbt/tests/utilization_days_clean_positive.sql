SELECT *
FROM {{ ref('fact_inpatient_claims') }}
WHERE utilization_days_clean < 0
