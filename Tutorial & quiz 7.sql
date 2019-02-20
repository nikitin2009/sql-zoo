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
SELECT new.title, new.ord FROM
(SELECT movie.title AS t, actor.name, casting.ord AS o
  FROM movie
  JOIN casting
     ON movie.id = casting.movieid
  JOIN actor
     ON casting.actorid = actor.id AND actor.name = 'Julie Andrews') AS new
WHERE new.ord=1
