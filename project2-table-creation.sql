DROP DATABASE IF EXISTS league;
CREATE DATABASE league;
USE league;

-- CHAMPS
DROP TABLE IF EXISTS champs;
CREATE TABLE champs (
	name VARCHAR(20),
    id SMALLINT UNSIGNED,
    INDEX (name),
    CONSTRAINT pk_champid PRIMARY KEY(id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/champs.csv'
INTO TABLE champs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	name,
    id
);

-- MATCHES
DROP TABLE IF EXISTS matches;
CREATE TABLE matches (
	id MEDIUMINT UNSIGNED,
    gameid BIGINT UNSIGNED,
    platformid TEXT,
    queueid SMALLINT UNSIGNED,
    seasonid TINYINT UNSIGNED,
    duration SMALLINT UNSIGNED,
    creation TEXT,
    version VARCHAR(20),
    INDEX (version),
    CONSTRAINT pk_matchid PRIMARY KEY(id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/matches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	id,
    gameid,
    platformid,
    queueid,
    seasonid,
    duration,
    creation,
    version
);

-- Trim version numbers
SET SQL_SAFE_UPDATES =  0;
UPDATE matches
SET version = LEFT(version, 5), version = SUBSTR(version, 2), version = TRIM(TRAILING '.' FROM version);

-- STATS
DROP TABLE IF EXISTS stats;
CREATE TABLE stats (
	id MEDIUMINT UNSIGNED,
    win TINYINT UNSIGNED CHECK (win = 0 OR win = 1),
    item1 SMALLINT UNSIGNED,
    item2 SMALLINT UNSIGNED,
    item3 SMALLINT UNSIGNED,
    item4 SMALLINT UNSIGNED,
    item5 SMALLINT UNSIGNED,
    item6 SMALLINT UNSIGNED,
    trinket SMALLINT UNSIGNED,
    kills TINYINT UNSIGNED,
    deaths TINYINT UNSIGNED,
    assists TINYINT UNSIGNED,
    largestkillingspree TINYINT UNSIGNED,
    largestmultikill TINYINT UNSIGNED,
    killingsprees TINYINT UNSIGNED,
    longesttimespentliving SMALLINT UNSIGNED,
    doublekills TINYINT UNSIGNED,
    triplekills TINYINT UNSIGNED,
    quadrakills TINYINT UNSIGNED,
    pentakills TINYINT UNSIGNED,
    legendarykills TINYINT UNSIGNED,
    totdmgdealt MEDIUMINT UNSIGNED,
    magicdmgdealt MEDIUMINT UNSIGNED,
    physicaldmgdealt MEDIUMINT UNSIGNED,
    truedmgdealt MEDIUMINT UNSIGNED,
    largestcrit SMALLINT UNSIGNED,
    totdmgtochamp MEDIUMINT UNSIGNED,
    magicdmgtochamp MEDIUMINT UNSIGNED,
    physdmgtochamp MEDIUMINT UNSIGNED,
    truedmgtochamp MEDIUMINT UNSIGNED,
    totheal MEDIUMINT UNSIGNED,
    totunitshealed TINYINT UNSIGNED,
    dmgselfmit MEDIUMINT UNSIGNED,
    dmgtoobj MEDIUMINT UNSIGNED,
    dmgtoturrets SMALLINT UNSIGNED,
    visionscore TINYINT UNSIGNED,
    timecc TINYINT UNSIGNED,
    totdmgtaken MEDIUMINT UNSIGNED,
    magicdmgtaken MEDIUMINT UNSIGNED,
    physdmgtaken MEDIUMINT UNSIGNED,
    truedmgtaken MEDIUMINT UNSIGNED,
    goldearned MEDIUMINT UNSIGNED,
    goldspent MEDIUMINT UNSIGNED,
    turretkills TINYINT UNSIGNED,
    inhibkills TINYINT UNSIGNED,
    totminionskilled SMALLINT UNSIGNED,
    neutralminionskilled SMALLINT UNSIGNED,
    ownjunglekills SMALLINT UNSIGNED,
    enemyjunglekills SMALLINT UNSIGNED,
    totcctimedealt SMALLINT UNSIGNED,
    champlvl TINYINT UNSIGNED CHECK (champlvl <= 18),
    pinksbought TINYINT UNSIGNED,
    wardsbought TINYINT UNSIGNED,
    wardsplaced TINYINT UNSIGNED,
    wardskilled TINYINT UNSIGNED,
    firstblood TINYINT UNSIGNED,
    CONSTRAINT pk_playerid PRIMARY KEY(id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/stats1.csv'
INTO TABLE stats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	id,
    win,
    item1,
    item2,
    item3,
    item4,
    item5,
    item6,
    trinket,
    kills,
    deaths,
    assists,
    largestkillingspree,
    largestmultikill,
    killingsprees,
    longesttimespentliving,
    doublekills,
    triplekills,
    quadrakills,
    pentakills,
    legendarykills,
    totdmgdealt,
    magicdmgdealt,
    physicaldmgdealt,
    truedmgdealt,
    largestcrit,
    totdmgtochamp,
    magicdmgtochamp,
    physdmgtochamp,
    truedmgtochamp,
    totheal,
    totunitshealed,
    dmgselfmit,
    dmgtoobj,
    dmgtoturrets,
    visionscore,
    timecc,
    totdmgtaken,
    magicdmgtaken,
    physdmgtaken,
    truedmgtaken,
    goldearned,
    goldspent,
    turretkills,
    inhibkills,
    totminionskilled,
    neutralminionskilled,
    ownjunglekills,
    enemyjunglekills,
    totcctimedealt,
    champlvl,
    pinksbought,
    wardsbought,
    wardsplaced,
    wardskilled,
    firstblood
);

LOAD DATA INFILE 'c:/wamp64/tmp/stats2.csv'
INTO TABLE stats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	id,
    win,
    item1,
    item2,
    item3,
    item4,
    item5,
    item6,
    trinket,
    kills,
    deaths,
    assists,
    largestkillingspree,
    largestmultikill,
    killingsprees,
    longesttimespentliving,
    doublekills,
    triplekills,
    quadrakills,
    pentakills,
    legendarykills,
    totdmgdealt,
    magicdmgdealt,
    physicaldmgdealt,
    truedmgdealt,
    largestcrit,
    totdmgtochamp,
    magicdmgtochamp,
    physdmgtochamp,
    truedmgtochamp,
    totheal,
    totunitshealed,
    dmgselfmit,
    dmgtoobj,
    dmgtoturrets,
    visionscore,
    timecc,
    totdmgtaken,
    magicdmgtaken,
    physdmgtaken,
    truedmgtaken,
    goldearned,
    goldspent,
    turretkills,
    inhibkills,
    totminionskilled,
    neutralminionskilled,
    ownjunglekills,
    enemyjunglekills,
    totcctimedealt,
    champlvl,
    pinksbought,
    wardsbought,
    wardsplaced,
    wardskilled,
    firstblood
);

 -- PARTICIPANTS
DROP TABLE IF EXISTS participants;
CREATE TABLE participants (
	id MEDIUMINT UNSIGNED,
    matchid MEDIUMINT UNSIGNED,
    player TINYINT CHECK(player >= 1 AND player <= 10),
    championid SMALLINT UNSIGNED,
    ss1 TINYINT UNSIGNED,
    ss2 TINYINT UNSIGNED,
    role VARCHAR(15),
    position VARCHAR(15),
    CONSTRAINT pk_participantID PRIMARY KEY (id),
    CONSTRAINT fk_participantID FOREIGN KEY (id)
		REFERENCES stats (id),
	CONSTRAINT fk_pmatchID FOREIGN KEY (matchid)
		REFERENCES matches (id),
	CONSTRAINT fk_pchampID FOREIGN KEY (championid)
		REFERENCES champs (id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/participants.csv'
INTO TABLE participants
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	id,
    matchid,
    player,
    championid,
    ss1,
    ss2,
    role,
    position
);

-- TEAMBANS
DROP TABLE IF EXISTS teambans;
CREATE TABLE teambans (
	id MEDIUMINT UNSIGNED AUTO_INCREMENT,
	matchid MEDIUMINT UNSIGNED,
    teamid TINYINT UNSIGNED CHECK(teamid = 100 OR teamid = 200),
    championid SMALLINT UNSIGNED,
    banturn TINYINT UNSIGNED CHECK(banturn >= 1 AND banturn <= 10),
    CONSTRAINT pk_tbmatchID PRIMARY KEY (id),
    CONSTRAINT fk_tbmatchID FOREIGN KEY (matchid)
		REFERENCES matches (id),
    CONSTRAINT fk_tbchampID FOREIGN KEY (championid)
		REFERENCES champs (id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/teambans.csv'
INTO TABLE teambans
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    matchid,
    teamid,
    championid,
    banturn
);

-- TEAMSTATS
DROP TABLE IF EXISTS teamstats;
CREATE TABLE teamstats (
	id MEDIUMINT UNSIGNED AUTO_INCREMENT,
	matchid MEDIUMINT UNSIGNED,
    teamid TINYINT UNSIGNED CHECK(teamid = 100 OR teamid = 200),
    firstblood TINYINT UNSIGNED CHECK(firstblood >= 0 OR firstblood <= 1),
    firsttower TINYINT UNSIGNED CHECK(firsttower >= 0 OR firsttower <= 1),
    firstinhib TINYINT UNSIGNED CHECK(firstinhib >= 0 OR firstinhib <= 1),
    firstbaron TINYINT UNSIGNED CHECK(firstbaron >= 0 OR firstbaron <= 1),
    firstdragon TINYINT UNSIGNED CHECK(firstdragon >= 0 OR firstdragon <= 1),
    firstharry TINYINT UNSIGNED CHECK(firstharry >= 0 OR firstharry <= 1),
    towerkills TINYINT UNSIGNED CHECK(towerkills >= 0 OR towerkills <= 1),
    inhibkills TINYINT UNSIGNED CHECK(inhibkills >= 0 OR inhibkills <= 13),
    baronkills TINYINT UNSIGNED CHECK(baronkills >= 0 OR baronkills <= 5),
    dragonkills TINYINT UNSIGNED CHECK(dragonkills >= 0 OR dragonkills <= 7),
    harrykills TINYINT UNSIGNED CHECK(harrykills >= 0 OR harrykills <= 2),
	CONSTRAINT pk_tsmatchID PRIMARY KEY (id),
    CONSTRAINT fk_tsmatchID FOREIGN KEY (matchid)
		REFERENCES matches (id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/teamstats.csv'
INTO TABLE teamstats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	matchid,
    teamid,
    firstblood,
    firsttower,
    firstinhib,
    firstbaron,
    firstdragon,
    firstharry,
    towerkills,
    inhibkills,
    baronkills,
    dragonkills,
    harrykills
);

-- ITEMS
DROP TABLE IF EXISTS items;
CREATE TABLE items (
	name TEXT,
	id SMALLINT UNSIGNED,
    CONSTRAINT pk_itemid PRIMARY KEY (id)
);

LOAD DATA INFILE 'c:/wamp64/tmp/items.csv'
INTO TABLE items
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	name,
    id
);