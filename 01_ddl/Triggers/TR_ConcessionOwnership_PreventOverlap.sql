--Trigger to prevent overlaping of concessions over people. 
--A person can own several concessions but a concession can only be assigned to one person at a time -> Only need to keep this rule


CREATE OR ALTER TRIGGER assignment.TR_ConcessionOwnership_PreventOverlap
ON assignment.ConcessionOwnership
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent overlapping ownership periods for the same concession
    IF EXISTS
    (
        SELECT 1
        FROM inserted AS i
        INNER JOIN assignment.ConcessionOwnership AS c
            ON c.id_concession = i.id_concession
           AND c.id_ownership <> i.id_ownership
           AND i.start_at < COALESCE(c.end_at, '9999-12-31 23:59:59')
           AND c.start_at < COALESCE(i.end_at, '9999-12-31 23:59:59')
    )
    BEGIN
       --custom error number assigned to concession ownership periods overlap 
        THROW 50005, 'Temporal integrity violation: overlapping ownership periods exist for the same concession.', 1;
    END;
END;
GO
