with source as (
    select * from {{ ref('stg_beneficiaryDbt') }}
),

transformed as (
    select
        patient_id,
        gender_code,
        case gender_code when '1' then 'Male' when '2' then 'Female' else 'Unknown' end as gender,
        race_code,
        case race_code
            when '1' then 'White'
            when '2' then 'Black'
            when '3' then 'Other'
            when '4' then 'Asian/Pacific Islander'
            when '5' then 'Hispanic'
            when '6' then 'American Indian/Alaska Native'
            else 'Unknown'
        end as race,
        state_code,
        case state_code 
            when '1' then 'Alabama'
            when '2' then 'Alaska'
            when '3' then 'Arizona'
            when '4' then 'Arkansas'
            when '5' then 'California'
            when '6' then 'Colorado'
            when '7' then 'Connecticut'
            when '8' then 'Delaware'
            when '9' then 'District of Columbia'
            when '10' then 'Florida'
            when '11' then 'Georgia'
            when '12' then 'Hawaii'
            when '13' then 'Idaho'
            when '14' then 'Illinois'
            when '15' then 'Indiana'
            when '16' then 'Iowa'
            when '17' then 'Kansas'
            when '18' then 'Kentucky'
            when '19' then 'Louisiana'
            when '20' then 'Maine'
            when '21' then 'Maryland'
            when '22' then 'Massachusetts'
            when '23' then 'Michigan'
            when '24' then 'Minnesota'
            when '25' then 'Mississippi'
            when '26' then 'Missouri'
            when '27' then 'Montana'
            when '28' then 'Nebraska'
            when '29' then 'Nevada'
            when '30' then 'New Hampshire'
            when '31' then 'New Jersey'
            when '32' then 'New Mexico'
            when '33' then 'New York'
            when '34' then 'North Carolina'
            when '35' then 'North Dakota'
            when '36' then 'Ohio'
            when '37' then 'Oklahoma'
            when '38' then 'Oregon'
            when '39' then 'Pennsylvania'
            when '40' then 'Rhode Island'
            when '41' then 'South Carolina'
            when '42' then 'South Dakota'
            when '43' then 'Tennessee'
            when '44' then 'Texas'
            when '45' then 'Utah'
            when '46' then 'Vermont'
            when '47' then 'Virginia'
            when '48' then 'Washington'
            when '49' then 'West Virginia'
            when '50' then 'Wisconsin'
            when '51' then 'Wyoming'
            when '52' then 'American Samoa'
            when '53' then 'Guam'
            when '54' then 'Northern Mariana Islands'
            when '55' then 'Puerto Rico'
            when '56' then 'United States Minor Outlying Islands'
            when '57' then 'Virgin Islands, U.S'
            else 'Unknown'
        end as state ,
        county_code,
        has_alzheimers ,
        has_chf ,
        has_chronic_kidney ,
        has_cancer ,
        has_copd ,
        has_depression ,
        has_diabetes ,
        has_ischemic_heart ,
        has_osteoporosis ,
        has_arthritis ,
        has_stroke ,
        total_months_enrolled
    from source
)

select * from transformed


