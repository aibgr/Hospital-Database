CREATE TABLE Hospitals (
    Address VARCHAR(255),
    Name VARCHAR(255),
    PostalCode INT PRIMARY KEY
);

CREATE TABLE HospitalsPhoneNumbers (
    PostalCode INT,
    PhoneNumber INT,
    CONSTRAINT PK_HP PRIMARY KEY (PostalCode, PhoneNumber),
    CONSTRAINT FK_HospitalsPhoneNumbers_PostalCode FOREIGN KEY (PostalCode) REFERENCES Hospitals(PostalCode)
);

CREATE TABLE Users (
    UserID INT NOT NULL PRIMARY KEY,
    Address VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);

CREATE TABLE UsersPhoneNumbers (
    UserID INT,
    PhoneNumber INT,
    CONSTRAINT PK_UP PRIMARY KEY (UserID, PhoneNumber),
    CONSTRAINT FK_UsersPhoneNumbers_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Patients (
    HasInsurance INT,
    CodeInsurance INT,
    UserID INT,
    CONSTRAINT FK_Patients_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT PK_Patients PRIMARY KEY (UserID)
);

CREATE TABLE Doctors (
    MedicalCouncilCode INT NOT NULL UNIQUE,
    MedicalSpeciality VARCHAR(255),
    UserID INT,
    CONSTRAINT FK_Doctors_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT PK_Doctors PRIMARY KEY (UserID)
);

CREATE TABLE Prescriptions (
    Date DATE NOT NULL,
    DoctorUserID INT,
    PatientUserID INT,
    CONSTRAINT FK_Prescriptions_DoctorUserID FOREIGN KEY (DoctorUserID) REFERENCES Doctors(UserID),
    CONSTRAINT FK_Prescriptions_PatientUserID FOREIGN KEY (PatientUserID) REFERENCES Patients(UserID),
    CONSTRAINT PK_Prescriptions PRIMARY KEY (Date, DoctorUserID, PatientUserID)
);

CREATE TABLE Medicines (
    Type VARCHAR(255) NOT NULL,
    MedicineID INT NOT NULL PRIMARY KEY,
    HasInsurance INT
);

CREATE TABLE Pharmacies (
    Address VARCHAR(255),
    ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Transactions (
    Date DATE,
    ID INT,
    PharmacyID INT,
    PatientUserID INT,
    CONSTRAINT FK_Transactions_PatientUserID FOREIGN KEY (PatientUserID) REFERENCES Patients(UserID),
    CONSTRAINT FK_Transactions_PharmacyID FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(ID),
    CONSTRAINT PK_Transactions PRIMARY KEY (ID, PharmacyID, PatientUserID)
);

CREATE TABLE PatientsMeetDoctors (
    Date DATE,
    PatientID INT,
    DoctorID INT,
    CONSTRAINT PK_PatientsMeetDoctors PRIMARY KEY (Date, PatientID, DoctorID)
);

CREATE TABLE PrescriptionMedicines (
    PrescriptionDate DATE,
    DoctorUserID INT,
    PatientUserID INT,
    MedicineID INT,
    CONSTRAINT FK_PrescriptionMedicines_Prescriptions FOREIGN KEY (PrescriptionDate, DoctorUserID, PatientUserID) REFERENCES Prescriptions (Date, DoctorUserID, PatientUserID),
    CONSTRAINT FK_PrescriptionMedicines_Medicines FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    CONSTRAINT PK_PrescriptionMedicines PRIMARY KEY (PrescriptionDate, DoctorUserID, PatientUserID, MedicineID)
);

CREATE TABLE TransactionMedicines (
    TID INT,
    PharmacyID INT,
    PatientUserID INT,
    MedicineID INT NOT NULL,
    NoOfMedicine INT NOT NULL,
    CONSTRAINT FK_TransactionMedicines_Transactions FOREIGN KEY (TID, PharmacyID, PatientUserID) REFERENCES Transactions(ID, PharmacyID, PatientUserID),
    CONSTRAINT FK_TransactionMedicines_Medicines FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    CONSTRAINT PK_TransactionMedicines PRIMARY KEY (TID, PharmacyID, PatientUserID, MedicineID)
);

CREATE TABLE DoctorHospital (
    DoctorUserID INT,
    HospitalID INT,
    StartDate DATE NOT NULL,
    EndDate DATE,
    CONSTRAINT FK_DoctorHospital_DoctorUserID FOREIGN KEY (DoctorUserID) REFERENCES Doctors(UserID),
    CONSTRAINT FK_DoctorHospital_HospitalID FOREIGN KEY (HospitalID) REFERENCES Hospitals(PostalCode),
    CONSTRAINT PK_DoctorHospital PRIMARY KEY (DoctorUserID, HospitalID, StartDate)
);

CREATE TABLE PatientHospital (
    PatientUserID INT,
    HospitalID INT,
    StartDate DATE NOT NULL,
    CONSTRAINT FK_PatientHospital_PatientUserID FOREIGN KEY (PatientUserID) REFERENCES Patients(UserID),
    CONSTRAINT FK_PatientHospital_HospitalID FOREIGN KEY (HospitalID) REFERENCES Hospitals(PostalCode),
    CONSTRAINT PK_PatientHospital PRIMARY KEY (PatientUserID, HospitalID, StartDate)
);