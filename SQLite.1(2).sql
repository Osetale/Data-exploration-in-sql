/*SELECT *
FROM Donation_Data;

--TOTAL NUMER OF DONOR
SELECT COUNT(first_name)
FROM Donation_Data;

--SUM TOTAL OF DONATION */

SELECT SUM(donation)
FROM Donation_Data

--MINIMUM DONATION
SELECT MIN(donation)
FROM Donation_Data

--TOP 15 DONOR
SELECT Donation_Data.gender,Donation_Data.donation,Donation_Data.state,Donor_Data2.donation_frequency,Donor_Data2.car,Donor_Data2.university
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Weekly'
AND Donation BETWEEN 380 AND 500
ORDER BY donation DESC
LIMIT 15

--15 LEAST DONOR
SELECT Donation_Data.gender,Donation_Data.donation,Donation_Data.state,Donor_Data2.donation_frequency,Donor_Data2.car,Donor_Data2.university
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Weekly'
AND Donation BETWEEN 5 AND 50
ORDER BY donation DESC
LIMIT 15

--DONATIONS PRE MONTHLY,WEEKLY AND ONCE
SELECT Donation_Data.donation,Donor_Data2.donation_frequency 
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Monthly'


--PER WEEKLY
SELECT Donation_Data.donation,Donor_Data2.donation_frequency 
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Weekly'


--PER ONCE
SELECT Donation_Data.donation,Donor_Data2.donation_frequency 
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Once'

--per yearly
SELECT Donation_Data.donation,Donor_Data2.donation_frequency 
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE donation_frequency = 'Yearly'


--state with 50 and above
SELECT state, COUNT(*)
FROM Donation_Data
GROUP BY state
HAVING COUNT(*) > 50

--USING LEFT JOIN FOR MALE AND FEMALE WITH UNIERSITY EDUCATION THAT DONATED $400 AND ABOVE
SELECT *
FROM Donation_Data
LEFT JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE gender = 'Female'
AND university != 'NULL'
AND donation > 400
ORDER BY donation DESC


SELECT *
FROM Donation_Data
LEFT JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE gender = 'Male'
AND university != 'NULL'
AND donation > 400
ORDER BY donation DESC

--FEMALE DONATION ABOVE 400
SELECT Donation_Data.gender,Donation_Data.donation,Donor_Data2.university
FROM Donation_Data
LEFT JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE gender = 'Female'
AND university ISNULL 
AND donation > 400
ORDER BY donation DESC

--MALE DONATION ABOVE 400
SELECT Donation_Data.gender,Donation_Data.donation,Donor_Data2.university
FROM Donation_Data
LEFT JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
WHERE gender = 'Male'
AND university ISNULL 
AND donation > 400
ORDER BY donation DESC