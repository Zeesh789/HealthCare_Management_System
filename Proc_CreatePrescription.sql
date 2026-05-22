/**************************************************************
    Script Name         : Proc_CreatePrescription.sql
    Purpose             : Creating Stored Procedure for Creating the Prescription
    Created By          : Zeeshan Shaikh
    Created On          : 16/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 16/04/26
    Modified            : Initial
****************************************************************/

use dbHealthCareManagement
go

------------------------------------------------------------
-- Procedure
------------------------------------------------------------

alter procedure Proc_CreatePrescription
@prescriptionDetails prescriptiontabletype readonly
as 
begin
	set nocount on
	insert into Prescription
	select * from @prescriptionDetails
end

declare @Medinfo prescriptiontabletype
insert into @Medinfo
values (3,1,20,'2 times a day after food'),
		(3,2,10,'1 time a day before sleep')

exec Proc_CreatePrescription @Medinfo

select * from Prescription