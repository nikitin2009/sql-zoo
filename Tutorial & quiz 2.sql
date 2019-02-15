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
