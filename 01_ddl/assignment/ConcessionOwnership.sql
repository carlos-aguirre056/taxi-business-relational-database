-- RELATIONSHIP ENTITIES
--1.2.1 Concession Ownership

CREATE TABLE ConcessionOwnership(
  id_ownership INT IDENTITY
  , id_concession INT NOT NULL
  , id_person INT NOT NULL
  , start_date DATE NOT NULL
  , end_date DATE NULL

CONSTRAINT pk_ConcessionOwnership PRIMARY KEY(id_ownership)
, CONSTRAINT fk_ConcessionOwnership_ConcessionFK FOREIGN KEY(id_concession) REFERENCES catalog.concession
, CONSTRAINT fk_ConcessionOwnership_PersonFK FOREIGN KEY(id_person) REFERENCES catalog.person
, CONSTRAINT ck_ConcessionOwnership_ValidDateRange CHECK(end_date IS  NULL OR start_date<end_date)
  GO
  );


--CREATION OF UNIQUE INDEX TO ENSURE ONLY ONE ACTIVE ROW

CREATE UNIQUE INDEX UX_ConcessionOwnership_ActiveConcession ON ConcessionOwnership(id_concession) WHERE end_date IS NULL;
