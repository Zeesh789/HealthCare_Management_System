/**************************************************************
    Script Name         : Constraints.sql
    Purpose             : Constraints for the Health Care Management System 
    Created By          : Zeeshan Shaikh
    Created On          : 13/04/26
    Modified By         : Zeeshan Shaikh
    Modified On         : 14/04/26
    Modified            : Update version 1
****************************************************************/

use dbHealthCareManagement
go

-- Patient Table Constraints

ALTER TABLE Patient
add CONSTRAINT chk_Patient_FirstName_only_letters
CHECK (FirstName NOT LIKE '%[^a-zA-Z]%' and LEN(FirstName)>=3);

ALTER TABLE Patient
add CONSTRAINT chk_Patient_LastName_only_letters
CHECK (LastName IS NULL OR LastName NOT LIKE '%[^a-zA-Z''-]%');

ALTER TABLE Patient
add CONSTRAINT chk_Patient_EmailID_No_Spaces
CHECK (EmailID NOT LIKE '% %' and EmailID like '%@%.%' and len(EmailID)>10);

ALTER TABLE Patient
add CONSTRAINT chk_Patient_Age_Not_Possible
CHECK (Age > 0 and Age < 125);

ALTER TABLE Patient
add CONSTRAINT chk_Patient_GovernmentID_only_Valid_options
CHECK (GovernmentID NOT LIKE '%[^a-zA-Z0-9]%' and LEN(GovernmentID) BETWEEN 8 AND 15) ;

ALTER TABLE Patient
add CONSTRAINT chk_Patient_Username_only_Valid_options
CHECK (Username NOT LIKE '%[^a-zA-Z0-9]%' and LEN(Username) BETWEEN 8 AND 15) ;

ALTER TABLE Patient
add CONSTRAINT chk_Patient_Password_only_Valid_options
CHECK (
    LEN([Password]) BETWEEN 8 AND 15
    AND [Password] NOT LIKE '% %'
    AND [Password] LIKE '%[A-Z]%'
    AND [Password] LIKE '%[a-z]%'
    AND [Password] LIKE '%[0-9]%'
);

ALTER TABLE Patient
add CONSTRAINT UQ_Patient_Username UNIQUE (Username);

-- End of Patient Table Constraints

-- Doctor Table Constraints

ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_FirstName_only_letters
CHECK (FirstName NOT LIKE '%[^a-zA-Z]%' and LEN(FirstName)>=3);

ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_LastName_only_letters
CHECK (LastName IS NULL OR LastName NOT LIKE '%[^a-zA-Z''-]%');

ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_EmailID_No_Spaces
CHECK (EmailID NOT LIKE '% %' and EmailID like '%@HCMS.com' and len(EmailID)>9);

ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_Specialization_only_letters
CHECK (Specialization NOT LIKE '%[^a-zA-Z ]%');

ALTER TABLE Doctor
ADD CONSTRAINT Default_Doctor_Specialization
DEFAULT 'General Physician' FOR Specialization;

ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_Experience_Not_Possible
CHECK (Experience >= 0 and Experience < 61);


ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_Username_only_Valid_options
CHECK (Username NOT LIKE '%[^a-zA-Z0-9]%' and LEN(Username) BETWEEN 8 AND 15) ;

ALTER TABLE Doctor
add CONSTRAINT chk_Doctor_Password_only_Valid_options
CHECK (
    LEN([Password]) BETWEEN 8 AND 15
    AND [Password] NOT LIKE '% %'
    AND [Password] LIKE '%[A-Z]%'
    AND [Password] LIKE '%[a-z]%'
    AND [Password] LIKE '%[0-9]%'
);

ALTER TABLE Doctor
add CONSTRAINT UQ_Doctor_Username UNIQUE (Username);

-- End of Doctor Table Constraints

-- Slots Table Constraints

Alter Table Slots
add constraint UQ_Slots_Slots
	UNIQUE (DoctorID, [Date], [Slots(30:mins)]);

-- Feedback Table

alter table feedback
add constraint UQ_AppointmendID
	unique(AppointmentID)

-- Appointment Table Constraints

	alter table Appointment
	add
	CONSTRAINT FK_Appointment_Patient
    FOREIGN KEY (PatientID)
    REFERENCES Patient(ID)

	alter table Appointment
	add
	CONSTRAINT FK_Appointment_Slot
    FOREIGN KEY (SlotID)
    REFERENCES Slots(SlotID)
