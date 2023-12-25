/* Project Overview
Case Study
Building an Employee Attrition Management System database
Objectives
The Employee Attrition Management System project aims
to create a comprehensive and effective platform for human resources by capturing 
and storing detailed employee information, 
recording attrition events, and analyzing performance metrics.
 
The system will facilitate trend analysis through historical data storage 
and incorporate predictive analytics to forecast potential attrition.
The HR Attrition data is currently saved on my local computer. 
I got the dataset to practice with from kaggle. You can download the dataset here. 
The dataset contains 38 columns and 1,481 rows of data.


*/
--------------------------------------------------------------------------------------------------
# Database Creation

# To drop the database if it exist
DROP DATABASE IF EXISTS  Hr_Attritions;

# To create a database
CREATE DATABASE Hr_Attritions
DEFAULT CHARACTER SET utf8mb4;

# To use the database that was created
USE Hr_Attritions;
-------------------------------------------------------------------------------------------------
# Table Creation

#To drop the table if it exist
DROP TABLE IF EXISTS  Employees;

# To create the table Employees
CREATE TABLE Employees( 
EMPID VARCHAR(10),
Age TINYINT,
AgeGroup ENUM('18-25', '26-35', '36-45', '46-55', '55+'),
Attrition ENUM('Yes', 'No'),
BusinessTravel ENUM('Non-Travel', 'Travel_Frequently', 'Travel_Rarely'),
DailyRate INT,
Department VARCHAR(30),
DistanceFromHome INT,
Education TINYINT,
EducationField VARCHAR(30),
EmployeeCount SMALLINT,
EmployeeNumber INT,
EnvironmentSatisfaction TINYINT,
Gender ENUM('Male', 'Female', 'Others'),
HourlyRate INT,
JobInvolvement TINYINT,
JobLevel TINYINT,
JobRole VARCHAR(40),
JobSatisfaction TINYINT,
MaritalStatus ENUM('Single', 'Married', 'Divorced'),
MonthlyIncome INT, 
SalarySlab ENUM('Upto 5k', '5k-10k', '10k-15k', '15k+'),
MonthlyRate INT,
NumCompaniesWorked TINYINT,
Over18 ENUM('Y', 'N'),
OverTime ENUM('Yes', 'No'),
PercentSalaryHike TINYINT,
PerformanceRating TINYINT,
RelationshipSatisfaction TINYINT,
StandardHours TINYINT,
StockOptionLevel TINYINT,
TotalWorkingYears TINYINT,
TrainingTimesLastYear TINYINT,
WorkLifeBalance TINYINT,
YearsAtCompany TINYINT,
YearsInCurrentRole TINYINT,
YearsSinceLastPromotion TINYINT,
YearsWithCurrManager TINYINT,
DepartmentID TINYINT,
RatingID INT,
SalaryID INT,
DemographicsID VARCHAR(10),
TravelID VARCHAR(6),
JobID INT,
EducationID INT,
WorkHistoryID INT
);

# To check if table was created and check it's schema
DESC Employees;
-------------------------------------------------------------------------------------------------

# To check for approved path to upload my data 
SELECT @@secure_file_priv;

------------------------------------------------------------------------------------------------
# TO IMPORT THE DATA INTO MY TABLE


# To load my data into my table called Employees. Note: I Imported The Data Via MYSQL Command Line
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\EDITED_HR_Analytics.csv'
INTO TABLE Employees
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'           
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS;

#To checked if my data was imported
SELECT * FROM EMPLOYEES;
        
----------------------------------------------------------------------------------------------------
# TO CREATE TABLES

# To create EmpInfo Table
CREATE TABLE `EmpInfo` (
    `EmpID` VARCHAR(10)  NOT NULL ,
    `Age` TINYINT  NOT NULL ,
    `Gender` ENUM('Male', 'Female', 'Others') ,
    `MaritalStatus` ENUM('Single', 'Married', 'Divorced') ,
    `Over18` ENUM('Y', 'N') ,
	`EmployeeCount` smallint,
	`EmployeeNumber` int,
    `SalaryID` INT  NOT NULL ,
    `TravelID` VARCHAR(5)  NOT NULL ,
    `JobID` INT  NOT NULL ,
    `DemographicsID` VARCHAR(10)  NOT NULL ,
    `WorkHistoryID` INT  NOT NULL ,
    `EducationID` INT NOT NULL,
    PRIMARY KEY (
        `EmpID`
    )
);

