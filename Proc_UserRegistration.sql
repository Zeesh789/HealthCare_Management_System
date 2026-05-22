/**************************************************************
    Script Name         : Proc_UserRegistration.sql
    Purpose             : Creating Stored Procedure for Patient Registration 
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

create procedure sprocRegistration
	@FirstName nvarchar(20),
	@LastName nvarchar(20),
	@Age int,
	@EmailID nvarchar(255),
	@GovernmentID nvarchar(15),
	@Username nvarchar(15),
	@Password nvarchar(15)
	as
	Begin
		begin try
					Set NOCOUNT ON
					insert into Patient(FirstName,LastName,Age,EmailID,GovernmentID,Username,Password)
					values(@FirstName,@LastName,@Age,@EmailID,@GovernmentID,@Username,@Password)

					DECLARE @NewID INT = SCOPE_IDENTITY();
					print 'User Registered Successfully!'

					select Id,FirstName,LastName,Username from Patient where ID = @NewID	
		end try
		begin catch
				if Error_message() like '%chk_Patient_FirstName_only_letters%'
					begin
					print 'Invalid Patient First Name! Please Try Again'
					end
				if Error_message() like '%chk_Patient_LastName_only_letters%'
					begin
					print 'Invalid Patient Last Name! Please Try Again'
					end
				if Error_message() like '%chk_Patient_Age_Not_Possible%'
					begin
					print 'Invalid Patient Age! Please Try Again'
					end
				if Error_message() like '%UQ__Patient__EmailID%'
					begin
					print 'Email ID already Exists! Please Login or Use Another Email ID.'
					end
				if Error_message() like '%chk_Patient_EmailID_No_Spaces%'
					begin
					print 'Invalid Patient Email ID! Please Try Again'
					end
				if Error_message() like '%chk_Patient_GovernmentID_only_Valid_options%'
					begin
					print 'Invalid Patient Government ID! Please Try Again'
					end
				if Error_message() like '%UQ__Patient__GovernmentID%'
					begin
					print 'Government ID Already Exists! Please Login or Use Another Government ID.'
					end
				if Error_message() like '%chk_Patient_Username_only_Valid_options%'
					begin
					print 'Invalid Patient Username! Please Try Again'
					end
				if Error_message() like '%UQ_Patient_Username%'
					begin
					print 'Username Already Exists! Please Choose Another Username.'
					end
			if Error_message() like '%chk_Patient_Password_only_Valid_options%'
				begin
				print 'Invalid Password!
				Password must contain 1 Uppercase, 1 Lowercase Character and password length must be between 8 and 15.
				Password cannot contain Spaces.
				Please Try Again'
				end
		end catch
	end

select * from Patient
delete from Patient
where id = 5
dbcc checkident('patient', reseed,4)


exec sprocRegistration
@FirstName = 'Zeeshan',
@LastName ='Shaikh',
@Age = 22,
@EmailID = 'zeeshanshaikh@gmail.com',
@GovernmentID = '86395953774',
@Username = 'Zeeshans839',
@Password= 'Zeeshan@123'

select * from Patient