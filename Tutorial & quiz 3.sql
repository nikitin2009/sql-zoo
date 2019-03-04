-- 1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--  2.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

  --  3.
  SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

--  4.
SELECT winner
  FROM nobel
 WHERE subject = 'Peace'
AND yr > 1999

-- 5 Literature in the 1980's
SELECT * FROM nobel
WHERE subject = 'Literature'
AND yr >= 1980
AND yr <= 1989
;

-- 6 Only Presidents
SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
;

-- 7 John
SELECT winner FROM nobel
WHERE winner LIKE ('John%')
;

-- 8 Chemistry and Physics from different years
SELECT * FROM nobel
WHERE subject = 'Physics'
AND yr = 1980
XOR subject = 'Chemistry'
AND yr = 1984
;

-- 9 Exclude Chemists and Medics
SELECT * FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry', 'Medicine')
;

-- 10 Early Medicine, Late Literature
SELECT * FROM nobel
WHERE subject = 'Medicine'
AND yr < 1910
XOR subject = 'Literature'
AND yr >= 2004
;

-- 11 Umlaut
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'
;

-- 12 Apostrophe
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL'
;

-- 13 Knights of the realm
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC
;

-- 14 Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner


--  Quiz
-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

-- 3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4. Select the result that would be obtained from the following code:
--SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'

Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

-- 5. Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

-- 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine'
   AND yr NOT IN(SELECT yr FROM nobel
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7. Pick the result that would be obtained from the following code:
-- SELECT subject, COUNT(subject)
--   FROM nobel
--  WHERE yr ='1960'
--  GROUP BY subject
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1
