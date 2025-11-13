-- Check the columns datatypes
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'international_study';

-- Create new table for clean data
CREATE TABLE international_study_Cleaned (
    Country             VARCHAR(50),
    City                VARCHAR(50),
    University          VARCHAR(100),
    Program             VARCHAR(100),
    Level               VARCHAR(20),
    Duration_Years      INT,
    Tuition_USD         FLOAT,
    Living_Cost_Index   FLOAT,
    Rent_USD            FLOAT,
    Visa_Fee_USD        FLOAT,
    Insurance_USD       FLOAT,
    Exchange_Rate       FLOAT
);

-- Insert cleaned data into new table
INSERT INTO international_study_Cleaned
SELECT
    Country,
    City,
    University,
    Program,
    Level,
    TRY_CAST(Duration_Years AS INT),
    TRY_CAST(Tuition_USD AS FLOAT),
    TRY_CAST(Living_Cost_Index AS FLOAT),
    TRY_CAST(Rent_USD AS FLOAT),
    TRY_CAST(Visa_Fee_USD AS FLOAT),
    TRY_CAST(Insurance_USD AS FLOAT),
    TRY_CAST(Exchange_Rate AS FLOAT)
FROM international_study;

-- Check for conversion issues
SELECT * FROM international_study_Cleaned
WHERE Tuition_USD IS NULL OR Rent_USD IS NULL OR Exchange_Rate IS NULL;

-- Top 5 most expensive universities
SELECT TOP 5 University, Country, Tuition_USD
FROM international_study_Cleaned
WHERE Tuition_USD IS NOT NULL
ORDER BY Tuition_USD DESC;

-- Average tuition fee by country
SELECT Country, AVG(Tuition_USD) AS Avg_Tuition
FROM international_study_Cleaned
WHERE Tuition_USD IS NOT NULL
GROUP BY Country
ORDER BY Avg_Tuition DESC;

-- Average total estimated cost per country
SELECT 
   Country,
   AVG(Tuition_USD + (Rent_USD * 12) + Insurance_USD + Visa_Fee_USD) AS Avg_Annual_Total_Cost
FROM international_study_Cleaned
GROUP BY Country
ORDER BY Avg_Annual_Total_Cost DESC;

-- Count of programs per country
SELECT Country, COUNT(*) AS Program_Count
FROM international_study_Cleaned
GROUP BY Country
ORDER BY Program_Count DESC;
