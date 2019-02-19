--==SELECT within SELECT Tutorial ++ --
-- 1 Bigger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
;

-- 2 Richer than UK
SELECT name FROM world
  WHERE (gdp/population) >
    (SELECT (gdp/population) FROM world
       WHERE name = 'United Kingdom')
  AND continent = 'Europe'
;

-- 3 Neighbours of Argentina and Australia
SELECT name, continent FROM world
  WHERE continent = (SELECT continent FROM world WHERE name = 'Australia')
  OR continent = (SELECT continent FROM world WHERE name = 'Argentina')
    ORDER BY name
;

-- 4 Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Canada')
    AND population < 
     (SELECT population FROM world
      WHERE name='Poland')

-- 5 Percentages of Germany
SELECT name, 
CONCAT(ROUND((population/(SELECT population FROM world WHERE name='Germany'))*100), '%')
FROM world
WHERE continent='Europe'

-- 6 Bigger than every country in Europe
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                           FROM world
                          WHERE continent='Europe'
                            AND gdp>0)