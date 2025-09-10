--Function 1(Function to Calculate the Duration of a Doctor's Tenure at a Hospital)
Create FUNCTION GetDoctorTenure (
    @DoctorID INT,
    @HospitalID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Tenure INT;
    
    SELECT @Tenure = DATEDIFF(DAY, StartDate, ISNULL(EndDate, GETDATE()))
    FROM DoctorHospital DH
    WHERE DH.DoctorUserID = @DoctorID AND DH.HospitalID = @HospitalID;

    RETURN @Tenure;
END;

SELECT dbo.GetDoctorTenure(1, 10001) AS DoctorTenure;
------------------------------------------------------------------------------------------------------------------------
--Function 2(GetTotalMedicinesPrescribedByDoctor )
CREATE FUNCTION GetTotalMedicinesPrescribedByDoctor (
    @DoctorID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TotalMedicines INT;
    
    SELECT @TotalMedicines = COUNT(*)
    FROM PrescriptionMedicines PM
    WHERE PM.DoctorUserID = @DoctorID;

    RETURN @TotalMedicines;
END;

SELECT dbo.GetTotalMedicinesPrescribedByDoctor(3) AS TotalMedicines;
------------------------------------------------------------------------------------------------------------------------
--Function 3(IsMedicineCoveredByInsurance)
CREATE FUNCTION IsMedicineCoveredByInsurance (
    @MedicineID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @HasInsurance BIT;
    
    SELECT @HasInsurance = CASE WHEN HasInsurance = 1 THEN 1 ELSE 0 END
    FROM Medicines M
    WHERE M.MedicineID = @MedicineID;

    RETURN @HasInsurance;
END;
SELECT dbo.IsMedicineCoveredByInsurance(4) AS IsCovered;
------------------------------------------------------------------------------------------------------------------------
--Function 4(GetPatientFullName)
CREATE FUNCTION GetPatientFullName (
    @PatientID INT
)
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @FullName NVARCHAR(200);
    
    SELECT @FullName = CONCAT(FirstName, ' ', LastName)
    FROM [Users] u
    JOIN Patients p ON u.UserID = p.UserID
    WHERE p.UserID = @PatientID;

    RETURN @FullName;
END;

SELECT dbo.GetPatientFullName(5) AS PatientFullName;