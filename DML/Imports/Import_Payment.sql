--File to move validated data from staging into normalized tables. 
--This file validates imported data of the staging file to later insertion into the normalized table: billing.Payment
--Validates against one mother table: person. Matching the staging CURP of staging.PaymentImport with the already stored CURP in catalog.person

INSERT INTO billing.Payment
(
      id_person
    , paid_at
    , amount
    , notes
)
SELECT
      p.id_person
    , s.paid_at
    , s.amount
    , s.notes
FROM staging.PaymentImport AS s
INNER JOIN catalog.person AS p
    ON p.CURP = s.driver_curp
WHERE s.amount > 0;
GO
