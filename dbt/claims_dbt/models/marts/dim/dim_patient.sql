with base as (
    select distinct patient_id
    from {{ ref('fact_inpatient_claims') }}
),

benes as (
    select *
    from {{ ref('int_beneficiary') }}
),

final as (
    select
        f.patient_id,
        coalesce(b.gender, 'Unknown') as gender,
        coalesce(b.race, 'Unknown') as race,
        coalesce(b.state, 'Unknown') as state,
        b.county_code,
        b.has_alzheimers,
        b.has_chf,
        b.has_chronic_kidney,
        b.has_cancer,
        b.has_copd,
        b.has_depression,
        b.has_diabetes,
        b.has_ischemic_heart,
        b.has_osteoporosis,
        b.has_arthritis,
        b.has_stroke,
        b.total_months_enrolled
    from base f
    left join benes b on f.patient_id = b.patient_id
)

select * from final
