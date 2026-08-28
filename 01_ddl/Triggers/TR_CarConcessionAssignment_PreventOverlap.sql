----Trigger to prevent overlaping between Cars and Concession. Using double check for both attributes: Car and Concession
--Only one car can be assigned to a concession at a time and vicevers -> Trigger divied in two

CREATE OR ALTER TRIGGER assignment.TR_CarConcessionAssignment_PreventOverlap
ON assignment.CarConcessionAssignment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent overlapping inserts or updates for the same car
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN assignment.CarConcessionAssignment AS c
            ON c.id_car = i.id_car
           AND c.id_CarConcessionAssignment <> i.id_CarConcessionAssignment
           AND i.start_at < COALESCE(c.end_at, '9999-12-31 23:59:59')
           AND c.start_at < COALESCE(i.end_at, '9999-12-31 23:59:59')
    )
    BEGIN
      --custom error number assigned to concession overlap over car 
        THROW 50003, 'Temporal integrity violation: overlapping concession assignments exist for the same car.', 1;
    END;

    -- Prevent overlapping inserts or updates for the same concession
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN assignment.CarConcessionAssignment AS c
            ON c.id_concession = i.id_concession
           AND c.id_CarConcessionAssignment <> i.id_CarConcessionAssignment
           AND i.start_at < COALESCE(c.end_at, '9999-12-31 23:59:59')
           AND c.start_at < COALESCE(i.end_at, '9999-12-31 23:59:59')
    )
    BEGIN
      --custom error number assigned to car overlap over concession
        THROW 50004, 'Temporal integrity violation: overlapping car assignments exist for the same concession.', 1;
    END;
END;
GO
