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

-- QUIZ
--1
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

--2
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

--3
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

--4
Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack

--5
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

--6
link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table

--7
Table-B
A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011

