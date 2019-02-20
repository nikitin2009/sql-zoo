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
SELECT DISTINCT goal.player
  FROM goal
  JOIN game
  ON goal.matchid = game.id AND goal.teamid  != 'GER'

   WHERE  game.team1 = 'GER'
   OR game.team2 = 'GER'
;

-- 9
SELECT eteam.teamname, COUNT(goal.matchid)
  FROM eteam
  JOIN goal ON
  eteam.id = goal.teamid
  group BY eteam.teamname
;

-- 10
SELECT game.stadium, COUNT(goal.matchid)
  FROM game
  JOIN goal ON
  game.id = goal.matchid
  group BY game.stadium
;

-- 11
SELECT game.id, game.mdate, COUNT(goal.matchid)

  FROM game
  JOIN goal ON goal.matchid = game.id
  WHERE (team1 = 'POL' OR team2 = 'POL')

GROUP BY game.id, game.mdate
;

-- 12
SELECT game.id, game.mdate, COUNT(goal.matchid)

  FROM game
  JOIN goal 
  ON goal.matchid = game.id AND goal.teamid = 'GER'
  WHERE (team1 = 'GER' OR team2 = 'GER')

GROUP BY game.id, game.mdate

-- 13
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON matchid = id
GROUP BY mdate,matchid,team1,team2
ORDER BY mdate, matchid, team1, team2, teamid -- Needs working