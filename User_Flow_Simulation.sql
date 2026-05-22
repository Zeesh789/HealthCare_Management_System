/**************************************************************
    Script Name         : User_Flow_Simulation.sql
    Purpose             : Simulating a complete user journey in the system
    Created By          : Zeeshan Shaikh
    Created On          : 14/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 20/04/26
    Modified            : Updated version 3
****************************************************************/

use dbHealthCareManagement
go

-- Step 1 : Registration of User

exec proc_viewPatientTable-- Patient Table
delete from Patient
where ID = 12

exec sprocRegistration
@FirstName = 'Zeeshan',
@LastName ='Shaikh',
@Age = 22,
@EmailID = 'zeeshanshaikh@gmail.com',
@GovernmentID = '862778888978',
@Username = 'Zeeshan839',
@Password= 'Zeeshan@123'

exec proc_viewPatientTable  -- Patient Table

-- Step 2 : User Login 

exec proc_viewPatientTable -- Patient Table

exec Proc_Login 
	@username = 'Zeeshan839',
	@Password = 'Zeeshan@123'

-- Step 3 : Appointment Display

exec Proc_View_Doctor_Slots  --  Doctor Slots without filters 

exec Proc_View_Doctor_Slots @specialization = 'Cardiology',		 -- Doctor Slots with filters
@Status = 'Available',
@date = '2026-04-20' 


-- Step 4 : Book Appointment

exec proc_viewAppointmentTable -- Appointment Table 
exec Proc_View_Doctor_Slots -- Doctor Slots

exec Proc_Book_Appointment 
@userID = 13 ,
@SlotID = 54

exec proc_viewAppointmentTable -- Appointment Table
exec Proc_View_Doctor_Slots -- Doctor Slots



-- Step 5 (OPTIONAL STEP) : Reschedule OR Cancellation of Appointment

exec Proc_Modify_Appointment   -- RESCHEDULE APPOINTMENT
@Action = 'RESCHEDULE' ,
@UserId=13  ,
@AppointmentID=19 ,
@SlotID = 58

exec proc_viewAppointmentTable		-- Appointment Table
exec Proc_View_Doctor_Slots  -- Doctor Slots 

exec Proc_Modify_Appointment   -- Cancellation APPOINTMENT
@Action = 'cancellation' ,
@UserId=13  ,
@AppointmentID=20

exec proc_viewAppointmentTable  -- Appointment Table
exec Proc_View_Doctor_Slots  -- Doctor Slots 

-- Step 6 : Prescription Created (DOCTOR)

exec proc_viewMedicineTable -- Medicine Table

declare @Medinfo prescriptiontabletype -- declaring a variable of table valued type
insert into @Medinfo					-- Inserting values in the table variable
values (21,1,20,'2 times a day after food'), --First parameter = Appointment ID, 2nd = Medicine ID, 3rd = Amount of medicine prescribed, 4th = Note regarding the dosage
		(21,2,10,'1 time a day before sleep')

exec Proc_CreatePrescription @Medinfo -- Passing the table values to the SP which in turn reflect into Prescription Table

exec proc_viewPrescriptionTable  -- Prescription Table

--truncate table prescription

--Step 7 : Order Medicine


exec Proc_OrderMedicine @userid= 13, @appointid = 21 -- Entering Appointment ID to get the medicine details
exec proc_viewMedicineTable -- Medicine table
exec proc_vieworderTable @appointid = 21


--update Medicine
--set MedStock = 100

-- Step 8 : Feedback 

exec Proc_Feedback  --Taking Feedback from the patient about their appointment
	@patientID = 13,
	@appointmentID = 21,
	@rating = 3,
	@suggestion = 'NA';		-- Suggestion is optional

exec proc_viewFeedBackTable -- Feedback Table



-- Admin Reports

exec proc_viewDoctorRating  -- Doctor Ratings
exec proc_AdminMedicineReport	-- Medicine Report 








