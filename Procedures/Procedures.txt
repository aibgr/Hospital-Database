--Procedure 1(GetDoctorDetails)
Create Procedure  GetDoctorDetails
	@drID INT
	as
	begin 
		IF NOT Exists (select 1 from Doctors D where D.UserID = @drID)
		begin
			Print 'Doctor not found'
			return
		end

		Select D.UserID, U.FirstName, U.LastName, D.MedicalSpeciality
			From Doctors D join Users U on U.UserID = D.UserID	
			where D.UserID = @drID
	end;
Exec GetDoctorDetails @drID = 1;
------------------------------------------------------------------------------------------------------------------------
--Procedure 2(InsertNewPatient)
Create Procedure InsertNewPatient
	@fn varchar(255),
	@ln varchar (255),
	@uid int,
	@add varchar(255),
	@InsuranceCode int
	as 
	begin 
		If EXISTS(select 1 from Patients p where p.UserID = @uid)
		begin 
			print 'we already have this id'
			return;
		end 
		
		insert into Users (users.UserID, Users.FirstName, Users.LastName, Users.Address)
			values(@uid,@fn,@ln,@add)

		Declare @HasInsurance int
		If @InsuranceCode is null 
		begin 
			set @HasInsurance = 0
		end 
		else 
		begin
			set @HasInsurance = 1
		end
		insert into Patients(Patients.CodeInsurance,Patients.HasInsurance,Patients.UserID)
			values(@InsuranceCode,@HasInsurance ,@uid)

	end;
Exec InsertNewPatient @fn = 'amirali', @ln = 'sotoudeh', @uid = 10010, @add ='Hengam, elmosanat', @InsuranceCode = NUll
select Distinct *
	from Patients p join Users u on u.UserID = p.UserID
------------------------------------------------------------------------------------------------------------------------
--Procedure 3(GetDoctorsBySpeciality)
Create Procedure  GetDoctorsBySpeciality
    @Speciality NVARCHAR(255)
AS
BEGIN
    SELECT 
        d.userid AS DoctorUserID,
        u.firstname AS DoctorFirstName,
        u.lastname AS DoctorLastName,
        d.MedicalSpeciality AS MedicalSpeciality
    FROM 
        Doctors d JOIN 
        Users u ON d.UserID = u.userid
    WHERE 
        d.MedicalSpeciality = @Speciality
	return;
END;
Exec GetDoctorsBySpeciality @speciality = 'Neurology';
------------------------------------------------------------------------------------------------------------------------
--Procedure 4(Get Pharmacy Transactions for a Patient)
CREATE PROCEDURE GetPatientPharmacyTransactions
    @PatientID INT
AS
BEGIN
    SELECT 
        TM.PatientUserID AS PatientID,
        p.Name AS PharmacyName,
        M.Type AS MedicineType,
        TM.NoOfMedicine AS NumberOfMedicine,
        TM.date AS TransactionDate
    FROM 
        TransactionMedicines TM
    JOIN 
        Pharmacies p ON TM.PharmacyID = p.ID
    JOIN 
        Medicines m ON TM.MedicineID = m.MedicineID
    WHERE 
        TM.PatientUserID = @PatientID;
END;
Exec GetPatientPharmacyTransactions @patientID = 1
select *
	from Patients
	
