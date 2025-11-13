**Project Name: International Study Costs Analysis (SQL + Power BI)**

**Description:**
This project focuses on analyzing global study abroad costs using a combination of SQL Server for data cleaning and Power BI for visualization. The goal was to provide actionable insights into tuition fees, living costs, and program availability across countries and universities.

**Key Steps & Workflow:**

**Data Cleaning & Transformation (SQL Server):**

Checked and validated column datatypes

Removed duplicates and handled missing values

Converted text-based numeric fields (tuition, rent, exchange rates) into proper numeric formats using TRY_CAST

Created a cleaned table international_study_Cleaned for analysis

**Data Analysis Queries:**

Top 5 most expensive universities by tuition

Average tuition fee by country

Average total estimated annual cost per country (tuition + rent + insurance + visa fee)

Count of programs offered per country

**Power BI Dashboard:**

Connected cleaned SQL table to Power BI

Built interactive visuals including:

Average Tuition Fee by Country (Bar/Map Chart)

Total Estimated Cost by University (Column/Tree Map)

Program Count by University (Bar Chart)

Sum of Duration Years by University (Clustered Column Chart)

Enabled slicers and filters for dynamic exploration

**Tools Used:**

SQL Server (Data Cleaning, Queries)

Power BI (Dashboard, Interactive Visuals)

**Outcome:**
The project provides clear insights into study abroad costs, helping students, counselors, and educational planners compare countries, universities, and programs efficiently.
