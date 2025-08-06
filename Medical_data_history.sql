USE project_medical_data_history;

SHOW TABLES;
select * from admissions ;
select * from doctors ;
select * from patients ;
select * from province_names ;

-- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name, last_name, gender from patients
where gender = 'M';

-- 2. Show first name and last name of patients who does not have allergies.
select first_name, last_name from patients
where allergies is null;

-- 3. Show fiselect * from patients ;rst name of patients that start with the letter 'C'
select first_name from patients
where first_name like 'C%';

-- 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name from patients
where weight  between 100 AND 200 ;

-- 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
update patients
set allergies ='NKA'
where allergies is null; 

-- 6. Show first name and last name concatenated into one column to show their full name.
select first_name, last_name , concat(first_name, ' ' ,last_name) as full_name
from patients;

-- 7. Show first name, last name, and the full province name of each patient.
update patients
set allergies ='NKA'
where allergies is null; 
INSERT INTO patients (patient_id, allergies)
SELECT patient_id, 'NKA'
FROM patients
WHERE allergies IS NULL
ON DUPLICATE KEY UPDATE allergies = 'NKA';

-- In this question we tried two different approach to solve the QUERY but the use of UPDATE and INSERT command is 
-- denied by the administration.
-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select count(*)as birth_date
from patients
where year(birth_date)='2010';

-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height
from patients
order by height desc
limit 1;

-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients
where patient_id in (1,45,534,879,1000);


-- 11. Show the total number of admissions
select count(*) as total_admissions
from admissions;

-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions;

select * from admissions
where admission_date = discharge_date;

-- 13. Show the total number of admissions for patient_id 579.
select  count(*) as total_number
from admissions
where patient_id = 579;

-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select * from patients;

select DISTINCT city from patients
where province_id = 'NS';

-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date
from patients
where height > 160 and weight > 70;

-- 16. Show unique birth years from patients and order them by ascending.
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;

-- 17. Show unique first names from the patients table which only occurs once in the list.
-- For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list.
-- If only 1 person is named 'Leo' then include them in the output. Tip: HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

select first_name from patients
group by first_name
HAVING COUNT(*) = 1;

-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id , first_name
from patients
where first_name like 's%s'
and length(first_name) >=6;

-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.   Primary diagnosis is stored in the admissions table.
-- select * from admissions;
select p.patient_id, p.first_name, p.last_name
from patients p
join admissions a on p.patient_id = a.patient_id
where a.diagnosis ='Dementia';

-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.
SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name;

-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
select
sum(gender = 'M') as male_patient,
sum(gender = 'F') as female_patient
from patients;

-- 22. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
SELECT
  SUM(gender = 'M') AS male_patients,
  SUM(gender = 'F') AS female_patients
FROM patients;

-- 23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
-- select * from admissions;
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

-- 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;

-- 25. Show first name, last name and role of every person that is either patient or doctor.    The roles are either "Patient" or "Doctor"
-- select * from doctors;
SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;


-- 26. Show all allergies ordered by popularity. Remove NULL values from query.
-- select * from patients;
SELECT allergies, COUNT(*) AS count
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY count DESC;

-- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;

 
-- 28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
-- Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    EX: SMITH,jane
SELECT 
    CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM  patients
ORDER BY LOWER(first_name) DESC;
    
    
-- 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
SELECT 
    province_id, 
    SUM(height) AS total_height
FROM 
    patients
GROUP BY 
    province_id
HAVING 
    SUM(height) >= 7000;

-- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT 
    MAX(weight) - MIN(weight) AS weight_difference
FROM 
    patients
WHERE 
    last_name = 'Maroni';
    
-- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions
SELECT 
    EXTRACT(DAY FROM admission_date) AS day_of_month,
    COUNT(*) AS total_admissions
FROM    admissions
 GROUP BY 
    EXTRACT(DAY FROM admission_date)
ORDER BY 
    total_admissions DESC;

-- 32. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group decending. 
-- e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
SELECT 
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS total_patients
FROM  patients
WHERE  weight IS NOT NULL
GROUP BY  weight_group
ORDER BY weight_group DESC;
    

-- 33. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m). 
-- Weight is in units kg. Height is in units cm.
SELECT patient_id, weight, height,
    (weight / ((height / 100) * (height / 100)) >= 30) AS isObese
FROM patients
WHERE weight IS NOT NULL AND height IS NOT NULL;

-- 34. Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. 
-- Check patients, admissions, and doctors tables for required information.
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
FROM patients p
JOIN 
    admissions a ON p.patient_id = a.patient_id
JOIN 
    doctors d ON a.attending_doctor_id = d.doctor_id
WHERE 
    a.diagnosis = 'Epilepsy'
    AND d.first_name = 'Lisa';

/* 35. All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

   The password must be the following, in order:
    - patient_id
    - the numerical length of patient's last_name
    - year of patient's birth_date */
SELECT 
    p.patient_id,
    CONCAT(
        p.patient_id,
        LENGTH(p.last_name),
        YEAR(p.birth_date)
    ) AS temp_password
FROM 
    patients p
JOIN 
    admissions a ON p.patient_id = a.patient_id
GROUP BY 
    p.patient_id, p.last_name, p.birth_date;
