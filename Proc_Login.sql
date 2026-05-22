/**************************************************************
    Script Name         : Proc_Login.sql
    Purpose             : Creating Stored Procedure for Patient Login
    Created By          : Zeeshan Shaikh
    Created On          : 14/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Updated Version 1
****************************************************************/

use dbHealthCareManagement
go


------------------------------------------------------------
-- Procedure
------------------------------------------------------------

alter procedure Proc_Login	
	@Username NVARCHAR(15),
	@Password NVARCHAR(15)
AS
BEGIN
	set nocount on
	IF EXISTS (
		SELECT ID
		FROM Patient
		WHERE Username = @Username 
	)
	BEGIN
		IF EXISTS (
		SELECT ID
		FROM Patient
		WHERE Username = @Username  AND [Password] = @Password)
			begin
				--select ID as PatientID
				--from Patient
				--WHERE Username = @Username AND [Password] = @Password
				Print 'Login Successful' ;
			end
			else 
			begin 
				Print 'Wrong Password! Please Try Again.'
			end
	END
	ELSE 
	BEGIN
		Print 'Invalid Username! Please Try Again.';
	END	
END


------------------------------------------------------------
-- Test Cases
------------------------------------------------------------

-- Best Case

select * from Patient

exec Proc_Login 
	@username = 'aishakhan1',
	@Password = 'Aisha@123B'

-- Wrong Username

select * from Patient

exec Proc_Login 
	@username = 'aishaan1',
	@Password = 'Aisha@123B'

-- Wrong Password

select * from Patient

exec Proc_Login 
	@username = 'aishakhan1',
	@Password = 'Aish123B'

-- EDGE Case 1

select * from Patient

exec Proc_Login 
	@username = 'aishakhan1',
	@Password = ''

-- EDGE Case 2

select * from Patient

exec Proc_Login 
	@username = '',
	@Password = 'Aisha@123B'

-- EDGE Case 3

select * from Patient

exec Proc_Login 
	@username = '',
	@Password = ''
