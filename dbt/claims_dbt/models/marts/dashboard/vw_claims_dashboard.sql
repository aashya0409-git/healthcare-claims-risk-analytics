select
    f.claim_id,
    f.patient_id,
    p.gender,
    p.race,
    p.state,
    p.county_code,
    f.claim_start_date,
    f.claim_end_date,
    f.length_of_stay,
    f.utilization_days_clean,
    f.claim_payment_amount,
    f.primary_payer_paid,
    f.drg_code,

    -- Chronic conditions
    coalesce(p.has_alzheimers, 0) as has_alzheimers,
    coalesce(p.has_chf, 0) as has_chf,
    coalesce(p.has_chronic_kidney, 0) as has_chronic_kidney,
    coalesce(p.has_cancer, 0) as has_cancer,
    coalesce(p.has_copd, 0) as has_copd,
    coalesce(p.has_depression, 0) as has_depression,
    coalesce(p.has_diabetes, 0) as has_diabetes,
    coalesce(p.has_ischemic_heart, 0) as has_ischemic_heart,
    coalesce(p.has_osteoporosis, 0) as has_osteoporosis,
    coalesce(p.has_arthritis, 0) as has_arthritis,
    coalesce(p.has_stroke, 0) as has_stroke,
    p.total_months_enrolled,

    -- Business indicator
    case 
        when f.claim_payment_amount > 10000 then 'Yes'
        else 'No'
    end as is_high_cost_claim

from {{ ref('fact_inpatient_claims') }} f
left join {{ ref('dim_patient') }} p
  on f.patient_id = p.patient_id