# To confirm if the table was created
SELECT * FROM EmpInfo;

# To create Department Table
CREATE TABLE `Department` (
    `DepartmentID` TINYINT  NOT NULL ,
    `Department` VARCHAR(30) ,
    PRIMARY KEY (
        `DepartmentID`
    )
);

# To confirm if the table was created
SELECT * FROM Department;

# To create jobinfo table
CREATE TABLE `JobInfo` (
    `JobID` INT  NOT NULL ,
    `DepartmentID` TINYINT  NOT NULL ,
    `JobRole` VARCHAR(40)   ,
    `JobLevel` TINYINT ,
    `JobInvolvement` TINYINT  ,
    `RatingID` INT  NOT NULL ,
    PRIMARY KEY (
        `JobID`
    )
);

# To confirm if the table was created
SELECT * FROM JobInfo;

# To create ratinginfo table
CREATE TABLE `RatingInfo` (
    `RatingID` INT  NOT NULL ,
    `JobSatisfaction` TINYINT ,
    `PerformanceRating` TINYINT ,
    `EnvironmentSatisfaction` TINYINT ,
    `RelationshipSatisfaction` TINYINT ,
    `WorkLifeBalance` TINYINT ,
    PRIMARY KEY (
        `RatingID`
    )
);

# To confirm if the table was created
SELECT * FROM RatingInfo;

# to create salaryinfo table
CREATE TABLE `SalaryInfo` (
    `SalaryID` INT  NOT NULL ,
    `DailyRate` INT  ,
    `HourlyRate` INT ,
    `MonthlyIncome` INT ,
    `MonthlyRate` INT ,
    `PercentSalaryHike` TINYINT ,
    `SalarySlab` ENUM('Upto 5k', '5k-10k', '10k-15k', '15k+') ,
    `StockOptionLevel` TINYINT ,
    PRIMARY KEY (
        `SalaryID`
    )
);

# To confirm if the table was created
SELECT * FROM SalaryInfo;

# To create table EmployeeEducation
CREATE TABLE  EmployeeEducation(
EducationID INT NOT NULL,
Education TINYINT,
EducationField VARCHAR(30),
PRIMARY KEY(EducationID)
);

# TO CONFIRM THE TABLE WAS CREATED
SELECT * FROM EMPLOYEEEDUCATION;

# To create WorkHistory Table
CREATE TABLE `WorkHistory` (
    `WorkHistoryID` INT  NOT NULL ,
    `Attrition` ENUM('Yes', 'No') ,
    `DistanceFromHome` INT,
    `NumCompaniesWorked` TINYINT,
    `TotalWorkingYears` TINYINT,
    `TrainingTimesLastYear` TINYINT ,
    `YearsAtCompany` TINYINT ,
    `YearsInCurrentRole` TINYINT ,
    `YearsSinceLastPromotion` TINYINT,
    `YearsWithCurrManager` TINYINT ,
    `OverTime` ENUM('Yes', 'No') ,
    PRIMARY KEY (
        `WorkHistoryID`
    )
);


# To confirm if the table was created
SELECT * FROM WorkHistory;

#To create Demographics Table
CREATE TABLE `Demographics` (
    `DemographicsID` VARCHAR(10)  NOT NULL ,
    `AgeGroup` ENUM('18-25', '26-35', '36-45', '46-55', '55+') ,
    PRIMARY KEY (
        `DemographicsID`
    )
);

# To confirm if the table was created
SELECT * FROM Demographics;


# To create Businesstravel Table
CREATE TABLE `BusinessTravel` (
    `TravelID` VARCHAR(5)  NOT NULL ,
    `BusinessTravel` ENUM('Non-Travel', 'Travel_Frequently', 'Travel_Rarely') ,
    PRIMARY KEY (
        `TravelID`
    )
);

# To confirm if the table was created
SELECT * FROM Businesstravel;


--------------------------------------------------------------------------------------------------
# LOAD DATA

