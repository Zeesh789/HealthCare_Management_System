/**************************************************************
    Script Name         : tr_delete_Appointment.sql
    Purpose             : Creating trigger for delete operation when rescheduling or cancelling Appointments
    Created By          : Zeeshan Shaikh
    Created On          : 14/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Updated Version 1
****************************************************************/

use dbHealthCareManagement
go

Create trigger tr_free_Slot_After_Modify_Procedure
on appointment
after DELETE
as
begin
		update  S
		set Status = 'Available'
		FROM [dbo].[Slots] S
		JOIN deleted D
        ON S.SlotID = D.SlotID;
end

exec Proc_Modify_Appointment @Action = 'cancellation' , @UserId=2  ,@AppointmentID=15
select * from Appointment
delete from Appointment
where AppointmentID = 8 

select * from Slots