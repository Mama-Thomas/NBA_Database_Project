-- player whose ppg is the highest in the Atlanta Hawks --
SELECT p.Fname, p.Lname
FROM PLAYER p
JOIN TEAM t ON p.tname = t.teamName
JOIN STAT s ON p.playerID = s.statPlayerID
WHERE t.teamName = 'Hawks'
ORDER BY s.PPG DESC
LIMIT 1;

-- List the team with most championships--
-- SELECT h.teamRecord, MAX(h.championships) AS max_championships
-- FROM RECORD h
-- GROUP BY h.teamRecord
-- ORDER BY max_championships DESC
-- LIMIT 1;

-- List the five teams with the highest offrtg:
SELECT t.teamName, h.offRtg
FROM TEAM t
JOIN RECORD h ON t.teamName = h.teamRecord
ORDER BY h.offRtg DESC
LIMIT 5;

-- List the name of the most efficient top scorer: --
SELECT p.Fname, p.Lname
FROM PLAYER p
JOIN STAT s ON p.playerID = s.statPlayerID
WHERE (s.PPG + s.`3P%` + s.`FG%`) = 
  (SELECT MAX(s2.PPG + s2.`3P%` + s2.`FG%`) FROM STAT s2);

-- Best defensive player on the best defensive team --
SELECT p.Fname, p.Lname, (s.BPG + s.SPG) AS combined_bpg_spg
FROM PLAYER p
INNER JOIN TEAM t ON p.tname = t.teamName
INNER JOIN RECORD r ON t.teamName = r.teamRecord
INNER JOIN STAT s ON p.playerId = s.statPlayerID
WHERE r.defRtg = (SELECT MAX(defRtg) FROM RECORD)
ORDER BY combined_bpg_spg DESC
LIMIT 1;