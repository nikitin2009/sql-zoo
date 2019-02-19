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

-- 7 Largest in each continent
SELECT continent, name, area FROM world AS x
  WHERE area >= ALL
                               (SELECT area FROM world AS y
                               WHERE y.continent=x.continent
                               AND area>0)
;
-- 8 First country of each continent (alphabetically)
SELECT DISTINCT continent, name FROM world AS x
WHERE name <= ALL (SELECT name FROM world AS y
                  WHERE x.continent = y.continent)
;

-- 9 Difficult Questions That Utilize Techniques Not Covered In Prior Sections
SELECT name, continent, population FROM world x
  WHERE 25000000 > ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent)

-- 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x
  WHERE population >= ALL
    (SELECT population*3 FROM world y
        WHERE y.continent=x.continent
        AND y.name!=x.name)
;

--== Nested SELECT Quiz ==--
-- 1. Select the code that shows the name, region and population of the smallest country in each region
 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)
 
 --2. Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

--3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

 --4. Select the result that would be obtained from the following code:
-- SELECT name FROM bbc
--  WHERE population >
--        (SELECT population
--           FROM bbc
--          WHERE name='United Kingdom')
--    AND region IN
--        (SELECT region
--           FROM bbc
--          WHERE name = 'United Kingdom')


Table-D
France
Germany
Russia
Turkey

-- 5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- 6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7. >Select the result that would be obtained from the following code:

Table-B
Bangladesh
India
Pakistan