# To load data for EmpInfo
INSERT INTO EmpInfo (EmpID,
Age,
Gender,
MaritalStatus,
Over18,
employeecount,
employeenumber,
SalaryID, 
TravelID, 
JobID, 
DemographicsID, 
WorkHistoryID,
EducationID)
SELECT DISTINCT EmpID,
Age,
Gender,
MaritalStatus,
Over18,
employeecount,
employeenumber,
SalaryID, 
TravelID, 
JobID, 
DemographicsID, 
WorkHistoryID,
EducationID
FROM Employees
ORDER BY EMPID;
# To check if the data was loaded
SELECT * FROM empinfo;

# TO LOAD DATA INTO EmployeeEducation
INSERT INTO EmployeeEducation(
EducationID,
Education,
EducationField)
SELECT DISTINCT EducationID,
Education,
EducationField
FROM EMPLOYEES
ORDER BY EDUCATIONID;

# TO CHECK IF THE DATA LOADED
SELECT * FROM EMPLOYEEEDUCATION;


# To load data for Department
INSERT INTO Department (DepartmentID, 
Department)
SELECT DISTINCT DepartmentID, 
Department
FROM Employees
ORDER BY DepartmentID;

# To check if the data was loaded
SELECT * FROM DEPARTMENT;

INSERT INTO JobInfo(JobID, 
DepartmentID, 
JobRole,
JobLevel,
JobInvolvement,
RatingID)
SELECT DISTINCT JobID, 
DepartmentID, 
JobRole,
JobLevel,
JobInvolvement,
RatingID
FROM Employees
ORDER BY JobID;

# To check if the data was loaded
select * from jobinfo;

# To LOAD DATA INTO THE RatingInfo Table
INSERT INTO RatingInfo (RatingID, 
JobSatisfaction,
PerformanceRating,
EnvironmentSatisfaction,
RelationshipSatisfaction,
WorkLifeBalance)
SELECT DISTINCT RatingID, 
JobSatisfaction,
PerformanceRating,
EnvironmentSatisfaction,
RelationshipSatisfaction,
WorkLifeBalance
FROM Employees
ORDER BY RatingID;

# To check if the data was loaded
select * from Ratinginfo;

# To load data into the SalaryInfo Table
INSERT INTO SalaryInfo(SalaryID,
DailyRate,
HourlyRate,
MonthlyIncome,
MonthlyRate,
PercentSalaryHike,
SalarySlab,
StockOptionLevel)
SELECT DISTINCT SalaryID,
DailyRate,
HourlyRate,
MonthlyIncome,
MonthlyRate,
PercentSalaryHike,
SalarySlab,
StockOptionLevel
FROM Employees
ORDER BY SalaryID;

# To check if the data was loaded
select * from salaryinfo;

# To load data into the WorkHistory Table
INSERT INTO WorkHistory(WorkHistoryID, 
Attrition,
DistanceFromHome,
NumCompaniesWorked,
TotalWorkingYears,
TrainingTimesLastYear,
YearsAtCompany,
YearsInCurrentRole,
YearsSinceLastPromotion,
YearsWithCurrManager,
OverTime)
SELECT DISTINCT WorkHistoryID, 
Attrition,
DistanceFromHome,
NumCompaniesWorked,
TotalWorkingYears,
TrainingTimesLastYear,
YearsAtCompany,
YearsInCurrentRole,
YearsSinceLastPromotion,
YearsWithCurrManager,
OverTime
FROM Employees
ORDER BY WorkHistoryID;

# To check if the data was loaded
select * from WorkHistory;

# To insert data into the Demographics Table
INSERT INTO Demographics(DemographicsID,
AgeGroup)
SELECT DISTINCT DemographicsID,
AgeGroup
FROM Employees
ORDER BY DemographicsID;

# To check if the data was loaded
select * from demographics;

# To load data for Department
INSERT INTO BusinessTravel (TravelID, 
BusinessTravel)
SELECT DISTINCT TravelID, 
BusinessTravel
FROM Employees
ORDER BY TravelID;

-----------------------------------------------------------------------------------------------------
# ALTER TABLES

# Alter EmpInfo Table
ALTER TABLE `EmpInfo` ADD CONSTRAINT `fk_EmpInfo_SalaryID` FOREIGN KEY(`SalaryID`)
REFERENCES `SalaryInfo` (`SalaryID`);

