DECLARE @DoctorId INT;
DECLARE @DoctorFirstName NVARCHAR(50);
DECLARE @DoctorLastName NVARCHAR(50);

-- Declare the cursor
DECLARE doctor_cursor CURSOR FOR
SELECT d.UserID, u.firstname, u.lastname
FROM Doctors d
JOIN [Users] u ON d.userid = u.userid;

-- Open the cursor
OPEN doctor_cursor;

-- Fetch the first row
FETCH NEXT FROM doctor_cursor INTO @DoctorId, @DoctorFirstName, @DoctorLastName;

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Doctor: ' + @DoctorFirstName + ' ' + @DoctorLastName + ' (ID: ' + CAST(@DoctorId AS NVARCHAR) + ')';

    -- Retrieve patients who have met with the current doctor
    SELECT u.firstname AS PatientFirstName, u.lastname AS PatientLastName, p.codeinsurance
    FROM PatientsMeetDoctors pmd
    JOIN Patients p ON pmd.patientID = p.UserID
    JOIN [Users] u ON p.userid = u.userid
    WHERE pmd.DoctorID = @DoctorId;

    -- Fetch the next row
    FETCH NEXT FROM doctor_cursor INTO @DoctorId, @DoctorFirstName, @DoctorLastName;
END;

-- Close and deallocate the cursor
CLOSE doctor_cursor;
DEALLOCATE doctor_cursor;