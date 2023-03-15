
CREATE TABLE COACH (
  coachId SMALLINT NOT NULL UNIQUE,
  coachFname VARCHAR(50) NOT NULL,
  coachLname VARCHAR(50) NOT NULL,
  experience TINYINT NOT NULL,
  age TINYINT NOT NULL,
  `win%` DECIMAL(5,3) NOT NULL,
  PRIMARY KEY (coachId)
  );

CREATE TABLE MANAGER (
  gmId SMALLINT NOT NULL UNIQUE,
  gmFname VARCHAR(50) NOT NULL,
  gmLname VARCHAR(50) NOT NULL,
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

CREATE TABLE TEAM (
  primaryColor VARCHAR(50) NOT NULL,
  teamName VARCHAR(50) NOT NULL UNIQUE,
  pace DECIMAL(4,1) NOT NULL,
  mascot VARCHAR(50) NOT NULL,
  teamCoach SMALLINT NOT NULL UNIQUE,
  teamArena VARCHAR(50) NOT NULL,
  teamManager SMALLINT NOT NULL UNIQUE,
  FOREIGN KEY(teamCoach) REFERENCES COACH(coachId) ON DELETE CASCADE,
  FOREIGN KEY(teamArena) REFERENCES ARENA(arenaName) ON DELETE CASCADE,
  FOREIGN KEY(teamManager) REFERENCES MANAGER(gmId) ON DELETE CASCADE,
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
CREATE TABLE PLAYER (
  playerId SMALLINT NOT NULL UNIQUE,
  Fname VARCHAR(50) NOT NULL,
  Lname VARCHAR(50) NOT NULL,
  position VARCHAR(2) CHECK (position IN ('PG','SG','G','SF','PF','F','C')) NOT NULL,
  age TINYINT NOT NULL,
  number TINYINT NOT NULL,
  height TINYINT NOT NULL,
  weight SMALLINT NOT NULL,
  draftYear YEAR NOT NULL,
  draftPick SMALLINT NOT NULL,
  draftRound TINYINT CHECK (draftRound IN (1,2)),
  tname VARCHAR(50) NOT NULL,
  FOREIGN KEY(tname) REFERENCES TEAM(teamName) ON DELETE CASCADE,
  PRIMARY KEY (playerID)
  );
  
  CREATE TABLE STAT (
  statPlayerID SMALLINT NOT NULL UNIQUE,
  PPG DECIMAL(3,1) NOT NULL,
  APG DECIMAL(3,1) NOT NULL,
  RPG DECIMAL(3,1) NOT NULL,
  SPG DECIMAL(3,1) NOT NULL,
  BPG DECIMAL(3,1) NOT NULL,
  `3P%` DECIMAL(3,1) NOT NULL,
  `FG%` DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (statPlayerID),
  FOREIGN KEY(statPlayerID) REFERENCES PLAYER(playerID) ON DELETE CASCADE
  );

CREATE TABLE AWARD (
  awardYear YEAR NOT NULL,
  awardName VARCHAR(4) CHECK(awardName IN ('ROTY', 'DPOY', 'SOTY', 'COTY','MVP', 'MIP')) NOT NULL,
  awardId SMALLINT NOT NULL,
  PRIMARY KEY(awardId),
  FOREIGN KEY(awardId) REFERENCES PLAYER(playerId) ON DELETE CASCADE
  );
  
INSERT INTO COACH VALUES(301, 'Chauncey','Billups',1,46,.386);
INSERT INTO COACH VALUES(302,'Jason','Kidd',6,49,.516);
INSERT INTO COACH VALUES(303,'Doc', 'Rivers',23,61,.589);
INSERT INTO COACH VALUES(304, 'Mike', 'Budenholzer',9,53,.602);
INSERT INTO COACH VALUES(305,'Mark', 'Daigneault',2,37,.346);
INSERT INTO COACH VALUES(306, 'Joe', 'Mazzulla',0,34,.687);
INSERT INTO COACH VALUES(307, 'Tom', 'Thibodeau',10,65,.573);
INSERT INTO COACH VALUES(308, 'Nick', 'Nurse',4,55,.581);
INSERT INTO COACH VALUES(309, 'Billy', 'Donovan', 7,57,.565);
INSERT INTO COACH VALUES(310, 'J.B.', 'Bickerstaff',6,43,.441);
INSERT INTO COACH VALUES(311, 'Dwane', 'Casey',13,65,.469);
INSERT INTO COACH VALUES(312, 'Rick','Carlisle',20,63,.532);
INSERT INTO COACH VALUES(313, 'Quin', 'Snyder',8,56,.583);
INSERT INTO COACH VALUES(314, 'Steve', 'Clifford',7,61,.445);
INSERT INTO COACH VALUES(315, 'Erik', 'Spoelstra',14,52,.589);
INSERT INTO COACH VALUES(316, 'Jamahi', 'Mosley',1,44,.331);
INSERT INTO COACH VALUES(317, 'Wes', 'Unseld',1,47,.446);
INSERT INTO COACH VALUES(318, 'Michael', 'Malone',9,51,.549);
INSERT INTO COACH VALUES(319, 'Chris', 'Finch',2,53,.505);
INSERT INTO COACH VALUES(320, 'Jacque', 'Vaughn',0,48,.352);
INSERT INTO COACH VALUES(321, 'Will', 'Hardy',0,35,.470);
INSERT INTO COACH VALUES(322, 'Steve', 'Kerr',8,57,.666);
INSERT INTO COACH VALUES(323, 'Tyronn', 'Lue',6,45,.582);
INSERT INTO COACH VALUES(324, 'Darvin', 'Ham',0,49,.485);
INSERT INTO COACH VALUES(325, 'Monty', 'Williams',8,51,.523);
INSERT INTO COACH VALUES(326, 'Mike', 'Brown',0,53,.614);
INSERT INTO COACH VALUES(327, 'Stephen', 'Silas',2,49,.237);
INSERT INTO COACH VALUES(328, 'Taylor', 'Jenkins',3,38,.570);
INSERT INTO COACH VALUES(329, 'Willie', 'Green',1,41,.459);
INSERT INTO COACH VALUES(330, 'Gregg', 'Popovich',26,74,.645);

INSERT INTO MANAGER VALUES(401, 'Nico', 'Harrison',2,50);
INSERT INTO MANAGER VALUES(402, 'Elton', 'Brand',5,43);
INSERT INTO MANAGER VALUES(403, 'Joe', 'Cronin',2,30);
INSERT INTO MANAGER VALUES(404, 'Jon' , 'Horst',7,39);
INSERT INTO MANAGER VALUES(405, 'Sam','Presti',16,45);
INSERT INTO MANAGER VALUES(406, 'Brad','Stevens',1,46);
INSERT INTO MANAGER VALUES(407, 'Rob','Pelinka',7,53);
INSERT INTO MANAGER VALUES(408, 'Mike','Gansey',1,40);
INSERT INTO MANAGER VALUES(409, 'Zachary', 'Kleiman',4,35);
INSERT INTO MANAGER VALUES(410, 'Sean','Marks',8,47);
INSERT INTO MANAGER VALUES(411, 'Nico', 'Harrison',2,50);
INSERT INTO MANAGER VALUES(412, 'Calvin', 'Booth',5,43);
INSERT INTO MANAGER VALUES(413, 'Chad', 'Buchanan',2,30);
INSERT INTO MANAGER VALUES(414, 'Andy' , 'Elisburg',7,39);
INSERT INTO MANAGER VALUES(415, 'Marc','Eversely',16,45);
INSERT INTO MANAGER VALUES(416, 'Landry','Fields',1,46);
INSERT INTO MANAGER VALUES(417, 'Brian','Wright',4,40);
INSERT INTO MANAGER VALUES(418, 'Mike','Gansey',1,40);
INSERT INTO MANAGER VALUES(419, 'John', 'Hammond',4,35);
INSERT INTO MANAGER VALUES(420, 'Mitch','Kupchak',8,47);
INSERT INTO MANAGER VALUES(421, 'Trajan', 'Langdon',2,50);
INSERT INTO MANAGER VALUES(422, 'Monte', 'McNair',5,43);
INSERT INTO MANAGER VALUES(423, 'Bob', 'Myers',11,30);
INSERT INTO MANAGER VALUES(424, 'Scott' , 'Perry',7,39);
INSERT INTO MANAGER VALUES(425, 'Tommy','Sheppard',16,45);
INSERT INTO MANAGER VALUES(426, 'Rafael','Stone',1,46);
INSERT INTO MANAGER VALUES(427, 'Troy','Weaver',4,53);
INSERT INTO MANAGER VALUES(428, 'Bobby','Webster',6,38);
INSERT INTO MANAGER VALUES(429, 'Michael', 'Winger',5,43);
INSERT INTO MANAGER VALUES(430, 'Justin','Zanik',5,48);

 
INSERT INTO ARENA VALUES ('United Center',20917,'Chicago','Illinois');
INSERT INTO ARENA VALUES('Wells Fargo Center',20478,'Philadelphia','Pennsylvania');
INSERT INTO ARENA VALUES('Capital One Arena',20356,'Washington', 'D.C.');
INSERT INTO ARENA VALUES('Little Caesars Arena',20332,'Detroit', 'Michigan');
INSERT INTO ARENA VALUES('Madison Square Garden',19812, 'New York City', 'New York');
INSERT INTO ARENA VALUES('Scotiabank Arena',19800,'Toronto', 'Ontario');
INSERT INTO ARENA VALUES('FTX Arena',19600,'Miami', 'Florida');
INSERT INTO ARENA VALUES('Ball Arena',19520, 'Denver', 'Colorado');
INSERT INTO ARENA VALUES('Rocket Mortgage FieldHouse',19432, 'Cleveland', 'Ohio');
INSERT INTO ARENA VALUES('Moda Center',19393,'Portland', 'Oregon');
INSERT INTO ARENA VALUES('American Airlines Center',19200,'Dallas', 'Texas');
INSERT INTO ARENA VALUES('Spectrum Center',19077,'Charlotte', 'North Carolina');
INSERT INTO ARENA VALUES('Crypto.com Arena',19060,'Los Angeles', 'California');
INSERT INTO ARENA VALUES('Amway Center',18846,'Orlando', 'Florida');
INSERT INTO ARENA VALUES('Target Center',18798, 'Minneapolis', 'Minnesota');
INSERT INTO ARENA VALUES('TD Garden',18624,'Boston', 'Massachusetts');
INSERT INTO ARENA VALUES('Footprint Center',18422,'Phoenix', 'Arizona');
INSERT INTO ARENA VALUES('AT&T Center',18418,'San Antonio', 'Texas');
INSERT INTO ARENA VALUES('Vivint Arena',18306,'Salt Lake City', 'Utah');
INSERT INTO ARENA VALUES('Paycom Center',18203, 'Oklahoma City', 'Oklahoma');
INSERT INTO ARENA VALUES('FedExForum',18119,'Memphis', 'Tennessee');
INSERT INTO ARENA VALUES('Chase Center',18064,'San Francisco', 'California');
INSERT INTO ARENA VALUES('Toyota Center',18055,'Houston','Texas');
INSERT INTO ARENA VALUES('Bankers Life Fieldhouse',17923,'Indianapolis','Indiana');
INSERT INTO ARENA VALUES('Barclays Center',17732,'Brooklyn','New York');
INSERT INTO ARENA VALUES('Golden 1 Center',17608, 'Sacramento','California');
INSERT INTO ARENA VALUES('Fiserv Forum',17341,'Milwaukee', 'Wisconsin');
INSERT INTO ARENA VALUES('Smoothie King Center',16867,'New Orelans', 'Lousiana');
INSERT INTO ARENA VALUES('State Farm Arena',16600,'Atlanta', 'Georgia');

INSERT INTO TEAM VALUES('red','Bulls',100.4,'Benny the Bull',309,'United Center',401);
INSERT INTO TEAM VALUES('blue','Sixers',99.6,'Hip Hop',303,'Wells Fargo Center',402);
INSERT INTO TEAM VALUES('blue','Wizards',99.9,'G-Wiz',317,'Capital One Arena',403);
INSERT INTO TEAM VALUES('red','Pistons',102.1,'Hooper',311,'Little Caesars Arena',404);
INSERT INTO TEAM VALUES('orange','Knicks',99.4,'None',307,'Madison Square Garden',405);
INSERT INTO TEAM VALUES('red','Raptors',99.1,'  The Raptor',308,'Scotiabank Arena',406);
INSERT INTO TEAM VALUES('pink','Heat',98.2,'Burnie',315,'FTX Arena',407);
INSERT INTO TEAM VALUES('yellow','Nuggets',99.9,'Rocky the Mountain Lion',318,'Ball Arena',408);
INSERT INTO TEAM VALUES('brown','Cavs',97.1,'Moon Dog',310,'Rocket Mortgage FieldHouse',409);
INSERT INTO TEAM VALUES('teal','Blazers',99.6,'Blaze the Trail Cat',301,'Moda Center',410);
INSERT INTO TEAM VALUES('blue','Mavericks',95.4,'Champ',302,'American Airlines Center',411);
INSERT INTO TEAM VALUES('cyan','Hornets',94.3,'Hugo the Hornet',314,'Spectrum Center',412);
INSERT INTO TEAM VALUES('purple','Lakers',98.2,'None',324,'Crypto.com Arena',413);
INSERT INTO TEAM VALUES('blue','Magic',95.4,'Stuff the Magic Dragon',316,'Amway Center',414);
INSERT INTO TEAM VALUES('neon','Timberwolves',100.5,'Crunch the Wolf',319,'Target Center',415);
INSERT INTO TEAM VALUES('green','Celtics',103.7,'Lucky the Leprechaun',306,'TD Garden',416);
INSERT INTO TEAM VALUES('purple','Suns',100.1,'Go the Gorilla',325,'Footprint Center',417);
INSERT INTO TEAM VALUES('white','Spurs',100.8,' Coyote',330,'AT&T Center',418);
INSERT INTO TEAM VALUES('orange','Jazz',102.3,'Jazz Bear',321,'Vivint Arena',419);
INSERT INTO TEAM VALUES('blue','Thunder',101.7,'Rumble the Bison',305,'Paycom Center',420);
INSERT INTO TEAM VALUES('cyan','Grizzlies',98.8,'Grizz',328,'FedExForum',421);
INSERT INTO TEAM VALUES('yellow','Warriors',99.5,'None',322,'Chase Center',422);
INSERT INTO TEAM VALUES('red','Rockets',100.4,'Clutch the Bear',327,'Toyota Center',423);
INSERT INTO TEAM VALUES('yellow','Pacers',100.7,'Boomer',312,'Bankers Life Fieldhouse',424);
INSERT INTO TEAM VALUES('black','Nets',97.4,'None',320,'Barclays Center',425);
INSERT INTO TEAM VALUES('purple','Kings',103.6,'Slamson the Lion',326,'Golden 1 Center',426);
INSERT INTO TEAM VALUES('green','Bucks',99.5,'Bango',304,'Fiserv Forum',427);
INSERT INTO TEAM VALUES('brown','Pelicans',99.7,'Pierre the Pelican',329,'Smoothie King Center',428);
INSERT INTO TEAM VALUES('red','Hawks',101.6,'Harry the Hawk',313,'State Farm Arena',429);
INSERT INTO TEAM VALUES('white','Clippers',102.4,'Chuck the Condor',323,'Crypto.com Arena',430);

INSERT INTO RECORD VALUES(104.1, 106.3, 16, 10, 13, 14, 'Bulls');
INSERT INTO RECORD VALUES (106.5, 109.6, 18, 9, 13, 14, 'Sixers');
INSERT INTO RECORD VALUES (104.5, 109.1, 13, 17, 12, 16, 'Wizards');
INSERT INTO RECORD VALUES (108.4, 102.4, 12, 18, 9, 20, 'Pistons');
INSERT INTO RECORD VALUES (109.2, 108.3, 15, 14, 12, 15, 'Knicks');
INSERT INTO RECORD VALUES (108.7, 109.2, 14, 16, 13, 14, 'Raptors');
INSERT INTO RECORD VALUES (106.9, 107.0, 16, 10, 12, 16, 'Heat');
INSERT INTO RECORD VALUES (111.0, 105.9, 17, 10, 16, 12, 'Nuggets');
INSERT INTO RECORD VALUES (105.2, 111.6, 11, 18, 10, 17, 'Cavs');
INSERT INTO RECORD VALUES (111.5, 113.3, 14, 16, 13, 14, 'Blazers');
INSERT INTO RECORD VALUES (107.5, 106.1, 14, 16, 10, 19, 'Mavericks');
INSERT INTO RECORD VALUES (105.6, 112.7, 12, 16, 10, 17, 'Hornets');
INSERT INTO RECORD VALUES (107.1, 105.0, 17, 11, 12, 16, 'Lakers');
INSERT INTO RECORD VALUES (106.3, 107.9, 9, 21, 10, 17, 'Magic');
INSERT INTO RECORD VALUES (107.4, 110.4, 9, 20, 8, 22, 'Timberwolves');
INSERT INTO RECORD VALUES (110.4, 107.4, 16, 11, 14, 14, 'Celtics');
INSERT INTO RECORD VALUES (108.7, 106.3, 21, 6, 16, 13, 'Suns');
INSERT INTO RECORD VALUES (106.1, 107.7, 14, 16, 12, 15, 'Spurs');
INSERT INTO RECORD VALUES (109.6, 111.5, 13, 16, 11, 18, 'Jazz');
INSERT INTO RECORD VALUES (105.2, 112.9, 13, 16, 9, 20, 'Thunder');
INSERT INTO RECORD VALUES (108.3, 108.7, 11, 17, 12, 16, 'Grizzlies');
INSERT INTO RECORD VALUES (110.2, 109.0, 16, 13, 14, 14, 'Warriors');
INSERT INTO RECORD VALUES (111.5, 114.6, 14, 16, 12, 15, 'Rockets');
INSERT INTO RECORD VALUES (107.5, 105.7, 18, 10, 14, 14, 'Pacers');
INSERT INTO RECORD VALUES (109.3, 111.9, 13, 15, 14, 14, 'Nets');
INSERT INTO RECORD VALUES (105.3, 111.3, 11, 17, 10, 17, 'Kings');
INSERT INTO RECORD VALUES (111.7, 105.5, 14, 15, 14, 14, 'Bucks');
INSERT INTO RECORD VALUES (107.4, 111.2, 12, 17, 10, 19, 'Pelicans');
INSERT INTO RECORD VALUES (111.6, 109.2, 15, 14, 13, 14, 'Hawks');
INSERT INTO RECORD VALUES (107.9, 106.4, 17, 10, 12, 16, 'Clippers');


INSERT INTO PLAYER VALUES (1,'Luka','Doncic','PG',24,77,79,230,2018,3,1,'Mavericks');
INSERT INTO PLAYER VALUES (2,'Joel','Embiid','C',28,21,84,280,2014,3,1,'Sixers');
INSERT INTO PLAYER VALUES (3,'Damian','Lillard','PG',32,0,74,195,2012,6,1,'Blazers');
INSERT INTO PLAYER VALUES (4,'Giannis','Antetokounmpo','PF',28,34,83,242,2013,15,1,'Bucks');
INSERT INTO PLAYER VALUES (5,'Shai-Gilgeous','Alexander','PG',24,2,78,195,2018,11,1,'Thunder');
INSERT INTO PLAYER VALUES (6,'Jayson','Tatum','SF',25,0,80,210,2017,3,1,'Celtics');
INSERT INTO PLAYER VALUES (7,'Lebron','James','SF',38,23,81,250,2003,1,1,'Lakers');
INSERT INTO PLAYER VALUES (8,'Donovan', 'Mitchell','SG',26,45,73,215,2017,13,1,'Cavs');
INSERT INTO PLAYER VALUES (9,'Ja','Morant','PG',23,12,75,174,2019,2,1,'Grizzlies');
INSERT INTO PLAYER VALUES (10,'Kyrie','Irving','PG',30,2,74,195,2011,1,1,'Mavericks');

	

INSERT INTO PLAYER VALUES (11,'Ja','MorantMEM','PG',24,77,79,230,2018,3,1,'Mavericks');
INSERT INTO PLAYER VALUES (12,'Trae','Young','PG',28,21,84,280,2014,3,1,'Sixers');
INSERT INTO PLAYER VALUES (13,'Jaylen','Brown','SG',32,0,74,195,2012,6,1,'Blazers');
INSERT INTO PLAYER VALUES (14,'DeAaron','Fox','PG',28,34,83,242,2013,15,1,'Bucks');
INSERT INTO PLAYER VALUES (15,'Laurie','Markkanen','PF',24,2,78,195,2018,11,1,'Thunder');
INSERT INTO PLAYER VALUES (16,'Julius',' Randle','PF',25,0,80,210,2017,3,1,'Celtics');
INSERT INTO PLAYER VALUES (17,'	DeMar','DeRozan','SF',38,23,81,250,2003,1,1,'Lakers');
INSERT INTO PLAYER VALUES (18,'Zach', 'LaVine','SG',26,45,73,215,2017,13,1,'Cavs');
INSERT INTO PLAYER VALUES (19,'Anthony','Edwards','PG',23,12,75,174,2019,2,1,'Grizzlies');
INSERT INTO PLAYER VALUES (20,'Pascal','Siakam','PF',30,2,74,195,2011,1,1,'Mavericks');


INSERT INTO PLAYER VALUES (21, 'Jalen', 'Brunson', 'PG', 26, 13, 74, 190, 2018, 33, 2, 'Knicks');
INSERT INTO PLAYER VALUES(22, 'Paul', 'George', 'SF', 31, 13, 81, 220, 2010, 10, 1, 'Clippers');
INSERT INTO PLAYER VALUES(23, 'Kristaps', 'Porzingis', 'PF', 26, 6, 87, 240, 2015, 4, 1, 'Wizards');
INSERT INTO PLAYER VALUES(24, 'Klay', 'Thompson', 'SG', 32, 11, 79, 215, 2011, 11, 1, 'Warriors');
INSERT INTO PLAYER VALUES(25, 'Jimmy', 'Butler', 'SF', 32, 22, 79, 230, 2011, 30, 1, 'Heat');
INSERT INTO PLAYER VALUES(26, 'Darius', 'Garland', 'PG', 21, 10, 73, 192, 2019, 5, 1, 'Cavs');
INSERT INTO PLAYER VALUES(27, 'James', 'Harden', 'SG', 32, 13, 77, 220, 2009, 3, 1, 'Sixers');
INSERT INTO PLAYER VALUES(28, 'Jalen', 'Green', 'SG', 20, 0, 78, 180, 2021, 2, 1, 'Rockets');
INSERT INTO PLAYER VALUES(29, 'Keldon', 'Johnson', 'SF', 22, 44, 78, 220, 2019, 29, 1, 'Spurs');
INSERT INTO PLAYER VALUES(30, 'Bojan', 'Bogdanovic', 'SF', 32, 44, 80, 218, 2011, 31, 2, 'Pistons');
INSERT INTO PLAYER VALUES(31, 'Kyle', 'Kuzma', 'PF', 26, 0, 80, 220, 2017, 27, 1, 'Wizards');
INSERT INTO PLAYER VALUES(32, 'Terry', 'Rozier', 'PG', 27, 12, 74, 190, 2015, 16, 1, 'Hornets');
INSERT INTO PLAYER VALUES(33, 'Bam', 'Adebayo', 'C', 24, 13, 81, 255, 2017, 14, 1, 'Heat');
INSERT INTO PLAYER VALUES(34, 'CJ', 'McCollum', 'SG', 30, 3, 75, 190, 2013, 10, 1, 'Pelicans');
INSERT INTO PLAYER VALUES(35, 'Anfernee', 'Simons', 'PG', 22, 1, 75, 181, 2018, 24, 1, 'Blazers');
INSERT INTO PLAYER VALUES(36, 'Dejounte', 'Murray', 'PG', 25, 5, 77, 180, 2016, 29, 1, 'Hawks');
   
   
INSERT INTO PLAYER VALUES(37, 'Jordan', 'Clarkson', 'SG', 29, 00, 75, 194, 2014, 46, 2, 'Jazz');
INSERT INTO PLAYER VALUES(38, 'Jordan', 'Poole', 'SG', 22, 3, 76, 194, 2019, 28, 1, 'Warriors');
INSERT INTO PLAYER VALUES(39, 'Jerami', 'Grant', 'SF', 27, 9, 81, 210, 2014, 39, 2, 'Blazers');
INSERT INTO PLAYER VALUES(40, 'Tyrese', 'Haliburton', 'PG', 21, 0, 78, 175, 2020, 12, 1, 'Pacers');
INSERT INTO PLAYER VALUES(41, 'Tyler', 'Herro', 'SG', 22, 14, 77, 200, 2019, 13, 1, 'Heat');
INSERT INTO PLAYER VALUES(42, 'Tyrese', 'Maxey', 'PG', 20, 0, 75, 200, 2020, 21, 1, 'Sixers');
INSERT INTO PLAYER VALUES(43, 'Jamal', 'Murray', 'PG', 24, 27, 76, 215, 2016, 7, 1, 'Nuggets');
INSERT INTO PLAYER VALUES(44, 'Paolo', 'Banchero', 'PF', 18, 5, 80, 250, 2022, 1, 1, 'Magic');
INSERT INTO PLAYER VALUES(45, 'Jrue', 'Holiday', 'PG', 31, 21, 75, 205, 2009, 17, 1, 'Bucks');
INSERT INTO PLAYER VALUES(46, 'RJ', 'Barrett', 'SF', 21, 9, 78, 214, 2019, 3, 1, 'Knicks');


INSERT INTO PLAYER VALUES(47, 'Fred', 'VanVleet', 'PG', 27, 23, 72, 197, 2016, 2, 1, 'Raptors');
INSERT INTO PLAYER VALUES(48, 'Domantas', 'Sabonis', 'PF', 25, 11, 81, 240, 2016, 11, 1, 'Kings');
INSERT INTO PLAYER VALUES(49, 'Franz', 'Wagner', 'SF', 20, 22, 81, 220, 2021, 8, 1, 'Magic');
INSERT INTO PLAYER VALUES(50, 'Mikal', 'Bridges', 'SF', 25, 25, 79, 209, 2018, 10, 1, 'Suns');

INSERT INTO PLAYER VALUES(51, 'Deandre', 'Ayton', 'C', 23, 22, 84, 250, 2018, 1, 1, 'Suns');
INSERT INTO PLAYER VALUES(52, 'Gary', 'Trent Jr.', 'SG', 23, 33, 77, 209, 2018, 37, 2, 'Raptors');
INSERT INTO PLAYER VALUES(53, 'Myles', 'Turner', 'C', 25, 33, 83, 250, 2015, 11, 1, 'Pacers');
INSERT INTO PLAYER VALUES(54, 'Spencer', 'Dinwiddie', 'PG', 28, 26, 77, 215, 2014, 38, 2, 'Mavericks');
INSERT INTO PLAYER VALUES(55, 'Nikola', 'Vucevic', 'C', 31, 9, 84, 260, 2011, 16, 1, 'Bulls');
INSERT INTO PLAYER VALUES(56, 'D''Angelo', 'Russell', 'PG', 25, 0, 76, 193, 2015, 2, 1, 'Lakers');
INSERT INTO PLAYER VALUES(57, 'Buddy', 'Hield', 'SG', 28, 24, 76, 220, 2016, 6, 1, 'Pacers');
INSERT INTO PLAYER VALUES(58, 'Michael', 'Porter Jr.', 'SF', 23, 1, 82, 218, 2018, 14, 1, 'Nuggets');


INSERT INTO PLAYER VALUES(59, 'Christian', 'Wood', 'PF', 26, 35, 83, 214, 2015, 3, 2, 'Mavericks');
INSERT INTO PLAYER VALUES(60, 'Jaren', 'Jackson Jr.', 'PF', 22, 13, 83, 242, 2018, 4, 1, 'Grizzlies');
INSERT INTO PLAYER VALUES(61, 'Aaron', 'Gordon', 'PF', 26, 50, 81, 235, 2014, 4, 1, 'Nuggets');
INSERT INTO PLAYER VALUES(62, 'Norman', 'Powell', 'SG', 28, 24, 76, 215, 2015, 46, 2, 'Clippers');
INSERT INTO PLAYER VALUES(63, 'Bennedict', 'Mathurin', 'SF', 19, 23, 78, 200, 2022, 3, 1, 'Pacers');
INSERT INTO PLAYER VALUES(64, 'O.G.', 'Anunoby', 'SF', 24, 3, 79, 232, 2017, 23, 1, 'Raptors');
INSERT INTO PLAYER VALUES(65, 'Josh', 'Giddey', 'PG', 19, 3, 79, 185, 2021, 6, 1, 'Thunder');
INSERT INTO PLAYER VALUES(66, 'Evan', 'Mobley', 'C', 20, 4, 84, 215, 2021, 3, 1, 'Cavs');
INSERT INTO PLAYER VALUES(67, 'Russell', 'Westbrook', 'PG', 33, 0, 75, 200, 2008, 4, 1, 'Clippers');

INSERT INTO PLAYER VALUES(68, 'De''Andre', 'Hunter', 'SF', 24, 12, 80, 225, 2019, 4, 1, 'Hawks');
INSERT INTO PLAYER VALUES(69, 'Jaden', 'Ivey', 'PG', 20, 23, 74, 200, 2023, 3, 1, 'Pistons');
INSERT INTO PLAYER VALUES(70, 'Scottie', 'Barnes', 'SF', 20, 4, 80, 225, 2021, 4, 1, 'Raptors');
INSERT INTO PLAYER VALUES(71, 'Brook', 'Lopez', 'C', 34, 11, 84, 282, 2008, 10, 1, 'Bucks');
INSERT INTO PLAYER VALUES(72, 'P.J.', 'Washington', 'PF', 23, 25, 80, 230, 2019, 12, 1, 'Hornets');
INSERT INTO PLAYER VALUES(73, 'Kevin', 'Huerter', 'SG', 23, 3, 79, 190, 2018, 19, 1, 'Kings');
INSERT INTO PLAYER VALUES(74, 'Harrison', 'Barnes', 'SF', 29, 40, 80, 225, 2012, 7, 1, 'Kings');
INSERT INTO PLAYER VALUES(75, 'Tobias', 'Harris', 'PF', 29, 12, 80, 226, 2011, 19, 1, 'Sixers');
INSERT INTO PLAYER VALUES(76, 'Alperen', 'Sengun', 'PF', 19, 9, 81, 240, 2021, 16, 1, 'Rockets');
INSERT INTO PLAYER VALUES(77, 'Malcolm', 'Brogdon', 'PG', 29, 7, 76, 229, 2016, 36, 2, 'Celtics');
INSERT INTO PLAYER VALUES(78, 'Jarrett', 'Allen', 'C', 23, 31, 83, 243, 2017, 22, 1, 'Cavs');
INSERT INTO PLAYER VALUES(79, 'Dillon', 'Brooks', 'SG', 26, 24, 76, 220, 2017, 45, 2, 'Grizzlies');
INSERT INTO PLAYER VALUES(80, 'Saddiq', 'Bey', 'SF', 22, 41, 80, 215, 2020, 19, 1, 'Hawks');
INSERT INTO PLAYER VALUES(81, 'Collin', 'Sexton', 'SG', 23, 2, 74, 190, 2018, 8, 1, 'Jazz');
INSERT INTO PLAYER VALUES(82, 'Tim', 'Hardaway Jr.', 'SG', 29, 11, 78, 205, 2013, 24, 1, 'Mavericks');
INSERT INTO PLAYER VALUES(83, 'Jonas', 'Valanciunas', 'C', 29, 17, 83, 265, 2011, 5, 1, 'Pelicans');

INSERT INTO PLAYER VALUES(84, 'Luguentz', 'Dort', 'SG', 22, 5, 76, 215, 2020, 3, 1, 'Thunder');

INSERT INTO PLAYER VALUES(85, 'Bobby', 'Portis', 'PF', 27, 9, 81, 250, 2015, 22, 1, 'Bucks');
INSERT INTO PLAYER VALUES(86, 'Malik', 'Monk', 'SG', 23, 11, 75, 200, 2017, 11, 1, 'Kings');
INSERT INTO PLAYER VALUES(87, 'Rudy', 'Gobert', 'C', 29, 27, 86, 258, 2013, 27, 1, 'Timberwolves');
INSERT INTO PLAYER VALUES(88, 'Immanuel', 'Quickley', 'PG', 22, 5, 75, 188, 2020, 25, 1, 'Knicks');
INSERT INTO PLAYER VALUES(89, 'Jalen', 'Williams', 'SG', 20, 0, 77, 185, 2022, 3, 1, 'Thunder');
INSERT INTO PLAYER VALUES(90, 'Malik', 'Beasley', 'SG', 24, 5, 77, 201, 2016, 19, 1, 'Jazz');
INSERT INTO PLAYER VALUES(91, 'John', 'Collins', 'PF', 24, 20, 82, 235, 2017, 19, 1, 'Hawks');
INSERT INTO PLAYER VALUES(92, 'Trey', 'Murphy III', 'SF', 21, 23, 80, 206, 2021, 17, 1, 'Pelicans');
INSERT INTO PLAYER VALUES(93, 'Alec', 'Burks', 'SG', 30, 10, 78, 214, 2011, 12, 1, 'Pistons');
INSERT INTO PLAYER VALUES(94, 'Lonnie', 'Walker IV', 'SG', 23, 1, 76, 204, 2018, 18, 1, 'Lakers');
INSERT INTO PLAYER VALUES(95, 'Dennis', 'Schroder', 'PG', 28, 17, 73, 172, 2013, 17, 1, 'Lakers');
INSERT INTO PLAYER VALUES(96, 'Eric', 'Gordon', 'SG', 33, 10, 75, 215, 2008, 7, 1, 'Clippers');
INSERT INTO PLAYER VALUES(97, 'Jakob', 'Poeltl', 'C', 26, 25, 84, 248, 2016, 9, 1, 'Raptors');
INSERT INTO PLAYER VALUES(98, 'Tre', 'Jones', 'PG', 21, 33, 74, 185, 2020, 41, 2, 'Spurs');
INSERT INTO PLAYER VALUES(99, 'Nic', 'Claxton', 'C', 23, 33, 82, 215, 2019, 31, 2, 'Nets');
INSERT INTO PLAYER VALUES(100, 'Cole', 'Anthony', 'PG', 21, 50, 74, 190, 2020, 15, 1, 'Magic');



INSERT INTO PLAYER VALUES(101, 'Kenyon', 'Martin Jr.', 'PF', 21, 6, 80, 215, 2020, 52, 2, 'Rockets');
INSERT INTO PLAYER VALUES(102, 'Jabari', 'Smith Jr.', 'SF', 18, 10, 81, 210, 2022, 3, 1, 'Rockets');
INSERT INTO PLAYER VALUES(103, 'Clint', 'Capela', 'C', 27, 15, 82, 240, 2014, 25, 1, 'Hawks');
INSERT INTO PLAYER VALUES(104, 'Kelly', 'Olynyk', 'C', 30, 9, 84, 240, 2013, 13, 1, 'Jazz');
INSERT INTO PLAYER VALUES(105, 'Derrick', 'White', 'PG', 27, 4, 76, 190, 2017, 29, 1, 'Celtics');
INSERT INTO PLAYER VALUES(106, 'Max', 'Strus', 'SG', 25, 31, 78, 215, 2017, 2, 1, 'Heat');
INSERT INTO PLAYER VALUES(107, 'Keegan', 'Murray', 'SF', 20, 14, 80, 215, 2024, 2, 1, 'Kings');
INSERT INTO PLAYER VALUES(108, 'Mason', 'Plumlee', 'C', 32, 24, 83, 254, 2013, 22, 1, 'Clippers');
INSERT INTO PLAYER VALUES(109, 'Rui', 'Hachimura', 'PF', 23, 8, 80, 230, 2019, 9, 1, 'Lakers');
INSERT INTO PLAYER VALUES(110, 'Marcus', 'Morris Sr.', 'PF', 32, 8, 80, 235, 2011, 14, 1, 'Clippers');
INSERT INTO PLAYER VALUES(111, 'Jaden', 'McDaniels', 'PF', 20, 3, 81, 200, 2021, 28, 1, 'Timberwolves');
INSERT INTO PLAYER VALUES(112, 'Marcus', 'Smart', 'PG', 27, 36, 76, 220, 2014, 6, 1, 'Celtics');
INSERT INTO PLAYER VALUES(113, 'Caris', 'LeVert', 'SG', 27, 22, 78, 204, 2016, 20, 1, 'Cavs');
INSERT INTO PLAYER VALUES(114, 'Isaiah', 'Stewart', 'C', 20, 28, 81, 250, 2021, 16, 1, 'Pistons');
INSERT INTO PLAYER VALUES(115, 'Kentavious', 'Caldwell-Pope', 'SG', 28, 1, 76, 195, 2013, 8, 1, 'Nuggets');
INSERT INTO PLAYER VALUES(116, 'Bruce', 'Brown', 'SG', 25, 6, 75, 202, 2018, 42, 2, 'Nuggets');
INSERT INTO PLAYER VALUES(117, 'Josh', 'Richardson', 'SG', 28, 0, 78, 200, 2015, 40, 2, 'Spurs');


INSERT INTO PLAYER VALUES(118, 'Austin', 'Reaves', 'PG', 23, 23, 78, 190, 2021, 3, 1, 'Lakers');
INSERT INTO PLAYER VALUES(119, 'Cam', 'Thomas', 'SG', 20, 24, 75, 210, 2021, 27, 1, 'Nets');
INSERT INTO PLAYER VALUES(120, 'Jaylen', 'Nowell', 'SG', 22, 4, 78, 201, 2019, 43, 2, 'Timberwolves');
INSERT INTO PLAYER VALUES(121, 'Grayson', 'Allen', 'SG', 26, 3, 76, 198, 2018, 21, 1, 'Bucks');
INSERT INTO PLAYER VALUES(122, 'Naz', 'Reid', 'C', 22, 11, 83, 264, 2019, 3, 1, 'Timberwolves');
INSERT INTO PLAYER VALUES(123, 'Thomas', 'Bryant', 'C', 24, 13, 83, 248, 2017, 42, 2, 'Lakers');
INSERT INTO PLAYER VALUES(124, 'Mike', 'Conley', 'PG', 34, 10, 73, 175, 2007, 4, 1, 'Jazz');
INSERT INTO PLAYER VALUES(125, 'Jeremy', 'Sochan', 'SF', 19, 14, 81, 210, 2021, 3, 1, 'Spurs');
INSERT INTO PLAYER VALUES(126, 'Reggie', 'Jackson', 'PG', 31, 1, 75, 208, 2011, 24, 1, 'Clippers');
INSERT INTO PLAYER VALUES(127, 'Zach', 'Collins', 'C', 24, 33, 84, 250, 2017, 10, 1, 'Spurs');
INSERT INTO PLAYER VALUES(128, 'Patrick', 'Williams', 'SF', 20, 9, 79, 220, 2020, 4, 1, 'Bulls');
INSERT INTO PLAYER VALUES(129, 'Ivica', 'Zubac', 'C', 24, 40, 85, 240, 2016, 32, 2, 'Clippers');
INSERT INTO PLAYER VALUES(130, 'Monte', 'Morris', 'PG', 26, 11, 75, 183, 2017, 51, 2, 'Wizards');
INSERT INTO PLAYER VALUES(131, 'De''Anthony', 'Melton', 'PG', 23, 0, 75, 196, 2018, 46, 2, 'Sixers');
INSERT INTO PLAYER VALUES(132, 'Caleb', 'Martin', 'SG', 25, 10, 77, 215, 2019, 2, 1, 'Heat');
INSERT INTO PLAYER VALUES(133, 'Tyus', 'Jones', 'PG', 25, 21, 73, 196, 2015, 24, 1, 'Grizzlies');
INSERT INTO PLAYER VALUES(134, 'Quentin', 'Grimes', 'SG', 22, 5, 77, 205, 2021, 25, 1, 'Knicks');
INSERT INTO PLAYER VALUES(135, 'Brandon', 'Clarke', 'PF', 25, 15, 80, 215, 2019, 21, 1, 'Grizzlies');

INSERT INTO PLAYER VALUES(136, 'Al', 'Horford', 'C', 36, 42, 82, 245, 2007, 3, 1, 'Celtics');
INSERT INTO PLAYER VALUES(137, 'Jalen', 'McDaniels', 'SF', 22, 6, 81, 190, 2019, 52, 2, 'Hornets');
INSERT INTO PLAYER VALUES(138, 'Seth', 'Curry', 'SG', 31, 30, 74, 185, 2013, 3, 1, 'Nets');
INSERT INTO PLAYER VALUES(139, 'Josh', 'Hart', 'SG', 26, 3, 77, 215, 2017, 30, 1, 'Blazers');
INSERT INTO PLAYER VALUES(140, 'Doug', 'McDermott', 'SF', 29, 20, 79, 225, 2014, 11, 1, 'Spurs');
INSERT INTO PLAYER VALUES(141, 'Chris', 'Boucher', 'PF', 29, 25, 82, 200, 2017, 3, 1, 'Raptors');
INSERT INTO PLAYER VALUES(142, 'Aaron', 'Nesmith', 'SF', 22, 26, 78, 213, 2020, 14, 1, 'Pacers');
INSERT INTO PLAYER VALUES(143, 'Corey', 'Kispert', 'SG', 22, 24, 79, 220, 2021, 15, 1, 'Wizards');
INSERT INTO PLAYER VALUES(144, 'Naji', 'Marshall', 'SF', 23, 8, 79, 222, 2020, 23, 1, 'Pelicans');
INSERT INTO PLAYER VALUES(145, 'Herbert', 'Jones', 'SF', 22, 10, 79, 206, 2021, 35, 2, 'Pelicans');
INSERT INTO PLAYER VALUES(146, 'Bol', 'Bol', 'C', 22, 7, 87, 220, 2019, 44, 2, 'Magic');
INSERT INTO PLAYER VALUES(147, 'Malaki', 'Branham', 'SG', 18, 0, 77, 195, 2022, 46, 2, 'Spurs');
INSERT INTO PLAYER VALUES(148, 'Killian', 'Hayes', 'PG', 20, 7, 76, 216, 2020, 7, 1, 'Pistons');
INSERT INTO PLAYER VALUES(149, 'Hamidou', 'Diallo', 'SG', 23, 6, 77, 202, 2018, 45, 2, 'Pistons');
INSERT INTO PLAYER VALUES(150, 'Gabe', 'Vincent', 'SG', 25, 2, 75, 200, 2020, 3, 1, 'Heat');

INSERT INTO PLAYER VALUES(151, 'Santi', 'Aldama', 'PF', 20, 23, 81, 215, 2021, 30, 2, 'Grizzlies');
INSERT INTO PLAYER VALUES(152, 'Onyeka', 'Okongwu', 'C', 21, 21, 80, 245, 2020, 6, 1, 'Hawks');
INSERT INTO PLAYER VALUES(153, 'Jonathan', 'Kuminga', 'SF', 19, 0, 79, 220, 2021, 7, 1, 'Warriors');
INSERT INTO PLAYER VALUES(154, 'Ayo', 'Dosunmu', 'PG', 21, 11, 76, 200, 2021, 38, 2, 'Bulls');
INSERT INTO PLAYER VALUES(155, 'Tari', 'Eason', 'PF', 19, 20, 80, 215, 2022, 39, 2, 'Rockets');
INSERT INTO PLAYER VALUES(156, 'Donte', 'DiVincenzo', 'SG', 24, 0, 76, 203, 2018, 17, 1, 'Warriors');
INSERT INTO PLAYER VALUES(157, 'Isaiah', 'Joe', 'SG', 22, 7, 76, 166, 2020, 49, 2, 'Thunder');
INSERT INTO PLAYER VALUES(158, 'Terance', 'Mann', 'SG', 25, 14, 77, 215, 2019, 48, 2, 'Clippers');
INSERT INTO PLAYER VALUES(159, 'Jalen', 'Smith', 'C', 21, 10, 83, 240, 2020, 10, 1, 'Pacers');
INSERT INTO PLAYER VALUES(160, 'Jose', 'Alvarado', 'PG', 23, 10, 72, 180, 2022, 3, 1, 'Pelicans');
INSERT INTO PLAYER VALUES(161, 'AJ', 'Griffin', 'SG', 18, 0, 78, 215, 2022, 48, 2, 'Hawks');
INSERT INTO PLAYER VALUES(162, 'Royce', "O'Neale", 'SF', 28, 23, 78, 226, 2015, 3, 1, 'Nets');
INSERT INTO PLAYER VALUES(163, 'Coby', 'White', 'PG', 22, 0, 74, 195, 2019, 7, 1, 'Bulls');
INSERT INTO PLAYER VALUES(164, 'Deni', 'Avdija', 'SF', 20, 9, 81, 210, 2020, 9, 1, 'Wizards');
INSERT INTO PLAYER VALUES(165, 'Kyle', 'Anderson', 'SF', 28, 1, 81, 230, 2014, 30, 1, 'Timberwolves');
INSERT INTO PLAYER VALUES(166, 'Josh', 'Green', 'SG', 20, 8, 77, 210, 2020, 18, 1, 'Mavericks');
INSERT INTO PLAYER VALUES(167, 'Cedi', 'Osman', 'SF', 26, 16, 81, 215, 2015, 31, 2, 'Cavs');

INSERT INTO PLAYER VALUES(168, 'Shake', 'Milton', 'PG', 25, 18, 76, 207, 2018, 54, 2, 'Sixers');
INSERT INTO PLAYER VALUES(169, 'Daniel', 'Gafford', 'C', 22, 21, 82, 234, 2019, 38, 2, 'Wizards');
INSERT INTO PLAYER VALUES(170, 'Damion', 'Lee', 'SG', 29, 1, 75, 210, 2016, 3, 1, 'Suns');
INSERT INTO PLAYER VALUES(171, 'Keita', 'Bates-Diop', 'SF', 25, 13, 80, 229, 2018, 48, 2, 'Spurs');
INSERT INTO PLAYER VALUES(172, 'Jalen', 'Duren', 'C', 18, 0, 81, 230, 2023, 3, 1, 'Pistons');
INSERT INTO PLAYER VALUES(173, 'Talen', 'Horton-Tucker', 'SG', 21, 5, 76, 235, 2019, 46, 2, 'Jazz');
INSERT INTO PLAYER VALUES(174, 'Walker', 'Kessler', 'C', 20, 13, 84, 245, 2023, 3, 1, 'Jazz');
INSERT INTO PLAYER VALUES(175, 'Draymond', 'Green', 'PF', 32, 23, 79, 230, 2012, 35, 2, 'Warriors');
INSERT INTO PLAYER VALUES(176, 'Dorian', 'Finney-Smith', 'SF', 28, 10, 80, 220, 2016, 3, 1, 'Mavericks');
INSERT INTO PLAYER VALUES(177, 'Georges', 'Niang', 'PF', 28, 31, 80, 231, 2016, 50, 2, 'Sixers');
INSERT INTO PLAYER VALUES(178, 'Grant', 'Williams', 'PF', 23, 12, 79, 236, 2019, 22, 1, 'Celtics');
INSERT INTO PLAYER VALUES(179, 'Kevin', 'Love', 'PF', 33, 0, 82, 251, 2008, 5, 1, 'Heat');
INSERT INTO PLAYER VALUES(180, 'Terrence', 'Ross', 'SG', 31, 8, 78, 206, 2012, 8, 1, 'Suns');
INSERT INTO PLAYER VALUES(181, 'Jarred', 'Vanderbilt', 'PF', 22, 8, 81, 214, 2018, 41, 2, 'Jazz');
INSERT INTO PLAYER VALUES(182, 'Pat', 'Connaughton', 'SG', 29, 24, 77, 209, 2015, 41, 2, 'Bucks');
INSERT INTO PLAYER VALUES(183, 'Joe', 'Harris', 'SG', 30, 12, 79, 218, 2014, 33, 2, 'Nets');
INSERT INTO PLAYER VALUES(184, 'Kenrich', 'Williams', 'SF', 27, 34, 79, 210, 2018, 3, 1, 'Thunder');


INSERT INTO PLAYER VALUES(185, 'Jevon', 'Carter', 'PG', 26, 4, 74, 200, 2018, 32, 2, 'Bucks');
INSERT INTO PLAYER VALUES(186, 'Andrew', 'Nembhard', 'PG', 20, 3, 76, 193, 2023, 3, 1, 'Pacers');
INSERT INTO PLAYER VALUES(187, 'Tre', 'Mann', 'PG', 20, 1, 75, 190, 2023, 18, 1, 'Thunder');
INSERT INTO PLAYER VALUES(188, 'Shaedon', 'Sharpe', 'PG', 18, 0, 77, 210, 2023, 29, 1, 'Blazers');
INSERT INTO PLAYER VALUES(189, 'Trey', 'Lyles', 'PF', 25, 41, 82, 235, 2015, 12, 1, 'Kings');
INSERT INTO PLAYER VALUES(190, 'T.J.', 'McConnell', 'PG', 29, 2, 72, 190, 2015, 3, 1, 'Pacers');
INSERT INTO PLAYER VALUES(191, 'Nick', 'Richards', 'C', 24, 0, 84, 247, 2020, 42, 2, 'Hornets');
INSERT INTO PLAYER VALUES(192, 'Larry', 'Nance Jr.', 'PF', 29, 22, 81, 230, 2015, 27, 1, 'Pelicans');
INSERT INTO PLAYER VALUES(193, 'Torrey', 'Craig', 'SF', 31, 3, 79, 221, 2018, 3, 1, 'Suns');
INSERT INTO PLAYER VALUES(194, 'Edmond', 'Sumner', 'SG', 26, 5, 77, 196, 2017, 52, 2, 'Nets');
INSERT INTO PLAYER VALUES(195, 'Troy', 'Brown Jr.', 'SF', 22, 6, 79, 215, 2018, 15, 1, 'Lakers');
INSERT INTO PLAYER VALUES(196, 'Reggie', 'Bullock', 'SF', 31, 25, 79, 215, 2013, 25, 1, 'Mavericks');
INSERT INTO PLAYER VALUES(197, 'Jordan', 'Nwora', 'SF', 23, 13, 80, 225, 2020, 45, 2, 'Pacers');
INSERT INTO PLAYER VALUES(198, 'Anthony', 'Lamb', 'PF', 24, 0, 81, 227, 2020, 56, 2, 'Warriors');
INSERT INTO PLAYER VALUES(199, 'Kevon', 'Looney', 'C', 25, 5, 80, 222, 2015, 30, 1, 'Warriors');
INSERT INTO PLAYER VALUES(200, 'Devonte', 'Graham', 'PG', 27, 4, 74, 185, 2018, 34, 2, 'Spurs');

INSERT INTO PLAYER VALUES(201, 'Aaron', 'Wiggins', 'SG', 20, 15, 78, 185, 2023, 3, 1, 'Thunder');
INSERT INTO PLAYER VALUES(202, 'Josh', 'Okogie', 'SG', 23, 20, 77, 215, 2018, 20, 1, 'Suns');
INSERT INTO PLAYER VALUES(203, 'Mo', 'Bamba', 'C', 23, 5, 84, 231, 2018, 6, 1, 'Lakers');
INSERT INTO PLAYER VALUES(204, 'Dwight', 'Powell', 'C', 30, 7, 83, 240, 2014, 45, 2, 'Mavericks');
INSERT INTO PLAYER VALUES(205, 'Terence', 'Davis', 'SG', 24, 5, 74, 201, 2019, 3, 1, 'Kings');
INSERT INTO PLAYER VALUES(206, 'Kendrick', 'Nunn', 'PG', 26, 25, 75, 190, 2018, 3, 1, 'Lakers');
INSERT INTO PLAYER VALUES(207, 'Dario', 'Saric', 'PF', 27, 20, 82, 240, 2014, 12, 1, 'Thunder');
INSERT INTO PLAYER VALUES(208, 'Isaiah', 'Jackson', 'PF', 19, 22, 81, 206, 2023, 21, 1, 'Pacers');
INSERT INTO PLAYER VALUES(209, 'Jock', 'Landale', 'C', 26, 41, 83, 256, 2018, 3, 1, 'Suns');
INSERT INTO PLAYER VALUES(210, 'Isaac', 'Okoro', 'SF', 20, 35, 78, 225, 2020, 5, 1, 'Cavs');
INSERT INTO PLAYER VALUES(211, 'Goran', 'Dragic', 'PG', 35, 1, 75, 190, 2008, 45, 2, 'Bulls');
INSERT INTO PLAYER VALUES(212, 'JaMychal', 'Green', 'PF', 31, 0, 80, 227, 2012, 3, 1, 'Warriors');
INSERT INTO PLAYER VALUES(213, 'Sam', 'Hauser', 'SF', 23, 41, 80, 225, 2023, 3, 1, 'Celtics');
INSERT INTO PLAYER VALUES(214, 'Patrick', 'Beverley', 'PG', 33, 21, 73, 185, 2012, 42, 2, 'Lakers');
INSERT INTO PLAYER VALUES(215, 'Andre', 'Drummond', 'C', 28, 2, 83, 279, 2012, 9, 1, 'Bulls');
INSERT INTO PLAYER VALUES(216, 'Xavier', 'Tillman', 'PF', 22, 2, 79, 245, 2020, 35, 2, 'Grizzlies');
INSERT INTO PLAYER VALUES(217, 'Nicolas', 'Batum', 'SF', 33, 33, 80, 230, 2008, 25, 1, 'Clippers');

INSERT INTO PLAYER VALUES(218, 'Drew', 'Eubanks', 'C', 24, 14, 83, 245, 2018, 3, 1, 'Blazers');
INSERT INTO PLAYER VALUES(219, 'Mike', 'Muscala', 'PF', 30, 31, 83, 240, 2013, 44, 2, 'Celtics');
INSERT INTO PLAYER VALUES(220, 'Obi', 'Toppin', 'PF', 23, 1, 80, 220, 2020, 8, 1, 'Knicks');
INSERT INTO PLAYER VALUES(221, 'Trendon', 'Watford', 'SF', 21, 2, 81, 235, 2023, 3, 1, 'Blazers');
INSERT INTO PLAYER VALUES(222, 'David', 'Roddy', 'SG', 21, 3, 78, 200, 2023, 3, 1, 'Grizzlies');
INSERT INTO PLAYER VALUES(223, 'Jordan', 'Goodwin', 'SG', 24, 0, 77, 210, 2022, 3, 1, 'Wizards');
INSERT INTO PLAYER VALUES(224, 'Wenyen', 'Gabriel', 'PF', 24, 32, 81, 233, 2018, 3, 1, 'Lakers');
INSERT INTO PLAYER VALUES(225, 'Vlatko', 'Cancar', 'SF', 25, 31, 80, 210, 2017, 49, 2, 'Nuggets');
INSERT INTO PLAYER VALUES(226, 'Davion', 'Mitchell', 'PG', 23, 45, 74, 202, 2021, 9, 1, 'Kings');
INSERT INTO PLAYER VALUES(227, 'John', 'Konchar', 'SG', 26, 46, 77, 210, 2019, 3, 1, 'Grizzlies');
INSERT INTO PLAYER VALUES(228, 'Oshae', 'Brissett', 'SF', 23, 12, 80, 210, 2019, 3, 1, 'Pacers');
INSERT INTO PLAYER VALUES(229, 'Alex', 'Caruso', 'SG', 28, 4, 77, 186, 2018, 3, 1, 'Bulls');
INSERT INTO PLAYER VALUES(230, 'Montrezl', 'Harrell', 'C', 28, 5, 80, 260, 2015, 32, 2, 'Sixers');
INSERT INTO PLAYER VALUES(231, 'Cory', 'Joseph', 'PG', 30, 6, 75, 193, 2011, 29, 1, 'Pistons');
INSERT INTO PLAYER VALUES(232, 'Lamar', 'Stevens', 'SF', 24, 8, 79, 230, 2020, 3, 1, 'Cavs');
INSERT INTO PLAYER VALUES(233, 'Jalen', 'Johnson', 'SF', 20, 10, 81, 220, 2023, 20, 1, 'Hawks');
INSERT INTO PLAYER VALUES(234, 'Josh', 'Christopher', 'SG', 20, 13, 76, 215, 2023, 24, 1, 'Rockets');


INSERT INTO PLAYER VALUES(235, 'Austin', 'Rivers', 'SG', 29, 0, 76, 200, 2012, 10, 1, 'Timberwolves');
INSERT INTO PLAYER VALUES(236, 'Isaiah', 'Hartenstein', 'C', 23, 55, 84, 249, 2017, 43, 2, 'Knicks');
INSERT INTO PLAYER VALUES(237, 'Rudy', 'Gay', 'SF', 35, 22, 80, 250, 2006, 8, 1, 'Jazz');
INSERT INTO PLAYER VALUES(238, 'Kevin', 'Knox II', 'SF', 22, 20, 80, 215, 2018, 9, 1, 'Blazers');
INSERT INTO PLAYER VALUES(239, 'Chimezie', 'Metu', 'PF', 24, 7, 82, 225, 2018, 49, 2, 'Kings');
INSERT INTO PLAYER VALUES(240, 'Derrick', 'Jones Jr.', 'SF', 24, 5, 79, 210, 2016, 3, 1, 'Bulls');
INSERT INTO PLAYER VALUES(241, 'Moses', 'Moody', 'SG', 19, 4, 78, 211, 2021, 14, 1, 'Warriors');
INSERT INTO PLAYER VALUES(242, 'Garrison', 'Mathews', 'SG', 25, 24, 76, 215, 2019, 3, 1, 'Hawks');
INSERT INTO PLAYER VALUES(243, 'Thaddeus', 'Young', 'PF', 33, 21, 79, 235, 2007, 12, 1, 'Raptors');
INSERT INTO PLAYER VALUES(244, 'Daishen', 'Nix', 'PG', 19, 15, 78, 225, 2021, 43, 2, 'Rockets');
INSERT INTO PLAYER VALUES(245, 'Ish', 'Wainright', 'SF', 27, 11, 78, 220, 2021, 3, 1, 'Suns');
INSERT INTO PLAYER VALUES(246, 'Christian', 'Braun', 'SG', 21, 2, 77, 215, 2021, 52, 2, 'Nuggets');
INSERT INTO PLAYER VALUES(247, 'Aaron', 'Holiday', 'PG', 25, 3, 72, 185, 2018, 23, 1, 'Hawks');
INSERT INTO PLAYER VALUES(248, 'Bismack', 'Biyombo', 'C', 29, 0, 81, 255, 2011, 7, 1, 'Suns');
INSERT INTO PLAYER VALUES(249, 'Luke', 'Kornet', 'C', 26, 50, 84, 250, 2017, 48, 2, 'Celtics');
INSERT INTO PLAYER VALUES(250, 'P.J.', 'Tucker', 'PF', 36, 17, 77, 245, 2006, 35, 2, 'Sixers');




INSERT INTO STAT VALUES (1,33.4,8.1,8.7,1.5,0.5,35.5,50.7);
INSERT INTO STAT VALUES (2,33.0,4.1,10.3,1.1,1.6,34.4,53.3);
INSERT INTO STAT VALUES (3,32.3,7.1,4.4,0.9,0.3,37.9,47.2);
INSERT INTO STAT VALUES (4,31.3,5.3,12.0,0.7,0.8,28.0,53.9);
INSERT INTO STAT VALUES (5,31.0,5.7,4.7,1.6,1.1,33.8,50.7);
INSERT INTO STAT VALUES (6,30.2,4.8,8.8,1.0,0.8,35.0,46.2);
INSERT INTO STAT VALUES (7,29.5,6.9,8.4,0.9,0.6,30.8,50.1);
INSERT INTO STAT VALUES (8,27.4,4.8,4.0,1.5,0.4,38.7,48.0);
INSERT INTO STAT VALUES (9,27.1,8.2,6.0,1.1,0.2,31.6,46.3);
INSERT INTO STAT VALUES (10,27.0,5.5,5.1,1.1,0.8,38.1,49.1);

INSERT INTO STAT VALUES 
(11, 25.3, 9.4, 3.9, 0.9, 0.2, 34.3, 43.7),
(12, 24.7, 3.4, 6.0, 1.2, 0.6, 39.7, 48.4),
(13, 25.2, 7.2, 3.5, 1.2, 0.4, 32.2, 48.8),
(14, 13.6, 0.8, 5.3, 0.6, 0.5, 39.2, 49.0),
(15, 23.2, 6.0, 10.5, 0.8, 0.3, 42.8, 45.6),
(16, 22.7, 7.3, 4.6, 1.0, 0.4, 25.7, 49.5),
(17, 27.4, 5.0, 5.0, 0.9, 0.5, 41.9, 50.7),
(18, 19.3, 2.9, 4.7, 1.1, 0.5, 32.9, 41.7),
(19, 22.9, 4.9, 7.3, 1.0, 0.6, 29.7, 46.4),
(20, 26.4, 8.3, 11.0, 1.3, 0.7, 34.9, 56.6),
(21, 17.6, 5.3, 3.2, 0.5, 0.1, 38.9, 51.8),
(22, 23.3, 6.8, 6.6, 1.2, 0.5, 39.8, 49.6),
(23, 20.1, 8.7, 8.3, 0.8, 1.3, 32.4, 45.7),
(24, 22.3, 2.4, 3.8, 0.8, 0.2, 40.2, 46.8),
(25, 21.5, 7.1, 6.9, 2.1, 0.6, 23.8, 49.7),
(26, 17.4, 6.1, 3.1, 1.2, 0.1, 40.1, 45.5),
(27, 25.2, 10.9, 8.0, 1.6, 0.7, 36.1, 44.7),
(28, 21.0, 4.4, 4.4, 0.9, 0.3, 34.0, 41.2),
(29, 14.0, 6.0, 6.7, 0.8, 0.4, 35.0, 50.0),
(30, 18.2, 2.2, 3.7, 0.4, 0.2, 36.3, 46.3);

INSERT INTO STAT VALUES 
(31, 12.2, 2.2, 4.4, 0.5, 0.4, 35.9, 45.0),
(32, 21.8, 4.4, 4.2, 1.3, 0.2, 34.5, 45.3),
(33, 17.8, 5.4, 10.3, 1.0, 1.1, 20.0, 61.7),
(34, 23.2, 3.9, 3.6, 1.1, 0.5, 40.2, 43.5),
(35, 9.5, 1.2, 2.1, 0.3, 0.2, 37.2, 41.9),
(36, 16.2, 7.1, 7.0, 1.1, 0.3, 33.9, 48.2),
(37, 18.4, 2.4, 4.0, 0.8, 0.2, 35.9, 41.5),
(38, 17.5, 2.7, 3.2, 0.7, 0.1, 37.1, 45.2),
(39, 19.3, 3.1, 3.9, 0.8, 0.8, 33.0, 42.8),
(40, 10.6, 4.9, 2.8, 1.2, 0.3, 40.1, 44.6),
(41, 14.9, 2.2, 4.5, 0.5, 0.3, 33.5, 42.9),
(42, 15.6, 3.7, 3.0, 0.8, 0.2, 31.6, 46.2),
(43, 21.2, 4.0, 4.0, 0.9, 0.3, 40.8, 47.7),
(44, 15.6, 3.7, 3.0, 0.8, 0.2, 31.6, 46.2),
(45, 17.2, 5.4, 4.5, 1.5, 0.3, 36.8, 43.8),
(46, 17.6, 5.8, 5.8, 1.0, 0.3, 34.2, 44.1),
(47, 19.6, 7.3, 4.9, 1.7, 0.3, 39.4, 43.3),
(48, 18.7, 11.9, 11.2, 0.7, 0.5, 28.3, 50.4),
(49, 12.2, 4.2, 4.4, 0.9, 0.6, 32.6, 42.9),
(50, 14.5, 2.1, 4.3, 0.9, 0.9, 33.9, 46.1),
(51, 14.4, 10.5, 10.5, 0.9, 1.2, 0.0, 63.3),
(52, 15.3, 1.9, 2.6, 0.6, 0.2, 38.5, 41.2),
(53, 12.6, 2.6, 7.1, 1.1, 2.8, 34.5, 45.9),
(54, 8.8, 1.7, 4.0, 0.8, 0.4, 36.9, 41.3),
(55, 17.1, 1.8, 12.5, 0.7, 0.8, 36.3, 51.4),
(56, 18.2, 4.2, 2.9, 0.8, 0.3, 35.0, 44.8);

INSERT INTO STAT VALUES 
(57,15.5, 4.7, 3.5, 0.9, 0.3, 40.6, 44.9),
(58, 19.0, 1.1, 7.3, 0.6, 1.0, 40.9, 51.8),
(59, 19.3, 1.6, 9.4, 0.9, 1.1, 32.8, 49.2),
(60, 14.4, 1.4, 4.9, 0.6, 1.4, 35.3, 41.4),
(61, 15.9, 1.9, 5.5, 0.8, 0.5, 39.1, 45.2),
(62, 18.0, 2.0, 3.5, 1.0, 0.2, 40.0, 46.9),
(63, 9.8, 1.5, 3.7, 0.5, 0.1, 35.7, 43.3),
(64, 13.9, 2.2, 6.3, 1.5, 0.7, 34.4, 45.6),
(65, 11.4, 6.8, 6.0, 1.1, 0.1, 28.8, 43.7),
(66, 16.0, 2.5, 8.9, 0.8, 1.7, 33.3, 54.1),
(67, 22.0, 11.7, 11.5, 1.5, 0.3, 33.8, 44.4),
(68, 14.1, 1.8, 4.4, 0.7, 0.4, 38.9, 41.9),
(69, 8.2, 2.2, 2.7, 0.6, 0.1, 28.6, 41.2),
(70, 15.7, 4.6, 7.0, 1.0, 0.7, 27.6, 47.4),
(71, 11.3, 3.0, 5.0, 0.3, 1.5, 31.4, 49.7),
(72, 11.8, 2.9, 5.5, 0.8, 0.5, 36.1, 46.7),
(73, 11.3, 3.3, 3.5, 0.7, 0.2, 36.2, 43.5),
(74, 16.5, 6.1, 6.7, 0.8, 0.3, 39.1, 47.0),
(75, 19.5, 3.5, 7.2, 0.9, 0.4, 35.6, 49.4);


INSERT INTO STAT VALUES 
(76, 19.5, 3.5, 7.2, 0.9, 0.4, 35.6, 49.4),
(77, 17.6, 5.9, 4.7, 1.4, 0.2, 35.9, 47.1),
(78, 10.4, 1.7, 9.7, 0.6, 1.4, 0.0, 64.8),
(79, 15.2, 2.4, 3.1, 1.1, 0.2, 36.4, 43.4),
(80, 13.2, 1.8, 4.3, 0.7, 0.3, 36.6, 40.3),
(81, 24.3, 3.5, 3.2, 1.1, 0.1, 37.2, 47.8),
(82, 16.6, 2.7, 3.3, 0.5, 0.2, 39.8, 42.5),
(83, 15.9, 12.1, 12.5, 0.7, 1.5, 0.0, 56.5),
(84, 12.5, 2.0, 3.6, 1.2, 0.3, 34.3, 39.0),
(85, 12.4, 6.4, 7.1, 0.4, 0.4, 46.4, 53.3),
(86, 13.3, 1.8, 2.7, 0.8, 0.2, 40.1, 43.9),
(87, 14.1, 13.4, 14.4, 0.9, 2.7, 0.0, 69.5),
(88, 12.5, 2.0, 2.2, 0.7, 0.1, 34.7, 38.9),
(89, 5.3, 1.5, 1.7, 0.5, 0.3, 28.6, 44.4),
(90, 14.6, 3.1, 3.8, 0.8, 0.2, 37.2, 42.4),
(91, 16.8, 2.2, 7.7, 0.7, 1.0, 34.6, 55.3),
(92, 7.0, 0.5, 2.8, 0.7, 0.4, 42.4, 46.2),
(93, 16.0, 3.4, 4.7, 0.6, 0.3, 42.3, 44.2),
(94, 8.8, 2.7, 2.2, 0.5, 0.2, 38.0, 43.3),
(95, 15.4, 3.5, 3.5, 0.7, 0.2, 33.5, 44.7),
(96, 13.7, 2.8, 2.1, 0.9, 0.2, 35.9, 41.5),
(97, 8.5, 6.3, 7.5, 0.8, 1.3, 0.0, 57.1),
(98, 2.6, 1.1, 1.2, 0.4, 0.0, 20.0, 40.0),
(99, 7.5, 4.4, 5.0, 1.1, 1.0, 0.0, 68.8),
(100, 12.9, 4.7, 5.5, 0.8, 0.3, 36.3, 41.1);

INSERT INTO STAT VALUES 
(101, 4.6, 4.7, 0.9, 0.5, 0.1, 33.3, 39.8),
(102, 9.2, 2.2, 4.6, 0.7, 0.2, 32.9, 47.8),
(103, 15.3, 1.3, 15.0, 0.5, 1.9, 0.0, 71.4),
(104, 12.8, 2.4, 6.6, 0.7, 0.4, 39.5, 47.6),
(105, 12.6, 3.5, 3.8, 1.2, 0.6, 34.7, 43.5),
(106, 11.9, 2.3, 3.7, 0.6, 0.2, 41.4, 47.4),
(107, 15.4, 1.6, 6.5, 1.1, 0.7, 34.6, 48.8),
(108, 7.2, 4.8, 8.2, 0.7, 0.9, 0.0, 54.3),
(109, 10.7, 3.8, 5.5, 0.7, 0.5, 34.1, 45.7),
(110, 15.2, 3.2, 5.9, 1.1, 0.3, 34.3, 48.8),
(111, 5.5, 2.0, 3.7, 0.6, 0.5, 25.0, 39.4),
(112, 9.4, 4.6, 3.5, 1.4, 0.4, 37.5, 37.9),
(113, 14.0, 4.5, 4.1, 1.3, 0.3, 36.9, 44.6),
(114, 10.1, 1.5, 9.2, 0.5, 1.3, 26.7, 50.3),
(115, 11.8, 2.0, 3.9, 0.9, 0.2, 41.2, 47.2),
(116, 9.1, 3.6, 4.5, 0.8, 0.2, 29.6, 43.9),
(117, 10.2, 2.2, 3.3, 0.7, 0.3, 35.9, 43.5),
(118, 5.7, 2.1, 2.5, 0.4, 0.2, 33.3, 38.1),
(119, 14.5, 2.4, 4.6, 0.8, 0.2, 38.1, 44.6),
(120, 7.6, 1.5, 2.8, 0.5, 0.1, 33.3, 39.2);

INSERT INTO STAT VALUES 
(121, 12.2, 2.2, 3.6, 0.7, 0.1, 36.5, 43.6),
(122, 11.1, 1.5, 6.0, 0.5, 0.8, 33.3, 54.4),
(123, 4.3, 1.3, 2.6, 0.2, 0.3, 33.3, 47.6),
(124, 13.6, 4.2, 3.2, 0.9, 0.1, 38.7, 45.7),
(125, 2.3, 0.5, 1.3, 0.3, 0.1, 25.0, 33.3),
(126, 11.3, 3.1, 2.5, 0.8, 0.2, 41.0, 45.8),
(127, 7.1, 6.1, 5.9, 0.6, 0.7, 20.0, 43.5),
(128, 9.2, 1.9, 4.1, 0.8, 0.5, 31.6, 42.4),
(129, 9.1, 1.4, 7.1, 0.4, 0.8, 0.0, 61.9),
(130, 9.8, 4.2, 2.7, 0.6, 0.1, 34.4, 44.4),
(131, 10.3, 3.1, 3.5, 1.2, 0.3, 39.6, 43.5),
(132, 7.0, 2.1, 3.5, 0.6, 0.3, 29.2, 45.6),
(133, 6.6, 4.8, 1.9, 0.9, 0.1, 28.6, 44.3),
(134, 8.1, 2.5, 3.2, 0.8, 0.2, 33.3, 42.9),
(135, 9.4, 4.1, 4.8, 0.7, 0.6, 20.0, 57.1),
(136, 10.0, 3.9, 6.4, 0.8, 0.8, 42.1, 48.2),
(137, 9.0, 2.2, 4.6, 0.8, 0.4, 34.5, 44.6),
(138, 14.6, 2.7, 2.0, 0.5, 0.1, 43.9, 51.5),
(139, 9.6, 5.9, 6.1, 1.3, 0.3, 31.8, 50.0),
(140, 7.9, 1.5, 2.1, 0.2, 0.2, 36.4, 42.9);



INSERT INTO STAT VALUES 
(141, 8.7, 0.9, 4.4, 0.4, 1.3, 20.0, 41.8),
(142, 5.9, 0.4, 2.7, 0.4, 0.1, 36.8, 43.4),
(143, 4.4, 0.3, 1.2, 0.2, 0.1, 27.3, 38.5),
(144, 8.1, 3.1, 5.0, 1.3, 0.2, 33.3, 48.8),
(145, 5.5, 2.2, 5.5, 1.6, 0.6, 29.0, 44.1),
(146, 2.2, 0.6, 1.3, 0.2, 0.5, 0.0, 25.0),
(147, 3.3, 0.3, 1.3, 0.3, 0.0, 37.5, 40.0),
(148, 9.3, 5.3, 3.6, 1.1, 0.4, 24.4, 36.4),
(149, 12.8, 5.5, 5.4, 1.2, 0.6, 23.5, 44.1),
(150, 6.1, 1.8, 1.6, 0.5, 0.1, 34.5, 42.2),
(151, 1.3, 0.3, 0.9, 0.1, 0.0, 0.0, 27.8),
(152, 4.4, 2.4, 4.2, 0.7, 0.7, 0.0, 60.0),
(153, 4.4, 0.4, 2.2, 0.3, 0.1, 33.3, 45.9),
(154, 8.0, 1.9, 3.1, 0.8, 0.2, 33.3, 38.8),
(155, 5.5, 0.8, 5.5, 0.6, 0.6, 0.0, 61.5),
(156, 12.8, 3.0, 5.9, 1.1, 0.3, 31.7, 44.5),
(157, 5.5, 0.9, 1.8, 0.5, 0.1, 28.6, 39.1),
(158, 9.0, 2.2, 4.6, 0.8, 0.4, 34.5, 44.6),
(159, 3.7, 2.2, 2.3, 0.4, 0.4, 0.0, 43.8),
(160, 0.8, 0.5, 0.8, 0.3, 0.0, 50.0, 27.3),
(161, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(162, 7.3, 2.9, 6.3, 1.0, 0.3, 40.0, 47.1),
(163, 8.7, 3.3, 3.2, 0.8, 0.2, 34.1, 38.8),
(164, 5.6, 2.7, 4.7, 0.9, 0.4, 25.0, 36.4);


INSERT INTO STAT VALUES 
(165, 4.4, 3.3, 3.3, 0.9, 0.3, 37.9, 46.7),
(166, 3.7, 1.2, 2.8, 0.7, 0.2, 29.2, 38.5),
(167, 12.2, 3.6, 3.7, 0.9, 0.2, 36.6, 43.3),
(168, 8.4, 2.2, 2.5, 0.6, 0.1, 35.0, 45.5),
(169, 7.9, 4.7, 5.5, 1.1, 1.0, 0.0, 76.7),
(170, 4.0, 1.1, 1.4, 0.4, 0.1, 41.2, 46.2),
(171, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(172, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(173, 7.6, 2.8, 3.3, 1.0, 0.3, 30.0, 42.7),
(174, 1.1, 0.2, 1.2, 0.2, 0.1, 0.0, 42.9),
(175, 7.7, 8.8, 7.1, 1.7, 0.8, 29.4, 41.2),
(176, 8.8, 5.4, 4.4, 1.4, 0.4, 37.7, 42.5),
(177, 5.5, 1.0, 2.5, 0.4, 0.0, 39.4, 50.0),
(178, 5.5, 1.7, 3.9, 0.6, 0.2, 35.6, 42.7),
(179, 8.7, 3.9, 6.1, 0.6, 0.4, 34.3, 44.4),
(180, 11.2, 2.0, 3.5, 0.9, 0.2, 35.2, 43.5),
(181, 5.1, 5.1, 6.0, 1.1, 0.5, 0.0, 55.9),
(182, 8.8, 2.2, 5.0, 1.1, 0.3, 38.6, 47.8),
(183, 7.2, 1.8, 2.8, 0.3, 0.1, 37.8, 47.0),
(184, 7.1, 5.0, 6.1, 1.2, 0.2, 35.1, 50.7),
(185, 2.7, 1.5, 1.1, 0.4, 0.0, 22.2, 40.0),
(186, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(187, 1.8, 1.1, 0.4, 0.3, 0.0, 0.0, 33.3),
(188, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(189, 2.1, 1.0, 2.0, 0.2, 0.2, 25.0, 40.0);


INSERT INTO STAT VALUES 
(190, 8.0, 6.6, 3.2, 1.6, 0.2, 25.0, 40.1),
(191, 1.7, 0.3, 2.0, 0.2, 0.1, 0.0, 40.0),
(192, 5.3, 3.9, 5.0, 1.6, 0.5, 28.6, 48.5),
(193, 2.5, 2.2, 2.5, 0.8, 0.2, 26.1, 46.9),
(194, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(195, 3.5, 1.8, 3.3, 0.5, 0.2, 33.3, 39.1),
(196, 5.5, 1.7, 2.9, 0.6, 0.1, 41.2, 44.4),
(197, 5.4, 1.6, 1.4, 0.4, 0.1, 38.1, 43.6),
(198, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(199, 3.8, 5.3, 5.4, 0.8, 0.4, 0.0, 62.9),
(200, 14.4, 5.4, 2.7, 0.8, 0.2, 37.5, 38.2),
(201, 1.1, 0.3, 0.3, 0.1, 0.0, 0.0, 33.3),
(202, 1.7, 0.5, 0.9, 0.5, 0.1, 20.0, 43.8),
(203, 5.4, 0.5, 4.3, 0.3, 1.0, 29.7, 54.1),
(204, 6.8, 1.3, 3.6, 0.8, 0.4, 25.0, 63.6),
(205, 7.6, 2.1, 2.2, 0.6, 0.1, 34.8, 44.7),
(206, 13.1, 3.0, 3.1, 1.1, 0.2, 38.1, 48.5),
(207, 3.5, 2.2, 2.7, 0.6, 0.3, 25.0, 48.5),
(208, 3.5, 2.2, 2.7, 0.6, 0.3, 25.0, 48.5),
(209, 3.5, 2.2, 2.7, 0.6, 0.3, 25.0, 48.5),
(210, 9.6, 2.9, 3.1, 0.9, 0.3, 24.8, 43.7);

INSERT INTO STAT VALUES 
(211, 11.5, 3.3, 3.3, 0.6, 0.2, 33.3, 46.7),
(212, 8.3, 0.8, 6.2, 0.5, 0.3, 35.6, 45.8),
(213, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(214, 7.7, 3.6, 3.3, 0.9, 0.2, 41.5, 44.9),
(215, 7.5, 7.5, 10.5, 1.0, 1.5, 0.0, 43.8),
(216, 3.7, 1.1, 3.2, 0.5, 0.4, 25.0, 49.2),
(217, 8.8, 2.3, 3.9, 0.9, 0.4, 38.5, 44.4),
(218, 2.1, 0.4, 1.9, 0.2, 0.5, 0.0, 56.5),
(219, 4.8, 1.2, 2.2, 0.3, 0.2, 31.3, 40.3),
(220, 6.4, 0.7, 3.6, 0.3, 0.4, 33.9, 48.2),
(221, 2.1, 0.4, 1.9, 0.2, 0.5, 0.0, 56.5),
(222, 4.8, 1.2, 2.2, 0.3, 0.2, 31.3, 40.3),
(223, 6.4, 0.7, 3.6, 0.3, 0.4, 33.9, 48.2),
(224, 1.5, 0.3, 1.5, 0.2, 0.0, 33.3, 33.3),
(225, 1.7, 1.2, 1.2, 0.3, 0.3, 44.4, 36.4),
(226, 10.3, 3.4, 2.7, 1.0, 0.1, 41.4, 44.0),
(227, 2.8, 1.6, 2.0, 0.3, 0.3, 30.6, 50.0),
(228, 7.6, 5.2, 4.9, 1.0, 0.4, 36.4, 52.3),
(229, 6.3, 3.0, 3.3, 1.0, 0.2, 33.8, 48.4),
(230, 11.2, 6.7, 7.1, 1.1, 0.8, 0.0, 62.7),
(231, 9.3, 3.3, 2.6, 0.7, 0.1, 33.3, 37.8),
(232, 3.6, 1.1, 2.0, 0.3, 0.2, 32.1, 49.1),
(233, 3.6, 1.1, 2.0, 0.3, 0.2, 32.1, 49.1),
(234, 4.4, 1.0, 1.3, 0.2, 0.2, 21.4, 36.4),
(235, 3.1, 1.1, 0.9, 0.4, 0.0, 31.7, 36.4),
(236, 1.0, 0.5, 1.5, 0.0, 0.3, 0.0, 33.3);


INSERT INTO STAT VALUES 
(237, 5.6, 2.1, 2.8, 0.7, 0.5, 36.0, 44.7),
(238, 3.9, 1.1, 1.5, 0.3, 0.1, 28.6, 37.9),
(239, 3.1, 1.2, 2.3, 0.3, 0.3, 0.0, 44.0),
(240, 6.8, 1.1, 3.4, 0.6, 0.7, 29.4, 54.2),
(241, 2.2, 0.6, 1.0, 0.3, 0.1, 28.6, 31.4),
(242, 8.0, 1.1, 1.7, 0.5, 0.1, 38.3, 41.9),
(243, 8.2, 4.4, 4.1, 1.5, 0.4, 26.5, 56.8),
(244, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0),
(245, 0.4, 0.4, 0.4, 0.2, 0.0, 50.0, 33.3),
(246, 4.2, 1.4, 1.6, 0.4, 0.1, 32.4, 41.6),
(247, 5.5, 1.7, 1.5, 0.5, 0.1, 37.6, 42.5),
(248, 1.8, 3.1, 3.0, 0.2, 0.3, 0.0, 39.5),
(249, 2.5, 1.1, 1.5, 0.3, 0.3, 23.8, 47.1),
(250, 3.5, 3.9, 3.9, 0.8, 0.2, 38.9, 35.4);

