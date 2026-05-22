/**************************************************************
    Script Name         : proc_viewMedicineTable.sql
    Purpose             : Creating a SP to view the Patient Table
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

alter proc proc_viewMedicineTable
as 
begin
	Select * from Medicine
end

exec proc_viewMedicineTable