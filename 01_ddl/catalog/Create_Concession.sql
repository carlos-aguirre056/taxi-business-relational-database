---1.1 Core entities:
--- 1.1.1 CONCESSION
CREATE TABLE catalog.concessions(
	  id_concession INT IDENTITY(1,1),
	  economic_number VARCHAR(10) UNIQUE NOT NULL,
	  authorization_number VARCHAR(10) UNIQUE NOT NULL,

CONSTRAINT pk_concession PRIMARY KEY(id_concession)
);
GO
