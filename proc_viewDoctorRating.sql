/**************************************************************
    Script Name         : proc_viewDoctorRating.sql
    Purpose             : Creating a SP to view the Doctor Rating Table Admin only
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

create proc proc_viewDoctorRating
as 
begin
	Select * from DoctorRating
end

exec proc_viewDoctorRating