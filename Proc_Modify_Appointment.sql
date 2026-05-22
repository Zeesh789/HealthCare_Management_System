/**************************************************************
    Script Name         : Proc_Modify_Appointment.sql
    Purpose             : Creating Stored Procedure for Patient Login
    Created By          : Zeeshan Shaikh
    Created On          : 14/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 17/04/26
    Modified            : Updated Version 1
****************************************************************/

use dbHealthCareManagement
go

alter proc Proc_Modify_Appointment
@Action nvarchar(15),
@UserId int ,
@AppointmentID int,
@SlotID int = null
as
begin
	set nocount on
	begin try
		begin tran rescheduleAppointment
			if lower(@Action) = 'cancellation'
			begin
				if exists (select 1 from Appointment where @AppointmentID = AppointmentID and @UserId = PatientID)
					begin
						delete from Appointment
						where AppointmentID = @AppointmentID
						--trigger to free up the slot
						print 'Appointment Cancelled Successfully!. '
						--commit tran rescheduleAppointment
					end
				else
					begin
						print 'Wrong ID!. Please Try Again'
						rollback tran rescheduleAppointment
						return
					end
			end
			else if lower(@Action) = 'reschedule'
			begin
				if exists (select 1 from Appointment where @AppointmentID = AppointmentID and @UserId = PatientID)
				begin					
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
												insert into Appointment(PatientID,SlotID)
												values(@UserID,@SlotID)
												DECLARE @NewID INT = SCOPE_IDENTITY();
												print 'Appointment Booked Successfully!'
												--- Trigger to mark the slot booked
												select * from Appointment where AppointmentID = @NewID
												delete from Appointment
												where AppointmentID = @AppointmentID
												--trigger to free up the slot
												print 'Appointment Rescheduled Successfully!. '
											end
											else
											begin
												print 'Date has passed Already. Kindly book slot for another date'
												print 'Invalid slot ID for rescheduling. Kindly enter a different Slot ID for rescheduling. '
												rollback tran rescheduleAppointment
												return
											end
										end
										else
										begin
											print 'Slot not Available! Kindly Book another slot.'
											rollback tran rescheduleAppointment
											print 'Invalid slot ID for rescheduling. Kindly enter a different Slot ID for rescheduling. '
											return
										end
							end
							else
							begin
								rollback tran rescheduleAppointment
								print 'Invalid slot ID for rescheduling. Kindly enter a different Slot ID for rescheduling. '
								return
							end
					end
					else
						begin
							print 'Invalid Patient ID!'
							rollback tran rescheduleAppointment
							return
						end					
				end
				else
				begin
					print 'Wrong ID!. Please Try Again'
					rollback tran rescheduleAppointment
					return
				end
			end
			else	
			begin
				Print 'Invalid Action Type!!. Please Try Again.'
				rollback tran rescheduleAppointment
				return
			end
		commit tran rescheduleAppointment
		
	end try
	begin catch
	 IF @@TRANCOUNT > 0
			rollback tran rescheduleAppointment
		print 'Invalid slot ID for rescheduling. Kindly enter a different Slot ID for rescheduling. '
	end catch
end


select * from Appointment
select * from vw_Doctor_Slots

exec Proc_Modify_Appointment @Action = 'RESCHEDULE' , @UserId=1  ,@AppointmentID= 8, @SlotID = 29
exec Proc_Modify_Appointment @Action = 'Cancellation' , @UserId=1  ,@AppointmentID=1 , @SlotID = 3

select * from Appointment
select * from vw_Doctor_Slots