/**************************************************************
    Script Name         : proc_viewAppointmentTable.sql
    Purpose             : Creating a SP to view the Patient Table
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

create proc proc_viewAppointmentTable
as 
begin
	Select * from Appointment
end

exec proc_viewAppointmentTable