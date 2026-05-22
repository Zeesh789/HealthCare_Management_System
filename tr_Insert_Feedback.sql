/**************************************************************
    Script Name         : tr_Insert_Feedback.sql
    Purpose             : Creating trigger for Insert operation when Feedbacks are given
    Created By          : Zeeshan Shaikh
    Created On          : 20/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 20/04/26
    Modified            : Initial Version
****************************************************************/

use dbHealthCareManagement
go

Create trigger tr_update_rating_based_on_feedback
on Feedback
after INSERT
as
begin
		update  DoctorRating
		set DoctorRating.Rating = R.Rating
		FROM DoctorRating join
		(
        SELECT 
            Slots.DoctorID,
            AVG(CAST(Feedback.Rating AS DECIMAL(10,2))) AS Rating
			from Feedback join Appointment 
			on Feedback.AppointmentID = Appointment.AppointmentID
			join Slots
			on slots.SlotID = Appointment.SlotID
			group by slots.doctorID) R
		on DoctorRating.DoctorID =  R.DoctorID;
end