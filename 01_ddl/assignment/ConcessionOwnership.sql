-- 1.2 RELATIONSHIP ENTITIES
--1.2.1 Concession Ownership

CREATE TABLE assignment.ConcessionOwnership
(
  id_ownership INT IDENTITY(1,1) NOT NULL
  , id_concession INT NOT NULL
  , id_person INT NOT NULL
  , start_at DATETIME2(0) NOT NULL
  , end_at DATETIME2(0) NULL

, CONSTRAINT pk_ConcessionOwnership PRIMARY KEY(id_ownership)
, CONSTRAINT fk_ConcessionOwnership_ConcessionFK FOREIGN KEY(id_concession) REFERENCES catalog.concession(id_concession)
, CONSTRAINT fk_ConcessionOwnership_PersonFK FOREIGN KEY(id_person) REFERENCES catalog.person(id_person)
, CONSTRAINT ck_ConcessionOwnership_ValidDateRange CHECK(end_at IS  NULL OR start_at<end_at)
  );
GO

--CREATION OF UNIQUE INDEX TO ENSURE ONLY ONE ACTIVE ROW

CREATE UNIQUE INDEX UX_ConcessionOwnership_ActiveConcession ON assignment.ConcessionOwnership(id_concession) WHERE end_date IS NULL;
GO
