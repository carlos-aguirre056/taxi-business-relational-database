---1.1 CORE ENTITY
--- 1.1.1 CONCESSION
CREATE TABLE catalog.concession
(
	  id_concession INT IDENTITY(1,1) NOT NULL
	, economic_number VARCHAR(10) NOT NULL UNIQUE
	, authorization_number VARCHAR(10) NOT NULL UNIQUE
	
	
	, CONSTRAINT pk_concession PRIMARY KEY(id_concession)
);
GO
