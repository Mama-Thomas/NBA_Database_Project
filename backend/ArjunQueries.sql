-- top pg ppg
-- SELECT p.Fname, p.Lname, MAX(s.PPG) as most_ppg
-- FROM PLAYER p
-- JOIN STAT s ON p.playerID = s.statPlayerID
-- WHERE p.position = 'PG';
-- Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'nba.p.Fname'; this is incompatible with sql_mode=only_full_group_by

-- winnigest coach
-- SELECT MAX(`win%`) as top_team, c.coachFname, c.coachLname, t.teamName
-- FROM TEAM t, COACH c;
-- Error Code: 1140. In aggregated query without GROUP BY, expression #2 of SELECT list contains nonaggregated column 'nba.c.coachFname'; this is incompatible with sql_mode=only_full_group_by

-- most popular position
SELECT position, COUNT(*) as total_players
FROM PLAYER
GROUP BY position
ORDER BY total_players DESC
LIMIT 1;
-- no of players per position
SELECT t.teamName,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'PG' AND tname = t.teamName) AS no_of_pg,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'SG' AND tname = t.teamName) AS no_of_sg,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'G' AND tname = t.teamName) AS no_of_g,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'SF' AND tname = t.teamName) AS no_of_sf,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'PF' AND tname = t.teamName) AS no_of_pf,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'F' AND tname = t.teamName) AS no_of_f,
    (SELECT COUNT(*) FROM PLAYER WHERE position = 'C' AND tname = t.teamName) AS no_of_c
FROM TEAM t;
-- most efficient player by position by team
SELECT p.Fname, p.Lname, p.tname, p.position, s.`3P%`
FROM PLAYER p
JOIN STAT s ON p.playerID = s.statPlayerID
WHERE (p.position, p.tname, s.`3P%`) IN (
  SELECT position, tname, MAX(`3P%`)
  FROM PLAYER p
  JOIN STAT s ON p.playerID = s.statPlayerID
  GROUP BY position, tname
)
ORDER BY tname, position;