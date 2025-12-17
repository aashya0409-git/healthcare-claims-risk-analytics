
with raw as (
    select
        trim(cast(DESYNPUF_ID as varchar(30))) as patient_id,
        cast(CLM_ID as varchar) as claim_id,
        try_convert(date, CLM_FROM_DT) as claim_start_date,
        try_convert(date, CLM_THRU_DT) as claim_end_date,
        case
          when try_cast(CLM_PMT_AMT as float) is not null
          then try_cast(CLM_PMT_AMT as float)
          else null
        end as claim_payment_amount,
        case
          when try_cast(NCH_PRMRY_PYR_CLM_PD_AMT as float) is not null
          then try_cast(NCH_PRMRY_PYR_CLM_PD_AMT as float)
          else null
        end as primary_payer_paid,
        cast(PRVDR_NUM as varchar) as provider_id,
        case
          when try_cast(CLM_UTLZTN_DAY_CNT as float) is not null
          then cast(try_cast(CLM_UTLZTN_DAY_CNT as float) as int)
          else null
        end as utilization_days,
        cast(CLM_DRG_CD as varchar) as drg_code
    from {{ source('raw', 'InpatientClaims') }}
)
select * from raw
