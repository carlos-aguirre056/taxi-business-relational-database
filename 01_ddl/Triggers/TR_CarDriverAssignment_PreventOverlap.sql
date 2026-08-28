--Trigger to prevent overlaping between active cars or drivers. Using double check for both attributes: Car and Driver
--Only one driver per car at a time and viceversa -> Trigger divied in two

CREATE OR ALTER TRIGGER assignment.TR_CarDriverAssignment_PreventOverlap
ON assignment.CarDriverAssignment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent overlapping inserts and updates for the same car
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN assignment.CarDriverAssignment AS c
            ON c.id_car = i.id_car
           AND c.id_CarDriverAssignment <> i.id_CarDriverAssignment
           AND i.start_at < COALESCE(c.end_at, '9999-12-31 23:59:59')
           AND c.start_at < COALESCE(i.end_at, '9999-12-31 23:59:59')
    )
    BEGIN
        --custom error number assigned to car overlap 
        THROW 50001 ,'Temporal integrity violation: overlapping driver assignments exist for the same car.', 1;
    END;


    -- Prevent overlapping inserts and updates for the same driver
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN assignment.CarDriverAssignment AS c
            ON c.id_person = i.id_person
           AND c.id_CarDriverAssignment <> i.id_CarDriverAssignment
           AND i.start_at < COALESCE(c.end_at, '9999-12-31 23:59:59')
           AND c.start_at < COALESCE(i.end_at, '9999-12-31 23:59:59')
    )
    BEGIN
        --custom error number assigned to driver overlap
        THROW 50002, 'Temporal integrity violation: overlapping car assignments exist for the same driver.', 1;
    END;
END;
GO
