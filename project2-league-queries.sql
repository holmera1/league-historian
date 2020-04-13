-- League Historan Application: Stored Procedures
-- Derek Pang and Robert Holmes
-- CS 3265 01

-- Query to get all distinct patches from the dataset
SELECT DISTINCT version
FROM matches
ORDER BY INET_ATON(SUBSTRING_INDEX(CONCAT(version, '0.0'),'.',4)) DESC;

-- Procedure 1: 5 most played champs of the patch
DROP PROCEDURE IF EXISTS getChampsMostPlayed;
DELIMITER //
CREATE PROCEDURE getChampsMostPlayed(IN p_version VARCHAR(20))
BEGIN
	SELECT name
	FROM participants
	INNER JOIN champs ON participants.championid = champs.id
	LEFT JOIN matches ON participants.matchid = matches.id
	WHERE version = p_version
	GROUP BY name
	ORDER BY COUNT(*) DESC
	LIMIT 5;
END //

-- CALL getChampsMostPlayed('7.10');

-- Procedure 2: 5 least played champs of the patch
DROP PROCEDURE IF EXISTS getChampsLeastPlayed;
DELIMITER //
CREATE PROCEDURE getChampsLeastPlayed(IN p_version VARCHAR(20))
BEGIN
	SELECT name
	FROM participants
	INNER JOIN champs ON participants.championid = champs.id
	LEFT JOIN matches ON participants.matchid = matches.id
	WHERE version = p_version
	GROUP BY name
	ORDER BY COUNT(*) ASC
	LIMIT 5;
END //

-- CALL getChampsLeastPlayed('7.9');

-- Procedure 3: 5 most frequently banned champs of the patch
DROP PROCEDURE IF EXISTS getChampsMostBanned;
DELIMITER //
CREATE PROCEDURE getChampsMostBanned(IN p_version VARCHAR(20))
BEGIN
	SELECT name
	FROM teambans
	INNER JOIN champs ON teambans.championid = champs.id
	LEFT JOIN matches ON teambans.matchid = matches.id
	WHERE version = p_version
	GROUP BY name
	ORDER BY COUNT(*) DESC
	LIMIT 5;
END //

-- CALL getChampsMostBanned('7.10');

-- Procedure 4: 5 least frequently banned champs of the patch
DROP PROCEDURE IF EXISTS getChampsLeastBanned;
DELIMITER //
CREATE PROCEDURE getChampsLeastBanned(IN p_version VARCHAR(20))
BEGIN
	SELECT name
	FROM teambans
	INNER JOIN champs ON teambans.championid = champs.id
	LEFT JOIN matches ON teambans.matchid = matches.id
	WHERE version = p_version
	GROUP BY name
	ORDER BY COUNT(*) ASC
	LIMIT 5;
END //

-- CALL getChampsLeastBanned('7.9');

-- Procedure 5: 5 highest winrate champs of the patch
DROP PROCEDURE IF EXISTS getChampsBestWinrate;
DELIMITER //
CREATE PROCEDURE getChampsBestWinrate(IN p_version VARCHAR(20))
BEGIN
	SELECT name, TRUNCATE(((SUM(win)/COUNT(*))*100), 2) AS winrate
	FROM participants
	INNER JOIN champs ON participants.championid = champs.id
	INNER JOIN stats ON participants.id = stats.id
	LEFT JOIN matches ON participants.matchid = matches.id
	WHERE version = p_version
	GROUP BY name
	ORDER BY (SUM(win)/COUNT(*)) DESC
    LIMIT 5;
END //

-- CALL getChampsBestWinrate('7.9');

-- Procedure 6: 5 lowest win rate champs of the patch
DROP PROCEDURE IF EXISTS getChampsWorstWinrate;
DELIMITER //
CREATE PROCEDURE getChampsWorstWinrate(IN p_version VARCHAR(20))
BEGIN
	SELECT name, TRUNCATE(((SUM(win)/COUNT(*))*100), 2) AS winrate
	FROM participants
	INNER JOIN champs ON participants.championid = champs.id
	INNER JOIN stats ON participants.id = stats.id
	LEFT JOIN matches ON participants.matchid = matches.id
	WHERE version = p_version
	GROUP BY name
	ORDER BY (SUM(win)/COUNT(*)) ASC
    LIMIT 5;
END //

-- CALL getChampsWorstWinrate('7.10');

-- Procedure 7: Most purchased items of the patch
DROP PROCEDURE IF EXISTS getMostPopularItems2;
DELIMITER //
CREATE PROCEDURE getMostPopularItems2(IN p_version VARCHAR(20))
BEGIN
	SELECT name
	FROM allItems
    WHERE version = p_version
    GROUP BY name
    ORDER BY COUNT(*) DESC
    LIMIT 5;
END //

-- CALL getMostPopularItems2('7.6');