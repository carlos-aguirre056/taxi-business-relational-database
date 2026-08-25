--RELATIONSHIP ATTRIBUTE
  -- 1.2.3 CAR_CONCESSION_ASSIGNMENT
CREATE TABLE CarConcessionAssignment(
  id_CarConcessionAssignment INT IDENTITY
, id_car INT NOT NULL
, id_concession INT NOT NULL
, start_date DATE NOT NULL
, end_date DATE NULL


CONSTRAINT pk_CarConcessionAssignment PRIMARY KEY(id_CarConcessionAssignment)
, CONSTRAINT fk_CarConcessionAssignment_Car FOREIGN KEY (id_car) REFERENCES catalog.car(id_car)
, CONSTRAINT fk_CarConcessionAssignment_Concession FOREIGN KEY (id_concession) REFERENCES catalog.concession(id_concession)
, CONSTRAINT ck_CarConcessionAssignment_ValidDateRange CHECK(end_date IS NULL OR start_date<end_date)
  );
GO


--CREATION OF UNIQUE INDEXES TO ENSURE ONLY ACTIVE ROW PER TABLE
CREATE UNIQUE INDEX UX_CarConcessionAssignment_ActiveConcession ON CarConcessionAssignment(id_concession) WHERE end_date IS NULL;

CREATE UNIQUE INDEX UX_CarConcessionAssignment_ActiveCar ON CarConcessionAssignment(id_car) WHERE end_date IS NULL;
