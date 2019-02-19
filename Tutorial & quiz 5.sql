--== SUM and COUNT Tutorial ==--
-- 1 Total world population
SELECT SUM(population) FROM world;

-- 2 List of continents
SELECT DISTINCT continent FROM world;

-- 3 GDP of Africa
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa'

-- 4 Count the big countries
SELECT COUNT(name) FROM world
WHERE area >= 1000000

-- 5 Baltic states population
SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- Using GROUP BY and HAVING
-- 6 Counting the countries of each continent
SELECT continent, COUNT(name) FROM world
GROUP BY continent

-- 7 Counting big countries in each continent
SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent

-- 8 Counting big continents
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000


-- ========= SUM and COUNT Quiz
-- 1. Select the statement that shows the sum of population of all countries in 'Europe'
SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- 2. Select the statement that shows the number of countries with population smaller than 150000
SELECT COUNT(name) FROM bbc WHERE population < 150000

-- 3. Select the list of core SQL aggregate functions
AVG(), COUNT(), MAX(), MIN(), SUM()

--4. Select the result that would be obtained from the following code: 
No result due to invalid use of the WHERE function

--5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- 6. Select the statement that shows the medium population density of each region
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

 --7. Select the statement that shows the name and population density of the country with the largest population
  SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

  --8. Pick the result that would be obtained from the following code:
  Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710