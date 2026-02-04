Create Database [Managment_Employee]
GO
USE Managment_Employee
GO
Create Table Employee (
	EmployeeID INT Primary key,
	PersonID INT,
	DepartamentName nvarchar(50),
	JobDays DATETIME NOT NULL,
	Post nvarchar(50) NOT NULL,
	Cabinet INT NOT NULL,
	SupportID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	BossID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	);
GO
Create Table Person (
	PersonID INT Primary key,
	LastName nvarchar(50) NOT NULL,
	NamePerson nvarchar(30) NOT NULL,
	SecondName nvarchar(30),
	JobNumber INT NOT NULL,
	PersonalNumber INT,
	DateOfBirth DATETIME NOT NULL,
	Email nvarchar(MAX)
	);
GO
Create Table Candidate (
	CandidateID INT Primary key,
	PersonID INT,
	WorkStatus nvarchar(30) NOT NULL,
	);
GO
Create Table PersonResume (
	ResumeID INT Primary key,
	CandidateID INT,
	DateOfTakingResume DATETIME NOT NULL,
	CandidateInformation TEXT,
	FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
	);
GO
Create Table Departament (
	DepartamentName nvarchar(50) Primary Key,
	DescriptionDepartament TEXT,
	DepartamentEmail nvarchar(MAX) NOT NULL
	);
GO
Create Table Absence (
	AbsenceID INT PRIMARY KEY,
	EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	TypeAbsence nvarchar(50) NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	StatusAbsence nvarchar(50)
	);
Create Table Event (
	EventName nvarchar(50) PRIMARY KEY,
	TypeOfEvent nvarchar(50) NOT NULL,
	EventStatus nvarchar(50) NOT NULL,
	DateTimeOfTheEvent DATETIME NOT NULL,
	ResponsibleID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	ShortDescrition TEXT
	);
GO
Create Table Training (
	TrainingName nvarchar(50) PRIMARY KEY,
	MaterialName nvarchar(50),
	DescriptionTraining TEXT NOT NULL
	);
GO
Create Table Material (
	MaterialName nvarchar(50) PRIMARY KEY,
	DateOfAccess DATETIME NOT NULL,
	DateOfChange DATETIME,
	StatusMaterial nvarchar(50) NOT NULL,
	TypeOfMaterial nvarchar(50) NOT NULL,
	Area nvarchar(50) NOT NULL,
	Author nvarchar(50) NOT NULL
	);
GO
ALTER TABLE Employee
ADD CONSTRAINT fk_employee_person
Foreign key (PersonID) REFERENCES Person(PersonID)
GO
ALTER TABLE Employee
ADD CONSTRAINT fk_employee_departament
Foreign key (DepartamentName) REFERENCES Departament(DepartamentName)
GO
ALTER TABLE Candidate
ADD CONSTRAINT fk_candidate_person
Foreign key (PersonID) REFERENCES Person(PersonID)
GO
ALTER TABLE Training
ADD CONSTRAINT fk_training_material
FOREIGN KEY (MaterialName) REFERENCES Material(MaterialName)
