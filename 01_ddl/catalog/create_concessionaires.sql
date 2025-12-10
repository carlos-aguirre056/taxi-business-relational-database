/*
Master table: catalog.concessionaires
Stores the stable legal and administrative information of each concession holder.
Provides a surrogate primary key (IDENTITY) to uniquely identify every holder,
independent of operational or contractual changes over time.
Contains only persistent, non-transactional data and serves as a parent table
for registry, operational, and historical modules.
*/

CREATE TABLE catalog.concessionaires(
id_concessionaire INT IDENTITY(1,1),
full_name VARCHAR(100) NOT NULL,
rfc CHAR(13) UNIQUE, --It is CHAR 13 cause all concesionaires are "personas fisicas"
curp CHAR(18) UNIQUE NOT NULL,

CONSTRAINT pk_catalog_concessionaires PRIMARY KEY(id_concessionaire)
);
GO
