BEGIN TRANSACTION;

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
