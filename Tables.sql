/**************************************************************
    Script Name         : Tables.sql
    Purpose             : Creating Tables for the Health Care Management System 
    Created By          : Zeeshan Shaikh
    Created On          : 13/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 16/04/26
    Modified            : Update version 3
****************************************************************/
 
use dbHealthCareManagement
go

------------------------------------------------------------
-- Table Creation
------------------------------------------------------------

-- Patient Table

Create table Patient
(
	ID int not null identity primary key,
	FirstName nvarchar(20) not null,
	LastName nvarchar(20),
	Age int  not null,
	EmailID nvarchar(255) not null unique,
	GovernmentID nvarchar(15) not null unique,
	Username nvarchar(15) not null,
	Password nvarchar(15) not null
)

-- Doctor Table

Create table Doctor
(
	ID int not null identity primary key,
	FirstName nvarchar(20) not null,
	LastName nvarchar(20),
	EmailID nvarchar(255) not null unique,
	Specialization nvarchar(30), 
	Experience int  not null,
	Username nvarchar(15) not null,
	Password nvarchar(15)not null,
)

-- Slots Table

CREATE TABLE Slots
(	
	SlotID int identity primary key,
	DoctorID int not null,
    [Date] DATE DEFAULT CAST(GETDATE() AS DATE),
    [Day] AS DATENAME(WEEKDAY, [Date]),
	[Slots(30:mins)] TIME(0),
	[Status] nvarchar(15) default 'Available',
	constraint chk_status
	check ([Status] in ('Available','Not Available')),

	CONSTRAINT FK_Slots_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(ID)
);

-- Appointment Table

create table Appointment
(
	AppointmentID int identity primary key,
	PatientID int not null,
	SlotID int unique not null
)

-- Medicine Table

create table Medicine
(
	MedicineID int Primary key,
	MedName nvarchar(25) not null unique,
	MedPrice int not null,
	MedStock int not null
)

create table Prescription
(
	AppointmentID int not null,
	MedicineID int ,
	MedicineAmount int,
	Note nvarchar(30) not null
)

create type prescriptiontabletype as table
(
	AppointmentID int not null,
	MedicineID int ,
	MedicineAmount int,
	Note nvarchar(30) not null
)



create table MedOrder
(
	OrderID int identity Primary key,
	AppointmentID int not null ,
	OrderStatus nvarchar(12) not null,
	Transaction_Time DATETIME2(0) default getdate()
)


create table Feedback
(
	PatientID int not null,
	AppointmentID int not null,
	Rating int not null ,
	Suggestion nvarchar(50)
)



create table DoctorRating
(
	DoctorID int Primary Key,
	Rating decimal(10,2)
)

------------------------------------------------------------
-- Select Queries
------------------------------------------------------------

select * from Patient
select * from Doctor
select * from Slots 
select * from vw_Doctor_Slots --- View for Doctor Slot
select * from Appointment
select * from Medicine
select * from Prescription
select * from MedOrder
select * from Feedback
select * from DoctorRating




