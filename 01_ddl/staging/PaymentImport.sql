CREATE TABLE staging.PaymentImport
(
      id_staging_payment INT IDENTITY(1,1) NOT NULL
    , paid_at DATETIME2(0) NOT NULL
    , driver_curp VARCHAR(18) NOT NULL
    , amount DECIMAL(10,2) NOT NULL
    , notes VARCHAR(255) NULL

    , CONSTRAINT pk_PaymentImport PRIMARY KEY (id_staging_payment)
);
GO
