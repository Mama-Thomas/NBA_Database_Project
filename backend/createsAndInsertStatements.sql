-- ARJUN ANAND, MAMA THOMAS


CREATE TABLE COACH (
  coachId SMALLINT NOT NULL UNIQUE,
  coachFname VARCHAR(50) NOT NULL,
  coachLname VARCHAR(50) NOT NULL,
  experience TINYINT NOT NULL,
  age TINYINT NOT NULL,
  `win%` DECIMAL(5,3) NOT NULL,
  PRIMARY KEY (coachID)
  );c

CREATE TABLE MANAGER (
  gmId SMALLINT NOT NULL UNIQUE,
  gmFname VARCHAR(50) NOT NULL,
  gmLname VARCHAR(50) NOT NULL,
  experienceinRole TINYINT NOT NULL,
  age TINYINT NOT NULL,
  PRIMARY KEY (gmId)
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

  CREATE TABLE TEAM (
  primaryColor VARCHAR(50) NOT NULL,
  teamName VARCHAR(50) NOT NULL UNIQUE,
  pace DECIMAL(4,1) NOT NULL,
  mascot VARCHAR(50) UNIQUE DEFAULT 'NONE',
  teamCoach SMALLINT NOT NULL UNIQUE,
  teamArena VARCHAR(50) NOT NULL UNIQUE,
  teamManager SMALLINT NOT NULL UNIQUE,
  FOREIGN KEY(teamCoach) REFERENCES COACH(coachID) ON DELETE CASCADE,
  FOREIGN KEY(teamArena) REFERENCES ARENA(arenaName) ON DELETE CASCADE,
  FOREIGN KEY(teamManager) REFERENCES MANAGER(gmId) ON DELETE CASCADE,
  PRIMARY KEY(teamName)
  );

  CREATE TABLE MANAGER (
  gmId SMALLINT NOT NULL UNIQUE,
  gmFname VARCHAR NOT NULL,
  gmLname VARCHAR NOT NULL,
  experienceinRole TINYINT NOT NULL,
  age TINYINT NOT NULL,
  PRIMARY KEY (gmId)
  );

  CREATE TABLE ARENA (
  arenaName VARCHAR(50) NOT NULL UNIQUE,
  occupancy MEDIUMINT NOT NULL,
  arenaCity VARCHAR(50) NOT NULL,
  arenaState VARCHAR(50) NOT NULL,
  PRIMARY KEY(arenaName)
  );

    INSERT INTO MANAGER VALUES(null, 'Sean','Marks',8,47);--violates entity constraint

INSERT INTO TEAM VALUES ('blue','Dallas Mavericks',48 ,'Champ', 302 ,'American Airlines Center', 401);
INSERT INTO TEAM VALUES ('wine','Cleveland Cavaliers',100.8 ,'MoonDog',307,'Rocket Mortgage FieldHouse', 408);
INSERT INTO TEAM VALUES ('navy blue','Memphis Grizzlies',103.5 ,'Grizz', 306,'FedExForum', 409);
INSERT INTO TEAM VALUES ('blue red white','Philadelphia Sixers',101.2 ,'Franklin', 303, 'Wells Fargo Center', 402);
INSERT INTO TEAM VALUES ('black red white','Portland Trail Blazers',100.2 ,'Blaze the Trail Cat', 301,'Moda Center', 403);
INSERT INTO TEAM VALUES ('green cream','Milwaukee Bucks',104.0 ,'Bango the Buck', 304,'Fiserv Forum', 404);
INSERT INTO TEAM VALUES ('purple gold','Los Angeles Lakers',101.6 ,NULL, 309, 'Staples Center',407);
INSERT INTO TEAM VALUES ('green white','Boston Celtics',100.9 ,'Lucky the Leprechaun',310, 'TD Garden', 406);
INSERT INTO TEAM VALUES ('black white','Brooklyn Nets',102.9 ,'Brookly net', 308,'Barclays Center', 410);
INSERT INTO TEAM VALUES ('blue orange','Oklahoma City Thunder',99.6 ,'Rumble the Bison', 305,'Chesapeake Energy Arena', 405);
