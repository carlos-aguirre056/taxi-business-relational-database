CREATE TABLE billing.Payment
(
      id_payment INT IDENTITY(1,1) NOT NULL
    , id_person INT NOT NULL
    , paid_at DATETIME2(0) NOT NULL
    , amount DECIMAL(10,2) NOT NULL
    , notes VARCHAR(255) NULL

    , CONSTRAINT pk_Payment PRIMARY KEY (id_payment)
    , CONSTRAINT fk_Payment_Person FOREIGN KEY (id_person) REFERENCES catalog.person(id_person)
    , CONSTRAINT ck_Payment_PositiveAmount CHECK (amount > 0)
);
GO
