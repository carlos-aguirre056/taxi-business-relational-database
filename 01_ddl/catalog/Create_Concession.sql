---1.1 CORE ENTITY
--- 1.1.1 CONCESSION
CREATE TABLE catalog.concession(
	  id_concession INT IDENTITY(1,1),
	  economic_number VARCHAR(10) UNIQUE NOT NULL,
	  authorization_number VARCHAR(10) UNIQUE NOT NULL,

CONSTRAINT pk_concession PRIMARY KEY(id_concession)
);
GO
