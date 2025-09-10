CREATE TRIGGER trg_BeforeInsertDoctor
ON Doctors
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Doctors d JOIN INSERTED i ON d.MedicalCouncilCode = i.MedicalCouncilCode)
    BEGIN
        RAISERROR('Medical council code must be unique.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
	select *
		from Doctors

    INSERT INTO Doctors (MedicalCouncilCode, MedicalSpeciality, UserId)
    SELECT MedicalCouncilCode, MedicalSpeciality, userid
    FROM INSERTED;
END;
-----------------
CREATE TRIGGER trg_BeforeUpdatePatient
ON Patients
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted where inserted.hasinsurance NOT IN (0, 1))
    BEGIN
        RAISERROR('hascode_insurance must be either 0 (false) or 1 (true).', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    UPDATE Patients
    SET HasInsurance = i.HasInsurance,
        codeinsurance = i.codeinsurance,
        userid = i.userid
    FROM INSERTED i
    WHERE Patients.UserID = i.UserID;
END;
-------------
CREATE TRIGGER trg_AfterInsertPrescriptionOnMedicine
ON PrescriptionMedicines
AFTER INSERT
AS
BEGIN
    DECLARE @DoctorID INT, @PatientID INT, @MedicineID INT, @PrescriptionDate DATETIME;

    SELECT @DoctorID = i.DoctorUserID, @PatientID = i.PatientUserID, @MedicineID = i.MedicineID, @PrescriptionDate = i.PrescriptionDate
    FROM INSERTED i;

    PRINT 'New prescription added - DoctorID: ' + CAST(@DoctorID AS NVARCHAR) +
          ', PatientID: ' + CAST(@PatientID AS NVARCHAR) +
          ', MedicineID: ' + CAST(@MedicineID AS NVARCHAR) +
          ', PrescriptionDate: ' + CAST(@PrescriptionDate AS NVARCHAR);
END;
-------
CREATE TRIGGER trg_AfterUpdateTransaction
ON TransactionMedicines
AFTER UPDATE
AS
BEGIN
    DECLARE @PharmacyID INT, @MedicineID INT, @NoOfMedicine INT;

    SELECT @PharmacyID = i.PharmacyID, @MedicineID = i.MedicineID, @NoOfMedicine = i.NoOfMedicine
    FROM INSERTED as i;

    -- Update stock logic here, assuming a table `PharmacyStock` exists
    UPDATE PharmacyMedicines
    SET NoOfMedicine = NoOfMedicine - @NoOfMedicine
    WHERE PharmacyMedicines.Medicine = @PharmacyID AND PharmacyMedicines.Medicine = @MedicineID;
END;