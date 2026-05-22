/**************************************************************
    Script Name         : Views.sql
    Purpose             : Views for the Health Care Management System 
    Created By          : Zeeshan Shaikh
    Created On          : 14/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 14/04/26
    Modified            : Initial version
****************************************************************/

use dbHealthCareManagement
go


------------------------------------------------------------
-- Doctor - Slots Views
------------------------------------------------------------


create view vw_Doctor_Slots as
Select S.SlotID,
concat ('Dr. ',D.FirstName, ' ' , D.lastName) as [Doctor Name],
D.Specialization,
S.[Date],
S.[Day],
S.[Slots(30:mins)],
S.[Status]
from Doctor D
join Slots S
on D.ID = S.DoctorID

select * from vw_Doctor_Slots