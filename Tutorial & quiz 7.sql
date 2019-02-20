--1
SELECT id, title
 FROM movie
 WHERE yr=1962

 --2
 SELECT yr
 FROM movie
 WHERE title='Citizen Kane'

 --3
 SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'
ORDER BY yr

--4
SELECT id
 FROM actor
 WHERE name='Glenn Close'

 --5
 SELECT id
 FROM movie
 WHERE title='Casablanca'

 --6
 SELECT name
 FROM movie
 JOIN casting
 ON movie.id=movieid
 JOIN actor
 ON actor.id=actorid
WHERE movieid=11768

-- 7
SELECT name
FROM movie
  JOIN casting
    ON movie.id=movieid
  JOIN actor
    ON actor.id=actorid
WHERE movie.title = 'Alien'
;

-- 8
SELECT movie.title FROM movie
  JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
  ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
;

-- 9
SELECT movie.title FROM movie
  JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
  ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND casting.ord > 1
;

-- 10
SELECT movie.title, actor.name FROM movie
  JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
  ON casting.actorid = actor.id
WHERE movie.yr = 1962
AND casting.ord = 1
;

-- 11
SELECT yr,COUNT(title)
FROM movie
  JOIN casting
    ON movie.id=movieid
  JOIN actor
    ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr

HAVING
  COUNT(title)=
  (SELECT MAX(c) FROM
    (SELECT yr, COUNT(title) AS c
      FROM movie
        JOIN casting  ON movie.id=movieid
        JOIN actor     ON actorid=actor.id
        WHERE name='John Travolta'
        GROUP BY yr)
   AS t)
;

-- 12
SELECT DISTINCT new.title, actor.name FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN
(SELECT movie.id, title FROM movie
  JOIN casting
      ON movie.id = casting.movieid
   JOIN actor
      ON casting.actorid = actor.id
   WHERE actor.name = 'Julie Andrews'
 ) AS new
ON casting.movieid = new.id
WHERE casting.ord = 1
;

-- 13
SELECT actor.name
FROM actor
JOIN casting
ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.ord) >= 30
;

-- 14
SELECT movie.title, COUNT(casting.actorid) FROM movie
JOIN casting
ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title
;

-- 15
SELECT DISTINCT actor.name FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN
(SELECT movie.id, title FROM movie
  JOIN casting
      ON movie.id = casting.movieid
   JOIN actor
      ON casting.actorid = actor.id
   WHERE actor.name = 'Art Garfunkel'
 ) AS new
ON casting.movieid = new.id
WHERE actor.name != 'Art Garfunkel'
;
