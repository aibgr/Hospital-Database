use proj;
select *
	from Doctors
	where Doctors.UserID % 2 = 0;
select *
	from UsersPhoneNumbers
select Users.UserID, UsersPhoneNumbers.PhoneNumber
	from Users Inner Join UsersPhoneNumbers on Users.UserID = UsersPhoneNumbers.UserID
	where Users.UserID % 2 = 0;
select *
	from Transactions
	where Transactions.Date like '2023%[0-1-2-3]'
select Patients.UserID
	from Patients
	where  Patients.UserID IN (select Prescriptions.PatientUserID
									from Prescriptions
									where Prescriptions.PatientUserID = Prescriptions.DoctorUserID)
select Min(Hospitals.PostalCode) as min
	from Hospitals
	where Hospitals.Address like '%'
	group by Hospitals.Address;
select count(*)
	from Users
	where USERs.FirstName != 'amir'
Insert Hospitals (address,name,postalcode)
	values('shariati, doolat', 'nikan', 123444)
select *
	from Hospitals
delete Hospitals
	where Hospitals.Name = 'nikan';
select *
	from Hospitals
Insert Hospitals (address,name,postalcode)
	values('shariati, doolat', 'nikan', 123444)
Update Hospitals
	set Address = 'amirabad'
	where Hospitals.Name = 'nikan'
select *
	from Hospitals



	
	
