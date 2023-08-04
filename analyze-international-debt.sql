#Inspect the international debt data.

SELECT * FROM int_debt
LIMIT 10;

#Find the number of distinct country

SELECT COUNT(DISTINCT country_name) AS total_distinct_country FROM int_debt;

#Extract the unique debt indicators in the table.

SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM int_debt
ORDER BY distinct_debt_indicators;

#Find out the total amount of debt as reflected in the table.

SELECT ROUND(SUM(debt)/1000000,2) AS total_debt
FROM int_debt;

#Find out the country owing to the highest debt.

SELECT country_name, SUM(debt) AS total_debt
FROM int_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

#Determine the average amount of debt owed across the categories.

SELECT indicator_code AS debt_indicator, indicator_name, AVG(debt) AS average_debt
FROM int_debt 
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC 
LIMIT 10;

#Find out the country with the highest amount of principal repayments.

SELECT 
    country_name, 
    indicator_name
FROM int_debt
WHERE debt = (SELECT MAX(debt) FROM int_debt WHERE indicator_code = 'DT.AMT.DLXF.CD');
            
#Find out the country with the highest amount of principal repayments.

SELECT indicator_code, count(indicator_code) AS indicator_count
FROM int_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

#Get the maximum amount of debt that each country owes.

SELECT country_name, MAX(debt) AS maximum_debt
FROM int_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10;
            