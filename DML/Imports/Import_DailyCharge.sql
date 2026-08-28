--File to move validated data from staging into normalized tables. 
--This file validates imported data of the staging file to later insertion into the normalized table: billing DailyCharge

INSERT INTO billing.DailyCharge
(
      id_CarDriverAssignment
    , operational_date
    , base_amount
)
SELECT
      cda.id_CarDriverAssignment
    , s.operational_date
    , s.base_amount
FROM staging.DailyChargeImport AS s
INNER JOIN catalog.person AS p
    ON p.CURP = s.driver_curp
INNER JOIN catalog.car AS c
    ON c.VIN = s.car_vin
INNER JOIN assignment.CarDriverAssignment AS cda
    ON cda.id_person = p.id_person
   AND cda.id_car = c.id_car
   AND CAST(cda.start_at AS DATE) <= s.operational_date
   AND (
        cda.end_at IS NULL
        OR CAST(cda.end_at AS DATE) >= s.operational_date
       )
WHERE s.base_amount >= 0
  AND NOT EXISTS
  (
      SELECT 1
      FROM billing.DailyCharge AS dc
      WHERE dc.id_CarDriverAssignment = cda.id_CarDriverAssignment
        AND dc.operational_date = s.operational_date
  );
