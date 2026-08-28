CREATE TABLE staging.AdjustmentImport
(
      id_staging_adjustment INT IDENTITY(1,1) NOT NULL
    , operational_date DATE NOT NULL
    , driver_curp VARCHAR(18) NOT NULL
    , car_vin VARCHAR(100) NOT NULL
    , adjustment_type_name VARCHAR(100) NOT NULL
    , adjustment_amount DECIMAL(10,2) NOT NULL
    , notes VARCHAR(255) NULL

    , CONSTRAINT pk_AdjustmentImport PRIMARY KEY (id_staging_adjustment)
);
GO
