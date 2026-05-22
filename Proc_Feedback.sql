/**************************************************************
    Script Name         : Proc_Feedback.sql
    Purpose             : Creating Stored Procedure for taking Feedback from the Patient
    Created By          : Zeeshan Shaikh
    Created On          : 16/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 17/04/26
    Modified            : IUpdated Version 1
****************************************************************/

use dbHealthCareManagement
go

------------------------------------------------------------
-- Procedure
------------------------------------------------------------

alter proc Proc_Feedback
	@PatientID int ,
	@AppointmentID int,
	@Rating int,
	@Suggestion nvarchar(50) = null
as
BEGIN
begin try
	set nocount on
	IF EXISTS 
	(
	SELECT ID
	FROM Patient
	WHERE ID= @PatientID 
	)
	BEGIN
		IF EXISTS
		(
		SELECT 1
		FROM Appointment
		WHERE PatientID = @PatientID  AND AppointmentID= @AppointmentID
		)
		begin
			insert into Feedback(PatientID,AppointmentID,Rating,Suggestion)
			values (@PatientID ,
			@AppointmentID ,
			@Rating ,
			@Suggestion)
			print ' Thank You for your valuable feedback!'
		end
		else
		begin
			print 'Invalid Appointment ID!. Kindly Try Again with Valid Appointment ID.'
		end
	end
	else
	begin
		print 'Invalid Patient ID!. Kindly Try Again with Valid Appointment ID.'
	end
end try
begin catch
	--print error_message()
	if ERROR_MESSAGE() like '%UQ_AppointmendID%'
	begin 
		print'We are Deeply Sorry but Multiple Feedbacks are not allowed!.'
	end
end catch
end


select * from Feedback

truncate table feedback