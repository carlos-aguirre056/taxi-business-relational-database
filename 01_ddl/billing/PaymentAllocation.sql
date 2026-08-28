CREATE TABLE billing.PaymentAllocation
(
      id_payment_allocation INT IDENTITY(1,1) NOT NULL
    , id_payment INT NOT NULL
    , id_daily_charge INT NOT NULL
    , allocated_amount DECIMAL(10,2) NOT NULL

    , CONSTRAINT pk_PaymentAllocation PRIMARY KEY (id_payment_allocation)
    , CONSTRAINT fk_PaymentAllocation_Payment FOREIGN KEY (id_payment) REFERENCES billing.Payment(id_payment)
    , CONSTRAINT fk_PaymentAllocation_DailyCharge FOREIGN KEY (id_daily_charge) REFERENCES billing.DailyCharge(id_daily_charge)
    , CONSTRAINT uq_PaymentAllocation_id_payment UNIQUE (id_payment)
    , CONSTRAINT uq_PaymentAllocation_id_DailyCharge UNIQUE (id_daily_charge)
    , CONSTRAINT ck_PaymentAllocation_PositiveAmount CHECK (allocated_amount > 0)
);
GO
