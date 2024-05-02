
--Task 1
create database CareerHub
use CareerHub 

--Task 2
Create Table Companies (
 company_id Int Primary Key ,
 Company_Name Varchar(250),
 Location Varchar (250));



CREATE TABLE Jobs (Job_id INT PRIMARY KEY,Company_id INT, Job_Title VARCHAR(200),
 Job_Description text,Job_Location VARCHAR(250),
 Salary DECIMAL(10, 2), Job_Type VARCHAR(250), Posted_Date DATETIME)



Create table Applicants(
Applicant_id INT PRIMARY KEY,
First_Name Varchar (250),
Last_Name Varchar(250),
Email Varchar(250),
Phone Varchar (200),
Resume Text );


create table applications(
application_id int primary key,
job_id int,
applicant_id int,
application_date date,
cover_letter text
);

--Task3
ALTER TABLE Jobs
ADD CONSTRAINT FK_Company_id
FOREIGN KEY (Company_id)
REFERENCES Companies(company_id)

ALTER TABLE applications
ADD CONSTRAINT FK_job_id
FOREIGN KEY (job_id)
REFERENCES jobs(job_id)


ALTER TABLE Applications
ADD CONSTRAINT FK_Applicant_id
FOREIGN KEY (applicant_id)
REFERENCES Applicants(Applicant_id);

INSERT INTO Companies (company_id, Company_Name,Location) VALUES
(1,'Tech Innovations', 'San Francisco'),
(2,'Data Driven Inc', 'New York'),
(3,'GreenTech Solutions', 'Austin'),
(4,'CodeCrafters', 'Boston'),
(5,'HexaWare Technologies', 'Chennai');


INSERT INTO Jobs (job_id,Company_id, Job_Title, Job_Description, Job_Location, Salary, Job_Type, Posted_Date) VALUES
(1,1, 'Frontend Developer', 'Develop user-facing features', 'San Francisco', 75000, 'Full-time', '2023-01-10'),
(2,2, 'Data Analyst', 'Interpret data models', 'New York', 68000, 'Full-time', '2023-02-20'),
(3,3, 'Environmental Engineer', 'Develop environmental solutions', 'Austin', 85000, 'Full-time', '2023-03-15'),
(4,1, 'Backend Developer', 'Handle server-side logic', 'Remote', 77000, 'Full-time', '2023-04-05'),
(5,4, 'Software Engineer', 'Develop and test software systems', 'Boston', 90000, 'Full-time', '2023-01-18'),
(6,5, 'HR Coordinator', 'Manage hiring processes', 'Chennai', 45000, 'Contract', '2023-04-25'),
(7,2, 'Senior Data Analyst', 'Lead data strategies', 'New York', 95000, 'Full-time', '2023-01-22');


