use [Proj];
--------------------------------------------------------------------------------------------------------------------
--1)Find All Doctors Working in a Specific Hospital
	Select D.UserID as 'Dr.ID', U.FirstName, U.LastName, U.FirstName + ' '  + U.LastName as 'FullName'
		From Users U join (Hospitals H join (Doctors D Join DoctorHospital DH on D.UserID = DH.DoctorUserID) 
							on DH.HospitalID = H.PostalCode)
			on U.UserID = D.UserID
		Where H.Name = 'City Hospital'
		Order by D.UserID Desc;
--------------------------------------------------------------------------------------------------------------------
--2)List All Hospitals with Their Addresses and Phone Numbers
	Select H.Name, H.Address, HP.PhoneNumber
		From Hospitals H join HospitalsPhoneNumbers HP on H.PostalCode = HP.PostalCode
--------------------------------------------------------------------------------------------------------------------
--3)Get Details of a Patient by User ID
	Select *
		From Doctors as P join Users as U on u.UserID = P.UserID
--------------------------------------------------------------------------------------------------------------------
--4)Find the Total Number of Medicines Covered by Insurance
	SELECT COUNT(*) AS TotalInsuredMedicines
		FROM Medicines
		WHERE hasinsurance = 1;
--------------------------------------------------------------------------------------------------------------------
--5)List All Medicines Covered by Insurance
	Select MedicineID, Medicines.Type
		From Medicines
		Where Medicines.HasInsurance = 1;
--------------------------------------------------------------------------------------------------------------------
--6)Find Doctors Who Have Treated Patients with a Specific Insurance (Start with 1) Code
	Select D.UserID,U.FirstName
		From Doctors as D Join Users as U on D.UserID = U.UserID
		Where  D.UserID In (Select PMD.DoctorID
								From  Patients as P join PatientsMeetDoctors as PMD on P.UserID = PMD.PatientID
								Where  P.CodeInsurance Like '1%')
		Order by D.UserID Asc
--------------------------------------------------------------------------------------------------------------------
--7)Get Doctors Who Have Treated Patients at a Specific Hospital
	SELECT D.UserID, U.FirstName, U.LastName
		FROM Doctors D JOIN Users U ON D.UserID = U.UserID
		WHERE D.UserID IN (SELECT PMD.DoctorID
								FROM PatientsMeetDoctors as PMD
								WHERE PMD.patientID IN (SELECT PH.PatientUserID
														FROM PatientHospital PH
														WHERE PH.HospitalID = 10003))
		Order by D.UserID Desc
--------------------------------------------------------------------------------------------------------------------
--8)Count the Number of Doctors in Each Hospital
	Select H.Name , H.Address, COUNT(*) as NumbersOfDoctors
		From DoctorHospital as DH Join Hospitals as H on DH.HospitalID = H.PostalCode
		Group by H.Name, H.Address;
--------------------------------------------------------------------------------------------------------------------
--9)Find the Average Number of Medicines IDs Prescribed by Each Doctor Such that AVG is Greater than 3
with TMP as(
	Select U.FirstName, U.LastName, D.MedicalSpeciality, AVG(PM.MedicineID) as AvgOfMedicineID
		From Users as U join 
			(Doctors as D Join PrescriptionMedicines as PM on PM.DoctorUserID = D.UserID)
			on U.UserID = D.UserID
		Group BY U.FirstName, U.LastName, D.MedicalSpeciality
		Having AVG(PM.MedicineID) > 3
) select *
		from TMP;
--------------------------------------------------------------------------------------------------------------------
--10)Find the Hospital with the Most Patients and List All Doctors Working There
WITH HospitalPatientCounts AS (
    SELECT PH.hospitalid, H.Name, COUNT(*) AS TotalPatients
    FROM PatientHospital PH
    JOIN Hospitals H ON PH.hospitalid = H.PostalCode
    GROUP BY PH.hospitalid, H.Name
),
TopHospital AS (
    SELECT TOP 1 hospitalid, Name
    FROM HospitalPatientCounts
    ORDER BY TotalPatients DESC
)

-- Step 2: List All Doctors Working at the Top Hospital
SELECT TH.Name AS HospitalName, U.firstname, U.lastname, D.medicalspeciality
	FROM TopHospital TH
	JOIN DoctorHospital DH ON TH.hospitalid = DH.HospitalId
	JOIN Doctors D ON DH.DoctorUserID = D.UserID
	JOIN Users U ON D.userid = U.userid;
--------------------------------------------------------------------------------------------------------------------
--11)


