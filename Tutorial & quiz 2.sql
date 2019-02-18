--== SELECT from WORLD Tutorial ==--
-- 1 Introduction --
SELECT name, continent, population FROM world;

-- 2 Large Countries --
SELECT name FROM world
WHERE population >= 200000000;

-- 3 Per capita GDP --
SELECT name, gdp/population AS per_capita_GDP
FROM world
  WHERE population >= 200000000;

-- 4 South America In millions
SELECT name, population/1000000 FROM world
WHERE continent='South America'

-- 5 France, Germany, Italy
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- 6 United
SELECT name FROM world
WHERE name LIKE '%United%'

-- 7 Two ways to be big
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

-- 8 One or the other (but not both)
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000


-- 9 Rounding
SELECT name,
ROUND(population/1000000, 2) AS population_rounded,
ROUND(gdp/1000000000, 2) AS GDP_rounded
  FROM  world
  WHERE continent = 'South America'
;


-- 10 Trillion dollar economies
SELECT name, ROUND((gdp/population)/1000)*1000 AS 'GDP/pop' FROM world

WHERE gdp > 1000000000000
;


-- 11 Name and capital have the same length
SELECT name, capital
  FROM world
 WHERE LENGTH(name)  =  LENGTH(capital)
;

-- 12 Matching name and capital
SELECT name, capital
  FROM world
 WHERE LEFT(name,1)  =  LEFT(capital,1)
AND name NOT LIKE capital
;

-- 13 All the vowels
SELECT name
   FROM world
WHERE name LIKE ('%a%')
AND name LIKE ('%e%')
AND name LIKE ('%i%')
AND name LIKE ('%o%')
AND name LIKE ('%u%')
AND name NOT LIKE ('% %')
;


-- Quiz

-- 1. Select the code which gives the name of countries beginning with U
SELECT name
  FROM world
 WHERE name LIKE 'U%'

--  2. Select the code which shows just the population of United Kingdom?
SELECT population
  FROM world
 WHERE name = 'United Kingdom'

--  3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
'name' should be name

-- 4. Select the result that would be obtained from the following code:
Nauru	990

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

--  6. Select the code which would give two rows
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

--  7. Select the result that would be obtained from this code:
Brazil
Colombia