INSERT INTO Applicants (Applicant_id, First_Name,Last_Name, Email, Phone, Resume) VALUES
(1,'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Experienced web developer with 5 years of experience.'),
(2,'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'Data enthusiast with 3 years of experience in data analysis.'),
(3,'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', 'Environmental engineer with 4 years of field experience.'),
(4,'Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', 'Seasoned software engineer with 8 years of experience.');


INSERT INTO Applications (application_id,job_id, applicant_id, application_date, cover_letter) VALUES
(1,1, 1, '2023-04-01', 'I am excited to apply for the Frontend Developer position.'),
(2,2, 2, '2023-04-02', 'I am interested in the Data Analyst position.'),
(3,3, 3, '2023-04-03', 'I am eager to bring my expertise to your team as an Environmental Engineer.'),
(4,4, 4, '2023-04-04', 'I am applying for the Backend Developer role to leverage my skills.'),
(5,5, 1, '2023-04-05', 'I am also interested in the Software Engineer position at CodeCrafters.');

--Task 4 no errors 

--Task 5

SELECT j.Job_id, COUNT(A.application_id) AS Application_Count
FROM Jobs j
LEFT JOIN Applications a ON j.Job_id = a.job_id
GROUP BY j.Job_id;



--Task6

SELECT J.Job_Title, C.Company_Name, J.Job_Location, J.Salary
FROM Jobs J
JOIN Companies C ON J.Company_id = C.company_id
WHERE J.Salary BETWEEN 80000 AND 95000;

--Task 7
SELECT j.Job_Title, c.Company_Name, a.application_date
FROM Applications a
INNER JOIN Jobs j ON a.job_id =j.Job_id
INNER JOIN Companies c ON j.Company_id = c.company_id
WHERE a.applicant_id = 3;


--Task 8
select company_id ,avg(salary) as average_salary from Jobs
where salary>0
group by Company_id

--Task 9
SELECT Companies.Company_Name, COUNT(*) AS Job_Count
FROM Companies
JOIN Jobs ON Companies.company_id = Jobs.Company_id
GROUP BY Companies.Company_Name
ORDER BY Job_Count DESC

--Task10
select a.applicant_id
FROM Applicants a
INNER JOIN applications j ON a.Applicant_id =j.applicant_id
INNER JOIN Jobs c ON j.job_id = c.Job_id
where c.Job_Location='new york'
--AND DATEDIFF(YEAR, A.Resume, GETDATE()) >= 2; DATE QUERY IS NOT RUNNING


--Task 11
SELECT DISTINCT Job_Title, Salary
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;


 --Task 12
 SELECT Job_Title
FROM Jobs
left JOIN Applications ON Jobs.Job_id = Applications.job_id
WHERE Applications.application_id IS NULL;

--Task 13
SELECT Applicants.First_Name, Applicants.Last_Name, Companies.Company_Name, Jobs.Job_Title
FROM Applications 
JOIN Applicants ON Applications.applicant_id = Applicants.Applicant_id
JOIN Jobs ON Applications.job_id = Jobs.Job_id
JOIN Companies ON Jobs.Company_id = Companies.company_id;


--Task 14
SELECT Companies.Company_Name, COUNT(Jobs.Job_id) AS Job_Count
FROM Companies
LEFT JOIN Jobs ON Companies.company_id = Jobs.Company_id
GROUP BY Companies.Company_Name;

--Task 15

SELECT A.First_Name, A.Last_Name, ISNULL(C.Company_Name, 'Not Applied') AS 'Company Name', ISNULL(J.Job_Title, 'Not Applied') AS 'Job Title'
FROM Applicants A
LEFT JOIN Applications Ap ON A.Applicant_ID = Ap.applicant_id
LEFT JOIN Jobs J ON Ap.job_id = J.Job_id
LEFT JOIN Companies C ON J.Company_id = C.company_id;

--Task 16

Select Distinct C.Company_Name,j.Salary
From Companies c
Inner Join Jobs j ON c.company_id = J.Company_id
Where J.Salary > (SELECT AVG(Salary) FROM Jobs);

--Task 17
alter table applicants
add city varchar(255) default 'indore',state varchar(255) default 'MP' 

SELECT First_Name, Last_Name, CONCAT(City, ', ', State) AS Location
FROM Applicants;

--Task 18
Select * from Jobs
Where Job_Title LIKE '%Developer%' OR Job_Title LIKE '%Engineer%'

--Task 19
Select Applicants.First_Name, Applicants.Last_Name, Companies.Company_Name, Jobs.Job_Title
From Applicants
CROSS JOIN Companies
CROSS JOIN Jobs
LEFT JOIN Applications ON Applicants.Applicant_id = Applications.applicant_id AND Jobs.Job_id = Applications.job_id;


--Task 20

SELECT Applicants.First_Name, Applicants.Last_Name, Companies.Company_Name
FROM Applicants
CROSS JOIN Companies
WHERE Companies.Location = 'Chennai'
--DATE QUERY IS NOT RUNNING

