--File to move validated data from staging into normalized tables. 
--This file validates imported data of the staging file to later insertion into the normalized table: billing.ChargeAdjustment
--Validates against two mother table: person and car. Matching the staging CURP of staging.AdjustmentImport with the already stored CURP in catalog.person
--And matching the staging VIN of staging.AdjustmentImport with the one stored in catalog.car. 
--BY validating Car (With VIN) and person (With CURP) it links it to the unique match in CarDriverAssignment
--Once this is done, with the id_CarDriverAssignment it links it to the Billing.DailyCharge (Which is the one that receives the payed amount)
--To finally link it to the billing.AdjustmentType table with the staging file thorugh staging.adjustment_type

INSERT INTO billing.ChargeAdjustment
(
      id_daily_charge
    , id_adjustment_type
    , adjustment_amount
    , notes
)
SELECT
      dc.id_daily_charge
    , at.id_adjustment_type
    , s.adjustment_amount
    , s.notes
FROM staging.AdjustmentImport AS s

INNER JOIN catalog.person AS p
    ON p.CURP = s.driver_curp

INNER JOIN catalog.car AS c
    ON c.VIN = s.car_vin

INNER JOIN assignment.CarDriverAssignment AS cda
    ON cda.id_person = p.id_person
   AND cda.id_car = c.id_car

INNER JOIN billing.DailyCharge AS dc
    ON dc.id_CarDriverAssignment = cda.id_CarDriverAssignment
   AND dc.operational_date = s.operational_date

INNER JOIN billing.AdjustmentType AS at
    ON at.adjustment_type_name = s.adjustment_type_name
   AND at.is_active = 1

WHERE s.adjustment_amount <> 0;
GO
