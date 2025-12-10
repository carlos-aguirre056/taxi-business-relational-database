/*
Master table: catalog.concessions
Represents the core legal and operational entity of the taxi fleet: the public service concession.

A concession is the true, stable identity of each taxi unit within the transportation system.
Unlike the physical vehicle (which can change model, year, plates, motor or be replaced entirely),
the concession remains constant over time and therefore serves as the parent entity for all
operational, administrative and historical processes.

This table stores only non-volatile attributes that define the document of possesion of a concession itself:
- its unique authorization number (legal identity),
- its economic number (operational identity),
- its transportation modality,
- and the official issuance and expiration dates of the concession.

*/

CREATE TABLE catalog.concessions(
	id_concession INT IDENTITY(1,1),
	economic_number VARCHAR(10) UNIQUE NOT NULL,
	authorization_number VARCHAR(10) UNIQUE NOT NULL,
	modality VARCHAR(20) NOT NULL,
	issue_date DATE,
	expiration_date DATE,
CONSTRAINT pk_id_concession PRIMARY KEY(id_concession)
);
GO
