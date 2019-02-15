--== SELECT basics ==--
-- 1 Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany';

-- 2 Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3 Just the right size
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

--== SELECT quiz ==--
--      _______________                        |*\_/*|________
--     |  ___________  |     .-.     .-.      ||_/-\_|______  |
--     | |           | |    .****. .****.     | |           | |
--     | |   0   0   | |    .*****.*****.     | |   0   0   | |
--     | |     -     | |     .*********.      | |     -     | |
--     | |   \___/   | |      .*******.       | |   \___/   | |
--     | |___     ___| |       .*****.        | |___________| |
--     |_____|\_/|_____|        .***.         |_______________|
--       _|__|/ \|_|_.............*.............._|________|_
--     / ********** \                          / ********** \
--     /  ************  \                     /  ************  \
--    --------------------                    --------------------

-- Question 1
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000;

 -- Question 2
 Table-E;

 -- Question 3
 SELECT name FROM world
  WHERE name LIKE '%a' OR name LIKE '%l';

-- Question 4

name	length(name)
Italy	5
Malta	5
Spain	5


-- Question 5
Andorra	936


-- Question 6
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000;

-- Question 7
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia');
