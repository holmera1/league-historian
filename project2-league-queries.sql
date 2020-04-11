-- Query to get all distinct patches from the dataset
SELECT DISTINCT version
FROM matches;

-- Top 5 most played champs of the patch
SELECT name, COUNT(*), version
FROM participants
INNER JOIN champs ON participants.championid = champs.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Top 5 less played champs of the patch
SELECT name, COUNT(*), version
FROM participants
INNER JOIN champs ON participants.championid = champs.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY name
ORDER BY COUNT(*) ASC
LIMIT 5;

-- Top 5 most banned champs of the patch
SELECT name, COUNT(*), version
FROM teambans
INNER JOIN champs ON teambans.championid = champs.id
LEFT JOIN matches ON teambans.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Top 5 least banned champs of the patch
SELECT name, COUNT(*), version
FROM teambans
INNER JOIN champs ON teambans.championid = champs.id
LEFT JOIN matches ON teambans.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY name
ORDER BY COUNT(*) ASC
LIMIT 5;

-- Highest win rate champs of the patch
SELECT name, SUM(win), COUNT(*), TRUNCATE(((SUM(win)/COUNT(*))*100), 2) AS winrate
FROM participants
INNER JOIN champs ON participants.championid = champs.id
INNER JOIN stats ON participants.id = stats.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY name
ORDER BY (SUM(win)/COUNT(*)) DESC;

-- Lowest win rate champs of the patch
SELECT name, SUM(win), COUNT(*), TRUNCATE(((SUM(win)/COUNT(*))*100), 2) AS winrate
FROM participants
INNER JOIN champs ON participants.championid = champs.id
INNER JOIN stats ON participants.id = stats.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY name
ORDER BY SUM(win) ASC;

-- Most used items of the patch
SELECT item1, COUNT(*)
FROM stats
INNER JOIN participants ON stats.id = participants.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY item1
ORDER BY COUNT(*) DESC;

SELECT item2, COUNT(*)
FROM stats
INNER JOIN participants ON stats.id = participants.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY item2
ORDER BY COUNT(*) DESC;

SELECT item3, COUNT(*)
FROM stats
INNER JOIN participants ON stats.id = participants.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY item3
ORDER BY COUNT(*) DESC;

SELECT item4, COUNT(*)
FROM stats
INNER JOIN participants ON stats.id = participants.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY item4
ORDER BY COUNT(*) DESC;

SELECT item5, COUNT(*)
FROM stats
INNER JOIN participants ON stats.id = participants.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY item5
ORDER BY COUNT(*) DESC;

SELECT item6, COUNT(*)
FROM stats
INNER JOIN participants ON stats.id = participants.id
LEFT JOIN matches ON participants.matchid = matches.id
WHERE version = '\"7.10.187.9675\"'
GROUP BY item6
ORDER BY COUNT(*) DESC;



SELECT items1.item, COUNT(*)
FROM
(	
	SELECT item1 AS item
	FROM stats
	INNER JOIN participants ON stats.id = participants.id
	LEFT JOIN matches ON participants.matchid = matches.id
	WHERE version = '\"7.10.187.9675\"'
	GROUP BY item1
	ORDER BY COUNT(*) DESC
) AS items1 
INNER JOIN 
(
	SELECT item2 AS item, 
	FROM stats
	INNER JOIN participants ON stats.id = participants.id
	LEFT JOIN matches ON participants.matchid = matches.id
	WHERE version = '\"7.10.187.9675\"'
	GROUP BY item2
	ORDER BY COUNT(*) DESC
) AS items2 ON items1.item = items2.item

GROUP BY item
ORDER BY COUNT(*) DESC;






