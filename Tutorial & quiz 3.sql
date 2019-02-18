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
WHERE winner = 'EUGENE O\'NEILL'
;

-- 13 Knights of the realm
