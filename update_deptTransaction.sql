--Set so if transaction fails it will automatically be rolled back
SET XACT_ABORT ON

BEGIN TRY
DECLARE @TranName AS VARCHAR(50) = 'DeptChange'
BEGIN TRAN @TranName
USE CompanyNameDB
-- Adjust batch size as needed
DECLARE @Rows INT = 1000, @BatchSize INT = 1000
WHILE (@Rows = @BatchSize)
BEGIN
    UPDATE TOP (@BatchSize) employees
    SET dept = '002'
    WHERE dept = '001';

    SET @Rows = @@ROWCOUNT
END
COMMIT TRAN @TranName
SAVE TRAN SavePoint1
END TRY

BEGIN CATCH 
	IF (@@TRANCOUNT > 0)
	BEGIN
		ROLLBACK TRANSACTION @TranName
		PRINT 'Error, rolled back'
		SAVE TRAN SavePoint2
	END 
    SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_STATE() AS ErrorState,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage
END CATCH


