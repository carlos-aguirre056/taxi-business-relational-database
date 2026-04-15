-- RELATIONSHIP ENTITIES
--1.2.1 Concession Ownership

CREATE TABLE ConcessionOwnership(
  , id_ownership INT IDENTITY
  , id_concession INT UNIQUE NOT NULL
  , id_person INT UNIQUE NOT NULL
  , start_date DATE NOT NULL
  , end_date DATE NULL

CONSTRAINT pk_ConcessionOwnership PRIMARY KEY(id_owner)
, CONSTRAINT fk_ConcessionOnwership_ConcessionFK FOREIGN KEY(id_concession) REFERENCES concession
, CONSTRAINT fk_ConcessionOwnership_PersonFK FOREIGN KEY(id_person) REFERENCES person
  GO
  );
