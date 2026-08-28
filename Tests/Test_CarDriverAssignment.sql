BEGIN TRANSACTION; 
--Creating a transaction to avoid leaving fake people and cars in the DB

--Insert test parent rows in mother tables: catalog.person and catalog.car.
--Specifically: 3 people, 2 cars

--Insert in catalog.person
INSERT INTO catalog.person(FirstName, LastName, CURP, BirthDate)
VALUES
    ('TestDriverA', 'Test', 'TESTCURP000000001', '1990-01-01')
  , ('TestDriverB', 'Test', 'TESTCURP000000002', '1991-01-01')
  , ('TestDriverC', 'Test', 'TESTCURP000000003', '1992-01-01')
  ;

--Insert in catalog.car
INSERT INTO catalog.car(VIN)
VALUES
    ('TESTVIN000000001')
  , ('TESTVIN000000002')
  ;


--DECLARE VARIABLES TO AVOID RELYING IN THE AUTOMATICALY GENERATED id_car and id_person BY IDENTITY(1,1) FOR FURTHER TESTS
--(Avoiding to assume the IDs are 1, 2, 3 and so on)

DECLARE @DriverA INT =
(
    SELECT id_person
    FROM catalog.person
    WHERE CURP = 'TESTCURP000000001'
);

DECLARE @DriverB INT =
(
    SELECT id_person
    FROM catalog.person
    WHERE CURP = 'TESTCURP000000002'
);

DECLARE @DriverC INT =
(
    SELECT id_person
    FROM catalog.person
    WHERE CURP = 'TESTCURP000000003'
);

DECLARE @CarA INT =
(
    SELECT id_car
    FROM catalog.car
    WHERE VIN = 'TESTVIN000000001'
);

DECLARE @CarB INT =
(
    SELECT id_car
    FROM catalog.car
    WHERE VIN = 'TESTVIN000000002'
);


--First trial. Insert of correct data
INSERT INTO assignment.CarDriverAssignment
    (id_person, id_car, start_at, end_at)
VALUES
    (
        @DriverA,
        @CarA,
        '2026-01-01 08:00:00',
        '2026-01-10 12:00:00'
    );

--Retrieve the inserted data to check if it was succesful
SELECT *
FROM assignment.CarDriverAssignment
WHERE id_car IN (@CarA, @CarB);

--And Rollback everything to not leave fake data behind as mentioned at the beggining
ROLLBACK;
