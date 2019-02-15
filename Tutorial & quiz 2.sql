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

  
