CREATE TABLE PLAYER (
  playerId SMALLINT NOT NULL UNIQUE,
  Fname VARCHAR(20) NOT NULL,
  Lname VARCHAR(20) NOT NULL,
  position VARCHAR(2) CHECK (position IN ('PG','SG','SF','PF','C')) NOT NULL,
  age TINYINT NOT NULL,
  number TINYINT NOT NULL,
  height TINYINT NOT NULL,
  weight SMALLINT NOT NULL,
  draftYear SMALLINT NOT NULL,
  draftPick SMALLINT NOT NULL,
  draftRound TINYINT CHECK (draftRound IN (1,2)), 
  PRIMARY KEY (playerID)
  );

CREATE TABLE AWARD (
  awardYear YEAR NOT NULL,
  awardName VARCHAR(4) CHECK(awardName IN ('ROTY', 'DPOY', 'SOTY', 'COTY','MVP', 'MIP')) NOT NULL,
  awardId SMALLINT NOT NULL,
  PRIMARY KEY(awardId),
  FOREIGN KEY(awardId) REFERENCES PLAYER(playerId) ON DELETE CASCADE
  );

CREATE TABLE COACH (
  coachId SMALLINT NOT NULL UNIQUE,
  coachFname VARCHAR(20) NOT NULL,
  coachLname VARCHAR(20) NOT NULL,
  experience TINYINT NOT NULL,
  age TINYINT NOT NULL,
  winP DECIMAL(5,3) NOT NULL,
  PRIMARY KEY (coachId)
  );

CREATE TABLE MANAGER (
  gmId SMALLINT NOT NULL UNIQUE,
  gmFname VARCHAR(20) NOT NULL,
  gmLname VARCHAR(20) NOT NULL,
  experienceinRole TINYINT NOT NULL,
  age TINYINT NOT NULL,
  PRIMARY KEY (gmId)
  );

CREATE TABLE STAT (
  statPlayerID SMALLINT NOT NULL UNIQUE,
  PPG DECIMAL(3,1) NOT NULL,
  APG DECIMAL(3,1) NOT NULL,
  RPG DECIMAL(3,1) NOT NULL,
  SPG DECIMAL(3,1) NOT NULL,
  BPG DECIMAL(3,1) NOT NULL,
  3Pp DECIMAL(3,1) NOT NULL,
  FGp DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (statPlayerID),
  FOREIGN KEY(statPlayerID) REFERENCES PLAYER(playerID) ON DELETE CASCADE
  );

CREATE TABLE ARENA (
  arenaName VARCHAR(20) NOT NULL UNIQUE,
  occupancy MEDIUMINT NOT NULL,
  arenaCity VARCHAR(20) NOT NULL,
  arenaState VARCHAR(20) NOT NULL,
  PRIMARY KEY(arenaName)
  );
  CREATE TABLE TEAM (
  primaryColor VARCHAR(10) NOT NULL,
  teamName VARCHAR(20) NOT NULL UNIQUE,
  pace DECIMAL(4,1) NOT NULL,
  mascot VARCHAR(20) UNIQUE DEFAULT 'NONE',
  teamCoach SMALLINT NOT NULL UNIQUE,
  teamArena VARCHAR(20) NOT NULL UNIQUE,
  FOREIGN KEY(teamCoach) REFERENCES COACH(coachId) ON DELETE CASCADE,
  FOREIGN KEY(teamArena) REFERENCES ARENA(arenaName) ON DELETE CASCADE,
  PRIMARY KEY(teamName)
  );

CREATE TABLE RECORD (
  defRtg DECIMAL(4,1) NOT NULL,
  offRtg DECIMAL(4,1) NOT NULL,
  homeWins TINYINT NOT NULL,
  homeLosses TINYINT NOT NULL,
  awayWins TINYINT NOT NULL,
  awayLosses TINYINT NOT NULL,
  teamRecord VARCHAR(50) NOT NULL UNIQUE,
  FOREIGN KEY(teamRecord) REFERENCES TEAM(teamName) ON DELETE CASCADE,
  PRIMARY KEY(teamRecord)
  );

