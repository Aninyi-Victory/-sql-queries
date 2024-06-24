-- Select the Data we are going to be using

SELECT * FROM projectportfolio.`covid deaths`;
SELECT location, date, total_cases, new_cases, total_deaths
 FROM projectportfolio.`covid deaths`;
 
 -- Looking at total cases vs total deaths in Nigeria
SELECT location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
 FROM projectportfolio.`covid deaths`
 WHERE location LIKE '%Nigeria%';
 
 -- Looking at total cases vs total deaths in the States
 SELECT location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
 FROM projectportfolio.`covid deaths`
 WHERE location LIKE '%states%';
 
 -- Looking at the country with the higest infected rate
 SELECT location, SUM(total_cases) AS totalcases_sum
 FROM projectportfolio.`covid deaths`
 GROUP BY location
 ORDER BY MAX(total_cases) DESC
 LIMIT 1;
 
 -- Looking at the country with the highest death rate
 SELECT location, SUM(total_deaths) AS totaldeaths_sum
 FROM projectportfolio.`covid deaths`
 GROUP BY location
 ORDER BY MAX(total_deaths) DESC
 LIMIT 1;
 
 -- Looking at the total death cases in Nigeria
SELECT location, MAX(total_deaths) as totaldeathcount
 FROM projectportfolio.`covid deaths`
 WHERE location = 'Nigeria'
 GROUP BY location 
 ORDER BY totaldeathcount DESC
 
 -- Looking at the country with the most minimum infection rate  
 SELECT location, SUM(total_cases) AS totalcases_sum
 FROM projectportfolio.`covid deaths`
 GROUP BY location
 ORDER BY MIN(total_cases) DESC
 LIMIT 1;
 
 -- Looking for the country with the most minimum death rate
 SELECT location, SUM(total_deaths) AS totaldeaths_sum
 FROM projectportfolio.`covid deaths`
 GROUP BY location
 ORDER BY MIN(total_deaths) DESC
 LIMIT 1;