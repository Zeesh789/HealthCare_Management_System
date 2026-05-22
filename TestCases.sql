/**************************************************************
    Script Name         : TestCases.sql

    Purpose             : TestCases for the Health Care Management System 

    Created By          : Zeeshan Shaikh

    Created On          : 13/04/26

    Modified By         : Zeeshan Shaikh

    Modified On         : 13/04/26

    Modified            : Initial version

****************************************************************/
 
use dbHealthCareManagement
go

-------------------------------------------
--Patient Table
-------------------------------------------

-- Duplicate Values

INSERT INTO Patient (FirstName, LastName, Age, EmailID, GovernmentID)
VALUES
	('John',   'Doe',     29, 'john.doe@example.com',        'GOVTID12345');

--NULL Values

INSERT INTO Patient (FirstName, LastName, Age, EmailID, GovernmentID)
VALUES
	('','', 1 ,'','');

-- Only Spaces  

INSERT INTO Patient (FirstName, LastName, Age, EmailID, GovernmentID)
VALUES
	(' ',' ', 1 ,'  ',' ');


-------------------------------------------
--Doctor Table
-------------------------------------------

--Duplicate INPUT

INSERT INTO Doctor  (FirstName, LastName, EmailID, Specialization, Experience)
VALUES
('Arjun',   'Sharma',  'arjun.sharma@HCMS.com',   'Cardiology',  12);

--NULL Values

INSERT INTO Doctor  (FirstName, LastName, EmailID, Specialization, Experience)
VALUES
('',   '',  '',   '', 12);

--Only Spaces Values

INSERT INTO Doctor  (FirstName, LastName, EmailID, Specialization, Experience)
VALUES
(' ',   ' ',  ' ',   ' ', 12);