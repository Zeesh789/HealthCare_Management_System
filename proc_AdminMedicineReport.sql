/**************************************************************
    Script Name         : proc_AdminMedicineReport.sql
    Purpose             : Creating a SP to view the Medicine Report :  Admin only
    Created By          : Zeeshan Shaikh
    Created On          : 20/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 20/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

alter procedure proc_AdminMedicineReport
as
begin

select 
	MedOrder.OrderID,
	P.MedicineID,
	M.MedName,
	P.MedicineAmount,
	M.MedPrice
	from Prescription P
	join Medicine M
	on P.MedicineID = M.MedicineID
	join MedOrder 
	on MedOrder.AppointmentID = P.AppointmentID
	where MedOrder.OrderStatus = 'Successfull'

end

exec proc_AdminMedicineReport

exec proc_vieworderTable @appointid=16