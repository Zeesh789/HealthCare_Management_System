/**************************************************************
    Script Name         : Insert_Data.sql
    Purpose             : Inserting Data into Tables for the Health Care Management System 
    Created By          : Zeeshan Shaikh
    Created On          : 13/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 15/04/26
    Modified            : Updated version 2 
****************************************************************/
 
use dbHealthCareManagement
go

-----------------------------------
-- Patient Table
-----------------------------------

INSERT INTO Patient (FirstName, LastName, Age, EmailID, GovernmentID)
VALUES
	('Zeeshan',   'Shaikh',    22, 'zeeshan.shaikh@example.com', '863967575678'),
	('Aisha',  'Khan',    34, 'aisha.khan@mail.com',         'GOV12345678'),
	('Rahul',  'Sharma',  45, 'rahul.sharma@health.org',     'GOV98765432'),
	('Meera',  'Patel',   22, 'meera.patel@domain.in',       'GOVTID98765'),
	('Vikram', 'Singh',   60, 'vikram.singh@hospital.net',   'GOVID2026001'),
	('Neha',   'Verma',   19, 'neha.verma@outlook.com',      'GOVTID54321'),
	('Arjun',  'Iyer',    38, 'arjun.iyer@clinic.co.in',     'GOVTIDABC12'),
	('Sana',   'Ahmed',   27, 'sana.ahmed@healthcare.org',   'GOVT9876543');


UPDATE Patient
SET Username = CASE ID
    WHEN 1 THEN 'johnDoe01'
    WHEN 2 THEN 'aishaKhan1'
    WHEN 3 THEN 'rahulSharma'
    WHEN 4 THEN 'meeraPatel'
    WHEN 5 THEN 'vikramSingh'
    WHEN 6 THEN 'nehaVerma12'
    WHEN 7 THEN 'arjunIyer9'
    WHEN 8 THEN 'sanaAhmed88'
    WHEN 9 THEN 'zeeshanS22'
END,
Password = CASE ID
    WHEN 1 THEN 'John@123A'
    WHEN 2 THEN 'Aisha@123B'
    WHEN 3 THEN 'Rahul@123C'
    WHEN 4 THEN 'Meera@123D'
    WHEN 5 THEN 'Vikram@123E'
    WHEN 6 THEN 'Neha@123F'
    WHEN 7 THEN 'Arjun@123G'
    WHEN 8 THEN 'Sana@123H'
    WHEN 9 THEN 'Zeeshan@123I'
END;

------------------------------
-- Doctor Table
------------------------------

INSERT INTO Doctor  (FirstName, LastName, EmailID, Specialization, Experience)
VALUES
('Arjun',   'Sharma',  'arjun.sharma@HCMS.com',   'Cardiology',        12),
('Meera',   'Iyer',    'meera.iyer@HCMS.com',     'Neurology',         8),
('Ravi',    'Kumar',   'ravi.kumar@HCMS.com',     'Orthopedics',       15),
('Sneha',   'Patel',   'sneha.patel@HCMS.com',    'Dermatology',       5),
('Vikram',  'Singh',   'vikram.singh@HCMS.com',  'Pediatrics',        20),
('Anita',   'Verma',   'anita.verma@HCMS.com',    DEFAULT,				7),
('Rahul',   'Nair',    'rahul.nair@HCMS.com',     'Oncology',          18),
('Pooja',   'Das',     'pooja.das@HCMS.com',      DEFAULT,             3),
('Karan',   'Mehta',   'karan.mehta@HCMS.com',    'ENT',               25),
('Divya',   'Reddy',   'divya.reddy@HCMS.com',    'Psychiatry',        7);

UPDATE Doctor
SET Username = CASE ID
    WHEN 1 THEN 'arjun1234'
    WHEN 2 THEN 'meera5678'
    WHEN 3 THEN 'ravi9012'
    WHEN 4 THEN 'sneha3456'
    WHEN 5 THEN 'vikram789'
    WHEN 6 THEN 'anita2345'
    WHEN 7 THEN 'rahul6789'
    WHEN 8 THEN 'pooja1122'
    WHEN 9 THEN 'karan3344'
    WHEN 10 THEN 'divya5566'
END,
[Password] = CASE ID
    WHEN 1 THEN 'Arjun@123A'
    WHEN 2 THEN 'Meera@123B'
    WHEN 3 THEN 'Ravi@123C'
    WHEN 4 THEN 'Sneha@123D'
    WHEN 5 THEN 'Vikram@123E'
    WHEN 6 THEN 'Anita@123F'
    WHEN 7 THEN 'Rahul@123G'
    WHEN 8 THEN 'Pooja@123H'
    WHEN 9 THEN 'Karan@123I'
    WHEN 10 THEN 'Divya@123J'
END;

------------------------------
-- Slots Table
------------------------------

