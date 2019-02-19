-- JOIN and UEFA EURO 2012

-- 1
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2
  FROM game
  WHERE id=1012

-- 3
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM goal
  JOIN game
  ON goal.matchid = game.id
 WHERE goal.teamid = 'GER'
 ;

 -- 4
 SELECT game.team1, game.team2, goal.player
  FROM goal
  JOIN game
  ON goal.matchid = game.id
 WHERE goal.player LIKE 'Mario%'
 ;

 -- 5
 SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
  FROM goal
  JOIN eteam
  ON goal.teamid = eteam.id
 WHERE gtime<=10
 ;

 -- 6
 SELECT game.mdate, eteam.teamname
  FROM game
  JOIN eteam
  ON game.team1 = eteam.id
  WHERE eteam.coach = 'Fernando Santos'
;

-- 7
SELECT goal.player
  FROM goal
  JOIN game
  ON goal.matchid = game.id
  WHERE game.stadium = 'National Stadium, Warsaw'
;

-- 8 
