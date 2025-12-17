SELECT *
FROM {{ ref('fact_inpatient_claims') }}
WHERE claim_payment_amount > 100000

-- Test to flag any unusually high claim payments (e.g., above $100,000)