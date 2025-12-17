with claims as (

  select distinct
    claim_id,
    patient_id,
    provider_id,
    claim_start_date,
    claim_end_date,
    claim_payment_amount,
    primary_payer_paid,
    utilization_days,
    case 
      when utilization_days is null then 0
      else utilization_days
    end as utilization_days_clean,
    drg_code,
    datediff(day, claim_start_date, claim_end_date) as length_of_stay
  from {{ ref('stg_inpatient_claimsDbt') }}

)

select * from claims
