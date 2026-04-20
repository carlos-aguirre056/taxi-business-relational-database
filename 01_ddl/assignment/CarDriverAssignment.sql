--RELATIONSHIP ENTITY
-- 1.2.2 CAR DRIVER ASSGINMENT
CREATE TABLE CarDriverAssignment(
    id_car_driver_history INT IDENTITY
    , id_person INT NOT NULL
    , id_car INT NOT NULL
    , start_date DATE NOT NULL
    , end_date DATE NULL

CONSTRAINT pk_CarDriverAssignment PRIMARY KEY(id_car_driver_history)
, CONSTRAINT fk_CarDriverAssignment_person_id_driver FOREIGN KEY(id_person) REFERENCES catalog.person(id_person)
, CONSTRAINT fk_CarDriverAssignment_car_id FOREIGN KEY(id_car) REFERENCES catalog.car(id_car)
, CONSTRAINT ck_CarDriverAssignment_ValidateRange CHECK(end_date IS NULL OR start_date<end_date)

GO);
