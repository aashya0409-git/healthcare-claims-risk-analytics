with source as (
    select * from {{ ref('stg_inpatient_claimsDbt') }}
),

transformed as (
    select
        patient_id,
        claim_id,
        claim_start_date,
        claim_end_date,
        datediff(day, claim_start_date, claim_end_date) as stay_length,
        claim_payment_amount,
        primary_payer_paid,
        provider_id,
        utilization_days,
        drg_code
    from source
)

select * from transformed
