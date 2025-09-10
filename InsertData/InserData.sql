INSERT INTO Hospitals (Address, Name, PostalCode) VALUES
('123 Oak St', 'City Hospital', 10001),
('234 Maple St', 'General Hospital', 10002),
('345 Elm St', 'Central Hospital', 10003),
('456 Pine St', 'Northside Hospital', 10004),
('567 Birch St', 'East Hospital', 10005),
('678 Cedar St', 'West Hospital', 10006),
('789 Spruce St', 'South Hospital', 10007),
('890 Ash St', 'Metro Hospital', 10008),
('901 Willow St', 'Suburban Hospital', 10009),
('1012 Alder St', 'Downtown Hospital', 10010);

INSERT INTO HospitalsPhoneNumbers (PostalCode, PhoneNumber) VALUES
(10001, 1234567890),
(10001, 1234567891),
(10002, 1234567892),
(10003, 1234567893),
(10004, 1234567894),
(10005, 1234567895),
(10006, 1234567896),
(10007, 1234567897),
(10008, 1234567898),
(10009, 1234567899);


INSERT INTO Users (UserID, Address, FirstName, LastName) VALUES
(1, '111 A St', 'John', 'Doe'),
(2, '222 B St', 'Jane', 'Smith'),
(3, '333 C St', 'Alice', 'Johnson'),
(4, '444 D St', 'Bob', 'Lee'),
(5, '555 E St', 'Carol', 'Taylor'),
(6, '666 F St', 'David', 'Brown'),
(7, '777 G St', 'Eve', 'Davis'),
(8, '888 H St', 'Frank', 'Miller'),
(9, '999 I St', 'Grace', 'Wilson'),
(10, '1010 J St', 'Henry', 'Moore');

INSERT INTO UsersPhoneNumbers (UserID, PhoneNumber) VALUES
(1, 2345678901),
(2, 2345678902),
(3, 2345678903),
(4, 2345678904),
(5, 2345678905),
(6, 2345678906),
(7, 2345678907),
(8, 2345678908),
(9, 2345678909),
(10, 2345678910);

INSERT INTO Patients (HasInsurance, CodeInsurance, UserID) VALUES
(1, 101, 1),
(1, 102, 2),
(0, NULL, 3),
(1, 103, 4),
(0, NULL, 5),
(1, 104, 6),
(1, 105, 7),
(0, NULL, 8),
(1, 106, 9),
(1, 107, 10);

INSERT INTO Doctors (MedicalCouncilCode, MedicalSpeciality, UserID) VALUES
(1001, 'Cardiology', 1),
(1002, 'Neurology', 2),
(1003, 'Orthopedics', 3),
(1004, 'Pediatrics', 4),
(1005, 'Oncology', 5),
(1006, 'Dermatology', 6),
(1007, 'Psychiatry', 7),
(1008, 'Gastroenterology', 8),
(1009, 'Nephrology', 9),
(1010, 'Endocrinology', 10);

INSERT INTO Prescriptions (Date, DoctorUserID, PatientUserID) VALUES
('2023-01-01', 1, 1),
('2023-01-02', 2, 2),
('2023-01-03', 3, 3),
('2023-01-04', 4, 4),
('2023-01-05', 5, 5),
('2023-01-06', 6, 6),
('2023-01-07', 7, 7),
('2023-01-08', 8,8),
('2023-01-09', 9, 9),
('2023-01-10', 10, 10);

INSERT INTO Medicines (Type, MedicineID, HasInsurance) VALUES
('Analgesic', 1, 1),
('Antipyretic', 2, 1),
('Antibiotic', 3, 1),
('Antiseptic', 4, 0),
('Mood Stabilizer', 5, 1),
('Hormone Replacement', 6, 0),
('Oral Contraceptive', 7, 1),
('Stimulant', 8, 1),
('Tranquilizer', 9, 1),
('Statins', 10, 0);

INSERT INTO Pharmacies (Address, ID, Name) VALUES
('200 Main St', 1, 'Pharmacy A'),
('300 Second St', 2, 'Pharmacy B'),
('400 Third St', 3, 'Pharmacy C'),
('500 Fourth St', 4, 'Pharmacy D'),
('600 Fifth St', 5, 'Pharmacy E'),
('700 Sixth St', 6, 'Pharmacy F'),
('800 Seventh St', 7, 'Pharmacy G'),
('900 Eighth St', 8, 'Pharmacy H'),
('1000 Ninth St', 9, 'Pharmacy I'),
('1100 Tenth St', 10, 'Pharmacy J');

