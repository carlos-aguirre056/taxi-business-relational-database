CREATE TABLE staging.DailyChargeImport
(
      id_staging_daily_charge INT IDENTITY(1,1) NOT NULL
    , operational_date DATE NOT NULL
    , driver_curp VARCHAR(18) NOT NULL
    , car_vin VARCHAR(100) NOT NULL
    , base_amount DECIMAL(10,2) NOT NULL
    , notes VARCHAR(255) NULL

    , CONSTRAINT pk_DailyChargeImport PRIMARY KEY (id_staging_daily_charge)
);
GO
