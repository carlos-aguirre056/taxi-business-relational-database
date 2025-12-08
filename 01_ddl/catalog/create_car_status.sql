/*
Master table: catalog.car_status
Defines the set of allowed status types for vehicles in the fleet (NOT the vehicle’s current status).
Stores stable, non-transactional values such as operational, maintenance, or inactivity states. 
Provides reference integrity for modules that track a vehicle’s lifecycle, including operational and historical status records.
*/

CREATE TABLE catalog.car_status(
id_car_status INT IDENTITY(1,1),
status_name VARCHAR(30) UNIQUE NOT NULL,

CONSTRAINT pk_catalog_car_status PRIMARY KEY(id_car_status)
);
GO
