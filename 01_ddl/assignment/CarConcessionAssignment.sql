--RELATIONSHIP ATTRIBUTE
  -- 1.2.3 CAR_CONCESSION_ASSIGNMENT
CREATE TABLE CarConcessionAssignment(
  id_car_concession_assignment INT IDENTITY
, id_car INT NOT NULL
, id_concession INT NOT NULL
, start_date DATE NOT NULL
, end_date DATE NULL


CONSTRAINT PK_CarConcessionAssignment
    PRIMARY KEY(id_car_concession_assignment)
, CONSTRAINT FK_CarConcessionAssignment_Car  
    FOREIGN KEY (id_car) REFERENCES catalog.car(id_car)
, CONSTRAINT FK_CarConcessionAssignment_Concession
    FOREIGN KEY (id_concession) REFERENCES catalog.concession(id_concession)
, CONSTRAINT CK_CarConcessionAssignment_ValidDateRange 
    CHECK(end_date IS NULL OR start_date<end_date)
  );
GO
