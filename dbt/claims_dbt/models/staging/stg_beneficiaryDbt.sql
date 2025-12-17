with raw as (
  select
    trim(cast(DESYNPUF_ID as varchar(30))) as patient_id,
    cast(BENE_SEX_IDENT_CD as int) as gender_code,
    cast(BENE_RACE_CD as int) as race_code,
    cast(SP_STATE_CODE as varchar) as state_code,
    cast(BENE_COUNTY_CD as varchar) as county_code,
    cast(SP_ALZHDMTA as int) as has_alzheimers,
    cast(SP_CHF as int) as has_chf,
    cast(SP_CHRNKIDN as int) as has_chronic_kidney,
    cast(SP_CNCR as int) as has_cancer,
    cast(SP_COPD as int) as has_copd,
    cast(SP_DEPRESSN as int) as has_depression,
    cast(SP_DIABETES as int) as has_diabetes,
    cast(SP_ISCHMCHT as int) as has_ischemic_heart,
    cast(SP_OSTEOPRS as int) as has_osteoporosis,
    cast(SP_RA_OA as int) as has_arthritis,
    cast(SP_STRKETIA as int) as has_stroke,
    cast(Total_mons as int) as total_months_enrolled
  from {{ source('raw','Beneficiary') }}
),

unique_benes as (
  select
    patient_id,
    max(gender_code) as gender_code,
    max(race_code) as race_code,
    max(state_code) as state_code,
    max(county_code) as county_code,
    max(has_alzheimers) as has_alzheimers,
    max(has_chf) as has_chf,
    max(has_chronic_kidney) as has_chronic_kidney,
    max(has_cancer) as has_cancer,
    max(has_copd) as has_copd,
    max(has_depression) as has_depression,
    max(has_diabetes) as has_diabetes,
    max(has_ischemic_heart) as has_ischemic_heart,
    max(has_osteoporosis) as has_osteoporosis,
    max(has_arthritis) as has_arthritis,
    max(has_stroke) as has_stroke,
    max(total_months_enrolled) as total_months_enrolled
  from raw
  group by patient_id
),

enriched as (
  select
    ub.patient_id,
    ub.gender_code,
    ub.race_code,
    ub.state_code,
    ub.county_code,
    ub.has_alzheimers,
    ub.has_chf,
    ub.has_chronic_kidney,
    ub.has_cancer,
    ub.has_copd,
    ub.has_depression,
    ub.has_diabetes,
    ub.has_ischemic_heart,
    ub.has_osteoporosis,
    ub.has_arthritis,
    ub.has_stroke,
    ub.total_months_enrolled,

    gender.gender as gender,
    race.race as race,
    state.state_name as state
  from unique_benes ub
  left join {{ ref('gender_lookup') }} gender
    on ub.gender_code = gender.gender_code
  left join {{ ref('race_lookup') }} race
    on ub.race_code = race.race_code
  left join {{ ref('state_lookup') }} state
    on ub.state_code = state.state_code
)

select * from enriched