insert into slots (DoctorID,[Date],[Slots(30:mins)])
values
	(1,'2026-04-15','10:00'),
	(1,'2026-04-15','11:00'),
	(1,'2026-04-15','12:00'),
	(1,'2026-04-16','10:00'),
	(1,'2026-04-16','11:00'),
	(1,'2026-04-16','12:00'),
	(1,'2026-04-17','10:00'),
	(1,'2026-04-17','11:00'),
	(1,'2026-04-17','12:00'),
	(1,'2026-04-20','10:00'),
	(1,'2026-04-20','11:00'),
	(1,'2026-04-20','12:00'),
	(1,'2026-04-21','10:00'),
	(1,'2026-04-21','11:00'),
	(1,'2026-04-21','12:00'),
	(1,'2026-04-22','10:00'),
	(1,'2026-04-22','11:00'),
	(1,'2026-04-22','12:00'),
	(1,'2026-04-23','10:00'),
	(1,'2026-04-23','11:00'),
	(1,'2026-04-23','12:00'),
	(3,'2026-04-15','10:00'),
	(3,'2026-04-15','11:00'),
	(3,'2026-04-15','12:00'),
	(3,'2026-04-16','10:00'),
	(3,'2026-04-16','11:00'),
	(3,'2026-04-16','12:00'),
	(3,'2026-04-17','10:00'),
	(3,'2026-04-17','11:00'),
	(3,'2026-04-17','12:00'),
	(3,'2026-04-20','10:00'),
	(3,'2026-04-20','11:00'),
	(3,'2026-04-20','12:00'),
	(3,'2026-04-21','10:00'),
	(3,'2026-04-21','11:00'),
	(3,'2026-04-21','12:00'),
	(3,'2026-04-22','10:00'),
	(3,'2026-04-22','11:00'),
	(3,'2026-04-22','12:00'),
	(3,'2026-04-23','10:00'),
	(3,'2026-04-23','11:00'),
	(3,'2026-04-23','12:00'),
	(4,'2026-04-15','10:00'),
	(4,'2026-04-15','11:00'),
	(4,'2026-04-15','12:00'),
	(4,'2026-04-16','10:00'),
	(4,'2026-04-16','11:00'),
	(4,'2026-04-16','12:00'),
	(4,'2026-04-17','10:00'),
	(4,'2026-04-17','11:00'),
	(4,'2026-04-17','12:00'),
	(4,'2026-04-20','10:00'),
	(4,'2026-04-20','11:00'),
	(4,'2026-04-20','12:00'),
	(4,'2026-04-21','10:00'),
	(4,'2026-04-21','11:00'),
	(4,'2026-04-21','12:00'),
	(4,'2026-04-22','10:00'),
	(4,'2026-04-22','11:00'),
	(4,'2026-04-22','12:00'),
	(4,'2026-04-23','10:00'),
	(4,'2026-04-23','11:00'),
	(4,'2026-04-23','12:00'),
	(6,'2026-04-15','10:00'),
	(6,'2026-04-15','11:00'),
	(6,'2026-04-15','12:00'),
	(6,'2026-04-16','10:00'),
	(6,'2026-04-16','11:00'),
	(6,'2026-04-16','12:00'),
	(6,'2026-04-17','10:00'),
	(6,'2026-04-17','11:00'),
	(6,'2026-04-17','12:00'),
	(6,'2026-04-20','10:00'),
	(6,'2026-04-20','11:00'),
	(6,'2026-04-20','12:00'),
	(6,'2026-04-21','10:00'),
	(6,'2026-04-21','11:00'),
	(6,'2026-04-21','12:00'),
	(6,'2026-04-22','10:00'),
	(6,'2026-04-22','11:00'),
	(6,'2026-04-22','12:00'),
	(6,'2026-04-23','10:00'),
	(6,'2026-04-23','11:00'),
	(6,'2026-04-23','12:00'),
	(8,'2026-04-15','10:00'),
	(8,'2026-04-15','11:00'),
	(8,'2026-04-15','12:00'),
	(8,'2026-04-16','10:00'),
	(8,'2026-04-16','11:00'),
	(8,'2026-04-16','12:00'),
	(8,'2026-04-17','10:00'),
	(8,'2026-04-17','11:00'),
	(8,'2026-04-17','12:00'),
	(8,'2026-04-20','10:00'),
	(8,'2026-04-20','11:00'),
	(8,'2026-04-20','12:00'),
	(8,'2026-04-21','10:00'),
	(8,'2026-04-21','11:00'),
	(8,'2026-04-21','12:00'),
	(8,'2026-04-22','10:00'),
	(8,'2026-04-22','11:00'),
	(8,'2026-04-22','12:00'),
	(8,'2026-04-23','10:00'),
	(8,'2026-04-23','11:00'),
	(8,'2026-04-23','12:00');

------------------------------
-- Medicine Table
------------------------------

insert into Medicine(MedicineID,MedName,MedPrice,MedStock)
values 
		(1		,'	Paracetamol'	,	50		,	100		 ),
		(2		,'	Amoxicillin'	,	125		,	100		 ),
		(3		,'	Cetirizine'		,	60		,	100		 ),
		(4		,'	Thyronorm'		,	75		,	100		 ),
		(5		,'	Avil'			,	30		,	100		 ),
		(6		,'	Altrin-M'		,	110		,	100		 ),
		(7		,'	Combiflam'		,	120		,	100		 ),
		(8		,'	Gemcal Plus'	,	400		,	100		 ),
		(9		,'	Zincovit'		,	300		,	100		 ),
		(10		,'	Losartan'		,	120		,	100		 );

insert into DoctorRating(DoctorID)
values (1),(3),(4),(6),(8)