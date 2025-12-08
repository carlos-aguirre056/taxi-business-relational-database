/*
Master table: catalog.drivers
Stores the core and stable attributes of each driver.
This table defines the driver's identity through a surrogate primary key (IDENTITY),
independent of the driver’s operational or employment status.
Serves as a parent table for operational and historical modules.
Contains only non-volatile, non-transactional attributes.
*/

CREATE TABLE catalog.drivers(
id_driver INT IDENTITY(1,1),
full_name VARCHAR(100) NOT NULL,
phone_number VARCHAR(15) NOT NULL,

CONSTRAINT PK_catalog_drivers PRIMARY KEY(id_driver)
);
GO
