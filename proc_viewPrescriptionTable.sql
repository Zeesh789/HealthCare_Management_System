/**************************************************************
    Script Name         : proc_viewPrescriptionTable.sql
    Purpose             : Creating a SP to view the Patient Table
    Created By          : Zeeshan Shaikh
    Created On          : 16/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 16/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

alter proc proc_viewPrescriptionTable
as 
begin
	select * from Prescription
end

exec proc_viewPrescriptionTable