ALTER TABLE `EmpInfo` ADD CONSTRAINT `fk_EmpInfo_TravelID` FOREIGN KEY(`TravelID`)
REFERENCES `BusinessTravel` (`TravelID`);

ALTER TABLE `EmpInfo` ADD CONSTRAINT `fk_EmpInfo_EducationID` FOREIGN KEY(`EducationID`)
REFERENCES `EmployeeEducation` (`EducationID`);

ALTER TABLE `EmpInfo` ADD CONSTRAINT `fk_EmpInfo_JobID` FOREIGN KEY(`JobID`)
REFERENCES `JobInfo` (`JobID`);

ALTER TABLE `EmpInfo` ADD CONSTRAINT `fk_EmpInfo_DemographicsID` FOREIGN KEY(`DemographicsID`)
REFERENCES `Demographics` (`DemographicsID`);

ALTER TABLE `EmpInfo` ADD CONSTRAINT `fk_EmpInfo_WorkHistoryID` FOREIGN KEY(`WorkHistoryID`)
REFERENCES `WorkHistory` (`WorkHistoryID`);

# Alter JobInfo Table
ALTER TABLE `JobInfo` ADD CONSTRAINT `fk_JobInfo_DepartmentID` FOREIGN KEY(`DepartmentID`)
REFERENCES `Department` (`DepartmentID`);

ALTER TABLE `JobInfo` ADD CONSTRAINT `fk_JobInfo_RatingID` FOREIGN KEY(`RatingID`)
REFERENCES `RatingInfo` (`RatingID`);


-------------------------------------------------------------------------------------------------
# CREATION OF VIEWS

# 1. Can you provide an overview of the demographic information for our employees?
CREATE VIEW HR_Analytics_View AS
SELECT
    EmpID,
    Age,
    Gender,
    MaritalStatus,
    Education,
    EducationField
FROM EmpInfo
INNER JOIN EmployeeEducation
USING(EducationID);

# Test View
SELECT *
FROM HR_Analytics_View;

# 2. How is the salary distributed among our employees?
CREATE VIEW Salary_Distribution_View AS
SELECT
    SalarySlab,
    COUNT(*) AS EmployeeCount
FROM SalaryInfo
GROUP BY SalarySlab;

# Test View
SELECT *
FROM Salary_Distribution_View;


# 3. How is career advancement within the company, and what is the average time it takes for an employee to get promoted?
CREATE VIEW Average_Years_Between_Promotions_View AS
SELECT
    JobRole,
    AVG(YearsSinceLastPromotion) AS AverageYearsBetweenPromotions
FROM JobInfo
INNER JOIN EmpInfo
USING(JobID)
INNER JOIN WorkHistory
USING(WorkHistoryID)
GROUP BY JobRole;


# Test View
SELECT *
FROM Average_Years_Between_Promotions_View;

# 4. How does employee performance correlate with job satisfaction and environment satisfaction?
CREATE VIEW Employee_Performance_View AS
SELECT
    PerformanceRating,
    AVG(JobSatisfaction) AS AverageJobSatisfaction,
    AVG(EnvironmentSatisfaction) AS AverageEnvironmentSatisfaction
FROM RatingInfo
GROUP BY PerformanceRating;


# Test View
SELECT *
FROM Employee_Performance_View;

# 5. How does job satisfaction vary by gender?
CREATE VIEW Employee_Engagement_View AS
SELECT
    Gender,
    AVG(JobSatisfaction) AS AverageJobSatisfaction
FROM RatingInfo
INNER JOIN JobInfo
USING(RatingID)
INNER JOIN EmpInfo
USING(JobID)
GROUP BY Gender;


# Test View
SELECT *
FROM Employee_Engagement_View;


# 6. What is the attrition rate by department?
CREATE VIEW Attrition_Rate_View AS
SELECT
    Department,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(EmpID) AS TotalEmployees,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*) * 100, 2) AS AttritionRate
FROM department d
INNER JOIN JobInfo j
ON d.DepartmentID = j.DepartmentID
INNER JOIN EmpInfo e
ON j.JobID = e.JobID
INNER JOIN WorkHistory w 
ON e.WorkHistoryID = w.WorkHistoryID
GROUP BY Department;

