/*
Master table: catalog.cars
Stores the core and stable information of each taxi unit.
This table defines the identity of every vehicle through a primary key (IDENTITY).
It serves as a parent table for operational and historical modules.
Contains only non-volatile attributes with no transactional or time-dependent data.
*/
CREATE SCHEMA catalog;

GO

CREATE TABLE catalog.cars(
id_car SMALLINT IDENTITY(1,1),
license_plate VARCHAR(7) UNIQUE NOT NULL,
engine_number VARCHAR(20) UNIQUE, --Numbers that do not represent a magnitud are not INT
economic_number SMALLINT UNIQUE NOT NULL,
vin_number CHAR(17) UNIQUE NOT NULL, --If the number of characters is known for a value. CHAR is better
brand VARCHAR(20) NOT NULL,
model VARCHAR(30) NOT NULL,
year SMALLINT NOT NULL,

CONSTRAINT PK_catalog_cars PRIMARY KEY(id_car)
);
GO
