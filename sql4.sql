-- 1. List all patients and their appointments, including patients who have never had an appointment.
SELECT * FROM PATIENTS P
LEFT JOIN APPOINTMENTS A
ON P.PATIENTID= A.PATIENTID;

-- 2. Display all doctors and their scheduled appointments, including doctors without any appointments.
SELECT * FROM DOCTORS D
LEFT JOIN APPOINTMENTS A
ON D.DOCTORID=A.DOCTORID

-- 3. Show all medications and the patients they've been prescribed to, including medications that haven't been prescribed.
SELECT * FROM MEDICATIONS M
LEFT JOIN PRESCRIPTIONS P
ON M.MEDICATIONID=P.MEDICATIONID

-- 4. List all possible patient-doctor combinations, regardless of whether an appointment has occurred.
SELECT P.PatientID, P.PatientName, D.DoctorID, D.DoctorName
FROM Patients P
CROSS JOIN Doctors D;

-- 5. Display all prescriptions with patient and medication information, including prescriptions where either the patient or medication information is missing.
SELECT *
FROM Prescriptions R
LEFT JOIN Patients P ON R.PatientID = P.PatientID
LEFT JOIN Medications M ON R.MedicationID = M.MedicationID;

-- 6. Show all patients who have never been prescribed any medication, along with their appointment history.
SELECT *
FROM PATIENTS P
LEFT JOIN PRESCRIPTIONS R ON P.PATIENTID= R.PATIENTID
LEFT JOIN APPOINTMENTS A ON P.PATIENTID=A.PATIENTID
WHERE R.PATIENTID= NULL

-- 7. List all doctors who have appointments in the next week, along with the patients they're scheduled to see.

SELECT D.DoctorID, D.DoctorName, P.PatientID, P.PatientName, A.AppointmentDate
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
JOIN Patients P ON A.PatientID = P.PatientID
WHERE A.AppointmentDate BETWEEN GETDATE() AND DATEADD(DAY,7,GETDATE());

-- 8. Display all medications prescribed to patients over 60 years old, including medications not prescribed to this age group.
SELECT M.MedicationID, M.MedicationName, M.DosageForm, P.PatientID, P.PatientName, P.DateOfBirth
FROM Medications M
LEFT JOIN Prescriptions R ON M.MedicationID = R.MedicationID
LEFT JOIN Patients P ON R.PatientID = P.PatientID AND DATEDIFF(YEAR, P.DateOfBirth, GETDATE()) > 60
ORDER BY M.MedicationID;

-- 9. Show all appointments from last year and any associated prescription information.
SELECT A.APPOINTMENTID,P.PATIENTID,A.APPOINTMENTDATE FROM APPOINTMENTS A
LEFT JOIN PRESCRIPTIONS P ON A.PATIENTID=P.PATIENTID
WHERE YEAR(GETDATE())-1=YEAR(APPOINTMENTDATE)

-- 10. List all possible specialty-medication combinations, regardless of whether a doctor of that specialty has prescribed that medication.
SELECT D.SPECIALTY, M.MEDICATIONNAME
FROM DOCTORS D
CROSS JOIN MEDICATIONS M;