# Test View
SELECT *
FROM Attrition_Rate_View;
-------------------------------------------------------------------------------------------
# USER MANAGEMENT AND SECURITY

# SO I DECIDED TO CREATE 4 USER ROLES DBA, HR_MANAGER, HR_ANALYST, HR_INTERN AND ASSIGN CERTAIN PRIVILEDGES TO THEM


# TO CREATE HR_MANAGER ROLE
CREATE ROLE Hr_Manager;

# TO ASSIGN PRIVILEGES TO HR_MANAGER ROLES
GRANT SELECT, INSERT, UPDATE, DELETE ON hr_attritions.* TO Hr_Manager;

# To Create HR Analyst Role
CREATE ROLE hr_analyst;

# To Assign Priviledges to HR Analyst Role
GRANT SELECT ON hr_attrition.* TO hr_analyst;

# To Create HR Intern Role
CREATE ROLE hr_intern;

# To Assign Priviledges to HR Intern Role
GRANT SELECT ON hr_attritions.businesstravel TO hr_intern;
GRANT SELECT ON hr_attritions.demographics TO hr_intern;
GRANT SELECT ON hr_attritions.department TO hr_intern;
GRANT SELECT ON hr_attritions.empinfo TO hr_intern;
GRANT SELECT ON hr_attritions.employeeeducation TO hr_intern;
GRANT SELECT ON hr_attritions.jobinfo TO hr_intern;
GRANT SELECT ON hr_attritions.ratinginfo TO hr_intern;
GRANT SELECT ON hr_attritions.workhistory TO hr_intern;
GRANT SELECT ON hr_attritions.masked_salaryinfo TO hr_intern;



# To Create DBA Role
CREATE ROLE DBA;

-- Grant Full Privileges to DBA Role
GRANT ALL PRIVILEGES ON *.* TO DBA WITH GRANT OPTION;

-- Flush Privileges to Apply Changes
FLUSH PRIVILEGES;

------------------------------------------------------------------------------------------------------
# Data Security 


# Let's create user account to Chidera, the DBA
CREATE USER 'Chidera'@'localhost' IDENTIFIED BY 'ChideraDBA0011$$..';

# Let's Assign the DBA Role to Chidera
GRANT DBA TO 'Chidera'@'localhost';

# Let's create user account to Tobi, the HR_Manager
CREATE USER 'Tobi'@'localhost' IDENTIFIED BY 'TobiHRM11$$..';

# Let's Assign the Hr_Manager Role to Tobi
GRANT Hr_Manager TO 'Tobi'@'localhost';

# Let's create user account to Mayowa, the HR_Analyst
CREATE USER 'Mayowa'@'localhost' IDENTIFIED BY 'MayowaHRA34$$..';

# Let's Assign the HR_Analyst Role to Mayowa
GRANT hr_analyst TO 'Mayowa'@'localhost';

# Let's create user account to Prince, the Hr_Intern
CREATE USER 'Prince'@'localhost' IDENTIFIED BY 'PrinceHRI67$$..';

# Let's Assign the HR_INTERN Role to Prince
GRANT hr_analyst TO 'Prince'@'localhost';

# To show current user
SELECT CURRENT_USER();


GRANT CREATE USER, GRANT OPTION ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

# To list all users
SELECT User, Host FROM mysql.user;

# TO SHOW USER PRIVILEGES
 SHOW GRANTS FOR 'Tobi'@'Localhost';

----------------------------------------------------------------------------------------------------
# Data Masking

# To create a view that masks the monthly rate columns for hr_interns
CREATE VIEW masked_salaryinfo AS
SELECT
    SalaryID,
DailyRate,
HourlyRate,
MonthlyIncome,
PercentSalaryHike,
SalarySlab,
StockOptionLevel,
    CASE
        WHEN user() = 'hr_intern@%' THEN CONCAT(SUBSTRING(MonthlyRate, 1, 2), '******')  -- Mask for hr_interns
        ELSE MonthlyRate  -- Display as is for other users
    END AS MonthlyRate
FROM
    salaryinfo;
-------------------------------------------------------------------------------------------------------
# DATABASE BACKUP


# TO BE RAN IN  COMMAND PROMPT
mysqldump -u root -p hr_attritions > hr_attritions_backup.sql





