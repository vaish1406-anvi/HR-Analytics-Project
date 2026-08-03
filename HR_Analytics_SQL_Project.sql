-- ============================================
-- HR ANALYTICS SQL PROJECT
-- ============================================
-- STEP 1 : Create Database

DROP DATABASE IF EXISTS hr_analytics;
CREATE DATABASE hr_analytics;
USE hr_analytics;

-- STEP 2 : Import CSV using Table Data Import Wizard
-- Right Click Database → Table Data Import Wizard
-- Select HR_Analytics.csv
-- Create New Table → hr_data
-- Finish Import

-- STEP 3 : Verify Import

SELECT * FROM hr_data;
SELECT COUNT(*) FROM hr_data;
-- =====================================================
-- STEP 4 : DATA EXPLORATION
-- =====================================================

SELECT *
FROM hr_data
LIMIT 10;

SELECT COUNT(*) AS Total_Employees
FROM hr_data;

SELECT *
FROM hr_data
WHERE Age IS NULL;

SELECT DISTINCT Department
FROM hr_data;

SELECT DISTINCT JobRole
FROM hr_data;

SELECT DISTINCT EducationField
FROM hr_data;

SELECT DISTINCT Gender
FROM hr_data;

SELECT DISTINCT Attrition
FROM hr_data;

-- =====================================================
-- STEP 5 : DATA CLEANING
-- =====================================================

SELECT COUNT(*)
FROM hr_data;

SELECT COUNT(DISTINCT EmpID)
FROM hr_data;

-- Duplicate Check

SELECT EmpID,
COUNT(*)
FROM hr_data
GROUP BY EmpID
HAVING COUNT(*)>1;

-- Missing Values

SELECT
SUM(Age IS NULL) Age,
SUM(Department IS NULL) Department,
SUM(JobRole IS NULL) JobRole,
SUM(MonthlyIncome IS NULL) MonthlyIncome
FROM hr_data;

DESCRIBE hr_data;
ALTER TABLE hr_data
CHANGE COLUMN `ï»¿EmpID` EmpID TEXT;

-- =====================================================
-- KPI 1 Total Employees
-- =====================================================

SELECT COUNT(*) AS TotalEmployees
FROM hr_data;

-- =====================================================
-- KPI 2 Attrition Count
-- =====================================================

SELECT COUNT(*) AS AttritionCount
FROM hr_data
WHERE Attrition='Yes';

-- =====================================================
-- KPI 3 Attrition Rate
-- =====================================================

SELECT
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100
/
COUNT(*),2) AS AttritionRate
FROM hr_data;

-- =====================================================
-- KPI 4 Active Employees
-- =====================================================

SELECT COUNT(*) ActiveEmployees
FROM hr_data
WHERE Attrition='No';

-- =====================================================
-- KPI 5 Average Age
-- =====================================================

SELECT ROUND(AVG(Age),2)
AS AverageAge
FROM hr_data;

-- =====================================================
-- KPI 6 Average Monthly Income
-- =====================================================

SELECT ROUND(AVG(MonthlyIncome),2)
AS AvgSalary
FROM hr_data;

-- =====================================================
-- KPI 7 Average Years at Company
-- =====================================================

SELECT ROUND(AVG(YearsAtCompany),2)
AS AvgExperience
FROM hr_data;

-- =====================================================
-- KPI 8 Department Wise Employees
-- =====================================================

SELECT
Department,
COUNT(*) Employees
FROM hr_data
GROUP BY Department
ORDER BY Employees DESC;

-- =====================================================
-- KPI 9 Department Wise Attrition
-- =====================================================

SELECT
Department,
COUNT(*) Attrition
FROM hr_data
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Attrition DESC;

-- =====================================================
-- KPI 10 Gender Distribution
-- =====================================================

SELECT
Gender,
COUNT(*) Employees
FROM hr_data
GROUP BY Gender;

-- =====================================================
-- KPI 11 Age Group Distribution
-- =====================================================

SELECT
AgeGroup,
COUNT(*) Employees
FROM hr_data
GROUP BY AgeGroup
ORDER BY Employees DESC;

-- =====================================================
-- KPI 12 Job Role Distribution
-- =====================================================

SELECT
JobRole,
COUNT(*) Employees
FROM hr_data
GROUP BY JobRole
ORDER BY Employees DESC;

-- =====================================================
-- KPI 13 Job Role Wise Attrition
-- =====================================================

SELECT
JobRole,
COUNT(*) Attrition
FROM hr_data
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Attrition DESC;

-- =====================================================
-- KPI 14 Salary Slab Distribution
-- =====================================================

SELECT
SalarySlab,
COUNT(*) Employees
FROM hr_data
GROUP BY SalarySlab;

-- =====================================================
-- KPI 15 Salary Slab Wise Attrition
-- =====================================================

