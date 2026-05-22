/**************************************************************
    Script Name         : proc_vieworderTable.sql
    Purpose             : Creating a SP to view the Patient Table
    Created By          : Zeeshan Shaikh
    Created On          : 15/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Initial version 1
****************************************************************/

use dbHealthCareManagement
go

alter proc proc_vieworderTable
@appointid int
as 
begin
	set nocount on
	Select top 1 AppointmentID,OrderStatus,Transaction_Time from MedOrder where AppointmentID = @appointid
	group by AppointmentID,OrderStatus,Transaction_Time
	order by Transaction_Time desc

	select cast(P.MedicineID as nvarchar(5)) as MedicineID,
	M.MedName,
	P.MedicineAmount,
	M.MedPrice ,
	CAST(round(P.MedicineAmount * M.MedPrice * 1.0 /10,2)AS DECIMAL(10,2)) as Total 
	from Prescription P
	join Medicine M
	on P.MedicineID = M.MedicineID
	where AppointmentID = @appointid
	group by P.MedicineID,M.MedPrice ,P.MedicineAmount , M.MedName

	UNION ALL

	SELECT 
    'Total' as MedicineID,
	'',
    '',
    '',
    CAST(SUM(CAST(round(P.MedicineAmount * M.MedPrice * 1.0 /10,2)AS DECIMAL(10,2))) AS DECIMAL(10,2))
	FROM Prescription P
	join Medicine M
	on P.MedicineID = M.MedicineID
	where AppointmentID = @appointid

end

select * from Prescription

exec proc_vieworderTable @appointid=16

select * from Medicine