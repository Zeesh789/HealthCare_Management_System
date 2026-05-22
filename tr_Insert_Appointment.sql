/**************************************************************
    Script Name         : tr_Insert_Appointment.sql
    Purpose             : Creating trigger for Insert operation when Booking Appointments
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Initial Version
****************************************************************/

use dbHealthCareManagement
go

Create trigger tr_Book_Slot_After_Booking_Appointment
on appointment
after INSERT
as
begin
		update  S
		set Status = 'Not Available'
		FROM [dbo].[Slots] S
		JOIN Inserted I
        ON S.SlotID = I.SlotID;
end