/**************************************************************
    Script Name         : Proc_Book_Appointment.sql
    Purpose             : Creating Stored Procedure for Booking Appointment with the Doctor
    Created By          : Zeeshan Shaikh
    Created On          : 14/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 17/04/26
    Modified            : IUpdated Version 2
****************************************************************/

use dbHealthCareManagement
go

------------------------------------------------------------
-- Procedure
------------------------------------------------------------

alter proc Proc_Book_Appointment
@UserID int,
@SlotID int
as
begin 
set nocount on
			IF EXISTS (
			SELECT 1
			FROM Patient
			WHERE ID = @UserID )
			begin	
				   IF EXISTS (
					SELECT 1
					FROM Slots
					WHERE SlotID = @SlotID )
					begin
						IF EXISTS (
						 SELECT 1
						 FROM Slots
						 WHERE SlotID = @SlotID  AND [Status] = 'Available'	)
								begin
									IF EXISTS (
									SELECT 1
									FROM Slots
									WHERE SlotID = @SlotID  AND [Status] = 'Available' and Slots.Date >= cast(GETDATE() as date))
									begin
									--select * from Slots
										insert into Appointment(PatientID,SlotID)
										values(@UserID,@SlotID)

										DECLARE @NewID INT = SCOPE_IDENTITY();
										print 'Appointment Booked Successfully!'
										--- Trigger to mark the slot booked
										select * from Appointment where AppointmentID = @NewID
									end
									else
									begin
										print 'Date has passed Already. Kindly book slot for another date'
									end
								end
								else
								begin
									print 'Slot not Available! Kindly Book another slot.'
									return
								end
					end
					else
					begin
						print ' Invalid SlotID! Please recheck and book the slot.'
						return
					end
			end
			else
			begin
				print 'Invalid Patient ID!'
				return
			end
end

------------------------------------------------------------
-- Test Cases
------------------------------------------------------------

-- Base Case


select * from Appointment
select * from vw_Doctor_Slots

exec Proc_Book_Appointment 
@userID = 1 ,
@SlotID = 96

select * from Appointment
select * from vw_Doctor_Slots


-- Duplicate Case

select * from Appointment
select * from vw_Doctor_Slots

-- Invalid Case

select * from Appointment
select * from vw_Doctor_Slots