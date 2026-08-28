CREATE TABLE billing.ChargeAdjustment
(
      id_charge_adjustment INT IDENTITY(1,1) NOT NULL
    , id_daily_charge INT NOT NULL
    , id_adjustment_type INT NOT NULL
    , adjustment_amount DECIMAL(10,2) NOT NULL
    , notes VARCHAR(255) NULL

    , CONSTRAINT pk_ChargeAdjustment PRIMARY KEY (id_charge_adjustment)
    , CONSTRAINT fk_ChargeAdjustment_DailyCharge FOREIGN KEY (id_daily_charge) REFERENCES billing.DailyCharge(id_daily_charge)
    , CONSTRAINT fk_ChargeAdjustment_AdjustmentType FOREIGN KEY (id_adjustment_type) REFERENCES billing.AdjustmentType(id_adjustment_type)
    , CONSTRAINT ck_ChargeAdjustment_NonZeroAmount CHECK (adjustment_amount <> 0)
);
GO
