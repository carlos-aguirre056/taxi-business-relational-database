--RELATIONSHIP ATTRIBUTE
  -- 1.2.3 CAR_CONCESSION_ASSIGNMENT
CREATE TABLE CarConcessionAssignment(
  id_car_concession_history INT IDENTITY
, id_car INT
, id_concession INT
, start_date DATE NOT NULL
, end_date DATE NULL

  --PK and FK
CONSTRAINT pk_car_concession_assignment PRIMARY KEY(Id_car_concession_history)
, CONSTRAINT fk_car_concession_assignment_id_car FOREIGN KEY (id_car) REFERENCES catalog.car(id_car)

-- CHECK Constraints
CONSTRAINT CK_CarConcessionAssignment_ValidDateRange CHECK(end_date IS NULL OR start_date<end_date)
  GO
  );
