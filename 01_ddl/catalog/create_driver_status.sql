/*
Master table: catalog.driver_status
Defines the set of allowed status types for drivers independent of the high
turnover typical in this role. These values remain stable even as individual
drivers join, leave, or change employment conditions. 
Provides controlled and non-transactional reference data used by operational and historical modules
to track a driver’s lifecycle.
*/

CREATE TABLE catalog.driver_status(
id_driver_status INT IDENTITY(1,1),
status_name VARCHAR(30) UNIQUE NOT NULL,

CONSTRAINT pk_catalog_driver_status PRIMARY KEY(id_driver_status)
);
GO