INSERT INTO Transactions (Date, ID, PharmacyID, PatientUserID) VALUES
('2023-01-01', 1, 1, 1),
('2023-01-02', 2, 2, 2),
('2023-01-03', 3, 3, 3),
('2023-01-04', 4, 4, 4),
('2023-01-05', 5, 5, 5),
('2023-01-06', 6, 6, 6),
('2023-01-07', 7, 7, 7),
('2023-01-08', 8, 8, 8),
('2023-01-09', 9, 9, 9),
('2023-01-10', 10, 10, 10);

INSERT INTO PatientsMeetDoctors (Date, PatientID, DoctorID) VALUES
('2023-01-01', 1, 1),
('2023-01-02', 2, 2),
('2023-01-03', 3, 3),
('2023-01-04', 4, 4),
('2023-01-05', 5, 5),
('2023-01-06', 6, 6),
('2023-01-07', 7, 7),
('2023-01-08', 8, 8),
('2023-01-09', 9, 9),
('2023-01-10', 10, 10);

INSERT INTO PrescriptionMedicines (PrescriptionDate, DoctorUserID, PatientUserID, MedicineID) VALUES
('2023-01-01', 1, 1, 1),
('2023-01-02', 2, 2, 2),
('2023-01-03', 3, 3, 3),
('2023-01-04', 4, 4, 4),
('2023-01-05', 5, 5, 5),
('2023-01-06', 6, 6, 6),
('2023-01-07', 7, 7, 7),
('2023-01-08', 8, 8, 8),
('2023-01-09', 9, 9, 9),
('2023-01-10', 10, 10, 10);

INSERT INTO TransactionMedicines (TID, PharmacyID, PatientUserID, MedicineID, NoOfMedicine) VALUES
(1, 1, 1, 1, 2),
(1, 1, 1, 2, 1),
(2, 2, 2, 2, 3),
(2, 2, 2, 3, 2),
(3, 3, 3, 3, 4),
(3, 3, 3, 1, 1),
(4, 4, 4, 4, 2),
(4, 4, 4, 2, 3),
(5, 5, 5, 5, 1),
(5, 5, 5, 1, 2);

INSERT INTO DoctorHospital (DoctorUserID, HospitalID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

INSERT INTO PatientHospital (PatientUserID, HospitalID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

INSERT INTO PatientHospital (PatientUserID, HospitalID, StartDate) VALUES
(1, 10001, '2023-01-01'),
(2, 10001, '2023-01-02'),
(3, 10002, '2023-01-03'),
(4, 10002, '2023-01-04'),
(5, 10003, '2023-01-05'),
(6, 10003, '2023-01-06'),
(7, 10004, '2023-01-07'),
(8, 10004, '2023-01-08'),
(9, 10005, '2023-01-09'),
(10, 10005, '2023-01-10');

INSERT INTO DoctorHospital (DoctorUserID, HospitalID, StartDate) VALUES
(1, 10001, '2023-01-01'),
(2, 10001, '2023-01-02'),
(3, 10002, '2023-01-03'),
(4, 10002, '2023-01-04'),
(5, 10003, '2023-01-05'),
(6, 10003, '2023-01-06'),
(7, 10004, '2023-01-07'),
(8, 10004, '2023-01-08'),
(9, 10005, '2023-01-09'),
(10, 10005, '2023-01-10');


 INSERT INTO UsersPhoneNumbers(UserID, PhoneNumber) VALUES
(1, 20550101),
(2, 2020102),
(3, 20550103),
(4, 2020104),
(5, 2025105),
(6, 2050106),
(7, 2020107),
(8, 200108),
(9, 20109),
(10, 2020);
CREATE TABLE PharmacyMedicines (
    Pharmacy int,
    Medicine int,
    NoOfMedicine int,
	Constraint PK Primary key (Pharmacy,Medicine)
);

INSERT INTO PharmacyMedicines(Pharmacy, Medicine, NoOfMedicine)
VALUES
    (5, 1, 2),
    (1, 2, 20),
    (2, 8, 9),
    (3, 3, 20),
    (4, 4, 22),
    (5, 7, 17),
    (6, 10, 20),
    (9, 6, 2),
    (8, 9, 2),
    (7, 6, 10),
    (2, 1, 2);