CREATE TABLE billing.AdjustmentType
(
      id_adjustment_type INT IDENTITY(1,1) NOT NULL
    , adjustment_type_name VARCHAR(100) NOT NULL
    , description VARCHAR(255) NULL
    , is_active BIT NOT NULL

    , CONSTRAINT pk_AdjustmentType PRIMARY KEY (id_adjustment_type)
    , CONSTRAINT uq_AdjustmentType_Name UNIQUE (adjustment_type_name)
);
GO