SELECT
SalarySlab,
COUNT(*) Attrition
FROM hr_data
WHERE Attrition='Yes'
GROUP BY SalarySlab;

-- =====================================================
-- KPI 16 Overtime Analysis
-- =====================================================

SELECT
OverTime,
COUNT(*) Employees
FROM hr_data
GROUP BY OverTime;

-- =====================================================
-- KPI 17 Overtime vs Attrition
-- =====================================================

SELECT
OverTime,
COUNT(*) Attrition
FROM hr_data
WHERE Attrition='Yes'
GROUP BY OverTime;

-- =====================================================
-- KPI 18 Business Travel Analysis
-- =====================================================

SELECT
BusinessTravel,
COUNT(*) Employees
FROM hr_data
GROUP BY BusinessTravel;

-- =====================================================
-- KPI 19 Business Travel vs Attrition
-- =====================================================

SELECT
BusinessTravel,
COUNT(*) Attrition
FROM hr_data
WHERE Attrition='Yes'
GROUP BY BusinessTravel;

-- =====================================================
-- KPI 20 Education Field Analysis
-- =====================================================

SELECT
EducationField,
COUNT(*) Employees
FROM hr_data
GROUP BY EducationField
ORDER BY Employees DESC;

-- =====================================================
-- KPI 21 Marital Status Analysis
-- =====================================================

SELECT
MaritalStatus,
COUNT(*) Employees
FROM hr_data
GROUP BY MaritalStatus;

-- =====================================================
-- KPI 22 Average Salary by Department
-- =====================================================

SELECT
Department,
ROUND(AVG(MonthlyIncome),0) AverageSalary
FROM hr_data
GROUP BY Department
ORDER BY AverageSalary DESC;

-- =====================================================
-- KPI 23 Highest Salary Employees
-- =====================================================

SELECT
EmpID,
Department,
JobRole,
MonthlyIncome
FROM hr_data
ORDER BY MonthlyIncome DESC
LIMIT 10;

-- =====================================================
-- KPI 24 Lowest Salary Employees
-- =====================================================

SELECT
EmpID,
Department,
JobRole,
MonthlyIncome
FROM hr_data
ORDER BY MonthlyIncome
LIMIT 10;

-- =====================================================
-- KPI 25 Average Experience by Department
-- =====================================================

SELECT
Department,
ROUND(AVG(TotalWorkingYears),2)
AS AvgExperience
FROM hr_data
GROUP BY Department;

-- =====================================================
-- KPI 26 Work Life Balance
-- =====================================================

SELECT
WorkLifeBalance,
COUNT(*) Employees
FROM hr_data
GROUP BY WorkLifeBalance;

-- =====================================================
-- KPI 27 Performance Rating
-- =====================================================

SELECT
PerformanceRating,
COUNT(*) Employees
FROM hr_data
GROUP BY PerformanceRating;

-- =====================================================
-- KPI 28 Environment Satisfaction
-- =====================================================

SELECT
EnvironmentSatisfaction,
COUNT(*) Employees
FROM hr_data
GROUP BY EnvironmentSatisfaction;

-- =====================================================
-- KPI 29 Job Satisfaction
-- =====================================================

SELECT
JobSatisfaction,
COUNT(*) Employees
FROM hr_data
GROUP BY JobSatisfaction;

-- =====================================================
-- KPI 30 Top 5 Highest Paying Job Roles
-- =====================================================

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 0) AS AvgSalary
FROM hr_data
GROUP BY JobRole
ORDER BY AvgSalary DESC
LIMIT 5;

-- =====================================================
-- KPI 31 Top 5 Departments by Salary
-- =====================================================

SELECT
Department,
SUM(MonthlyIncome)
AS TotalSalary
FROM hr_data
GROUP BY Department
ORDER BY TotalSalary DESC
LIMIT 5;

-- =====================================================
-- KPI 32 Rank Employees by Salary
-- =====================================================

SELECT
EmpID,
Department,
MonthlyIncome,
RANK() OVER(ORDER BY MonthlyIncome DESC) SalaryRank
FROM hr_data;

-- =====================================================
-- KPI 33 Dense Rank
-- =====================================================

SELECT
EmpID,
MonthlyIncome,
DENSE_RANK() OVER(ORDER BY MonthlyIncome DESC) SalaryRank
FROM hr_data;

-- =====================================================
-- KPI 34 Row Number
-- =====================================================

SELECT
EmpID,
Department,
MonthlyIncome,
ROW_NUMBER() OVER(PARTITION BY Department ORDER BY MonthlyIncome DESC)
AS RowNum
FROM hr_data;

-- =====================================================
-- KPI 35 Running Salary Total
-- =====================================================

SELECT
EmpID,
Department,
MonthlyIncome,
SUM(MonthlyIncome)
OVER(ORDER BY MonthlyIncome)
AS RunningSalary
FROM hr_data;

-- =====================================================
-- END OF PROJECT
-- =====================================================