--Trigger to prevent overlaping between active cars or drivers. Using double check for both attributes: Car and Driver

CREATE OR ALTER TRIGGER TR_CarDriverAssignment_PreventOverlap
ON CarDriverAssignment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent overlapping inserts for the same car
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN CarDriverAssignment AS c
            ON c.id_car = i.id_car
           AND c.id_CarDriverAssignment <> i.id_CarDriverAssignment
           AND i.start_date < COALESCE(c.end_date, '9999-12-31 23:59:59')
           AND c.start_date < COALESCE(i.end_date, '9999-12-31 23:59:59')
    )
    BEGIN
        THROW 50001 --custom error number assigned to car overlap 
        ,'Temporal integrity violation: overlapping driver assignments exist for the same car.', 1;
    END;


    -- Prevent overlapping inserts for the same driver
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN CarDriverAssignment AS c
            ON c.id_person = i.id_person
           AND c.id_CarDriverAssignment <> i.id_CarDriverAssignment
           AND i.start_date < COALESCE(c.end_date, '9999-12-31 23:59:59')
           AND c.start_date < COALESCE(i.end_date, '9999-12-31 23:59:59')
    )
    BEGIN
        THROW 50002 --custom error number assigned to driver overlap
        ,'Temporal integrity violation: overlapping car assignments exist for the same driver.', 1;
    END;
END;
GO
