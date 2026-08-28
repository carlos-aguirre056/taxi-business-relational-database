CREATE TABLE billing.DailyCharge
(
      id_daily_charge INT IDENTITY(1,1) NOT NULL
    , id_CarDriverAssignment INT NOT NULL
    , operational_date DATE NOT NULL
    , base_amount DECIMAL(10,2) NOT NULL

    , CONSTRAINT pk_DailyCharge PRIMARY KEY (id_daily_charge)
    , CONSTRAINT fk_DailyCharge_CarDriverAssignment FOREIGN KEY (id_CarDriverAssignment) REFERENCES assignment.CarDriverAssignment(id_CarDriverAssignment)
    , CONSTRAINT uq_DailyCharge_AssignmentOperationalDate UNIQUE (id_CarDriverAssignment, operational_date)
    , CONSTRAINT ck_DailyCharge_BaseAmount CHECK (base_amount >= 0)
);
GO
