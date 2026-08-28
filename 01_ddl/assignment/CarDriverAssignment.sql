--1.2 RELATIONSHIP ENTITY
-- 1.2.2 CAR DRIVER ASSGINMENT
CREATE TABLE CarDriverAssignment(
    id_CarDriverAssignment INT IDENTITY
    , id_person INT NOT NULL
    , id_car INT NOT NULL
    , start_at DATETIME2(0) NOT NULL
    , end_at DATETIME2(0) NULL

, CONSTRAINT pk_CarDriverAssignment PRIMARY KEY(id_CarDriverAssignment)
, CONSTRAINT fk_CarDriverAssignment_PersonIdDriver FOREIGN KEY(id_person) REFERENCES catalog.person(id_person)
, CONSTRAINT fk_CarDriverAssignment_car_id FOREIGN KEY(id_car) REFERENCES catalog.car(id_car)
, CONSTRAINT ck_CarDriverAssignment_ValidateRange CHECK(end_at IS NULL OR start_at<end_at)

);
GO

--CREATION OF UNIQUE INDEXES TO ENSURE THAT THERE IS ONLY ONCE ACTIVE ROW

CREATE UNIQUE INDEX UX_CarDriverAssignment_ActiveCar ON CarDriverAssignment(id_car) WHERE start_at IS NULL;

CREATE UNIQUE INDEX UX_CarDriverAssignment_ActiveDriver ON CarDriverAssignment(id_person) WHERE end_at IS NULL;
