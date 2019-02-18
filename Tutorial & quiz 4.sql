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
