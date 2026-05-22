/**************************************************************
    Script Name         : proc_viewPatientTable.sql
    Purpose             : Creating a SP to view the Patient Table
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

create proc proc_viewPatientTable
as 
begin
	Select * from Patient
end

exec proc_viewPatientTable