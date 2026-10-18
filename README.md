Layoffs Data Cleaning & EDA (MySQL)

An end-to-end SQL project that takes a raw global layoffs dataset, cleans it in MySQL, and then explores it to find patterns by company, country and time.

Project Overview

Raw data is rarely analysis-ready. This project covers two stages:

Data cleaning: removing duplicates, standardizing text and dates, handling nulls and blanks, and dropping unusable rows and columns.
Exploratory data analysis (EDA): querying the cleaned table to see which companies, countries and months saw the most layoffs.
Tools Used
MySQL
MySQL Workbench
Repository Structure
File	Description
01_raw_layoffs.csv	Original raw dataset
02_the_data_cleaning_project.sql	Full data cleaning script
03_cleaned_table.csv	Cleaned table exported after running the cleaning script
04_exploratory_data_analysis.sql	EDA queries run on the cleaned table
Dataset

The dataset contains global layoff records with these columns: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions.

Data Cleaning Steps

The raw table is never modified directly. A staging table (layoffs_staging) is created first, then a second one (layoffs_staging2) is used for the actual cleaning.

Remove duplicates: used ROW_NUMBER() with PARTITION BY across all columns to flag duplicates, then deleted rows where row_num > 1.
Standardize the data
Trimmed extra whitespace from company names
Merged variations of the same industry (e.g. Crypto% values into Crypto)
Fixed inconsistent country names (e.g. United States% into United States)
Converted the date column from text to a proper DATE type using STR_TO_DATE() and ALTER TABLE
Handle null and blank values: converted blank industries to NULL, then populated missing industries by self-joining on company name where another row for the same company had the value.
Remove unnecessary rows and columns: deleted rows where both total_laid_off and percentage_laid_off were null (no usable layoff data), and dropped the helper row_num column.
Exploratory Data Analysis

The EDA script explores the cleaned data using:

Layoffs filtered by country (India)
Companies that laid off 100% of their staff, ordered by funds raised
Total layoffs per company
Largest individual layoff events
Monthly layoff totals
A rolling total of layoffs over time using a CTE and a window function (SUM() OVER)
Key Insights

Fill these in with your own results after running the EDA queries.

Company with the most total layoffs: your result
Largest single layoff event: your result
Month with the highest layoffs: your result
Overall total laid off in the dataset: your result
Observation about companies that shut down completely (100% laid off): your result
SQL Concepts Demonstrated
Staging tables to protect raw data
CTEs and window functions (ROW_NUMBER, running SUM() OVER)
Self-joins to populate missing values
Data type conversion (STR_TO_DATE, ALTER TABLE ... MODIFY COLUMN)
GROUP BY, ORDER BY, filtering and aggregation
How to Run
Create a database in MySQL Workbench (this project uses the name world_layoffs).
Import 01_raw_layoffs.csv into a table named layoffs (right-click the schema's Tables, then Table Data Import Wizard).
Run 02_the_data_cleaning_project.sql to produce the cleaned table layoffs_staging2.
Run 04_exploratory_data_analysis.sql to explore the cleaned data.

03_cleaned_table.csv is included so you can see the final cleaned output without running the script.

Acknowledgements

Project guided by Alex the Analyst's MySQL data cleaning and EDA tutorials, using the dataset provided in the series.

Author

Arjun R B.Sc. Computer Science | Aspiring Data Analyst (BFSI) Skills: SQL, Python, Excel, Power BI
