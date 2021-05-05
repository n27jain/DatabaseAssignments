-- source Z:\3B\ECE 356\Lab4\part_b.sql

-- SELECT COUNT(DISTINCT playerID) "num_nominated" FROM halloffame;
-- SELECT COUNT(DISTINCT playerID) "num_inducted" FROM halloffame WHERE inducted="Y";

SELECT 
	"playerID",
	"OPS",
	"OBS",
	"SLG",
	"totalRuns",
	"IP",
	"ERA",
	"IPouts",
	"R",
	"BB",
	"H",
	"WHIP",
	"inducted"
UNION ALL (	
	SELECT DISTINCT
		playerID,
		IFNULL(OBS + SLG, 0) OPS,
		IFNULL(OBS, 0) OBS,
		IFNULL(SLG, 0) SLG,
		IFNULL(totalRuns, 0) totalRuns ,
		IFNULL(IP, 0) IP,
		IFNULL(ERA, 0) ERA,
		IFNULL(IPouts, 0) IPouts,
		IFNULL(R, 0) R,
		IFNULL(BB, 0)  BB,
		IFNULL(H, 0) H,
		IFNULL(WHIP, 0) WHIP,
		inducted='Y' N
	FROM (
		SELECT
			playerID,
			inducted 
		FROM halloffame
		WHERE playerID NOT IN (
			SELECT playerID FROM halloffame WHERE inducted = "Y"
		) UNION (
			SELECT playerID, inducted FROM halloffame WHERE inducted = "Y"
		)
	) filterHallOfFame LEFT OUTER JOIN (
		-- Get pitcher stats
		SELECT DISTINCT
			playerID ,
			IFNULL(SUM(IPouts) / 3, 0) IP,
			IFNULL(27 * SUM(R) / SUM(IPouts), 0) ERA,
			SUM(IPouts) IPouts,
			SUM(R) R,
			SUM(BB) BB,
			SUM(H) H,
		IFNULL(3 * (SUM(BB) + SUM(H)) / SUM(IPouts), 0) WHIP
		FROM pitching
		WHERE IPouts != 0
		GROUP BY playerID
	) pitcherStats USING(playerID) LEFT OUTER JOIN (
		-- Get batter stats
		SELECT DISTINCT playerID,
			IFNULL((H + BB + HBP) / (AB + BB + HBP + SF), 0) OBS,
			IFNULL((1B + 2 * 2B + 3 * 3B + 4 * HR) / AB, 0) SLG,
			IFNULL(RBI, 0) RBI,
			IFNULL(totalRuns, 0) totalRuns
		FROM (
			SELECT DISTINCT
				playerID,
				SUM(H  ) H,
				SUM(BB ) BB,
				SUM(HBP) HBP,
				SUM(AB ) AB,
				SUM(SF ) SF,
				SUM(2B ) 2B,
				SUM(3B ) 3B,
				SUM(HR ) HR,
				SUM(R  ) totalRuns,
				SUM(RBI) RBI,
				IFNULL(SUM(H) - (SUM(2B) + SUM(3B) + SUM(HR)) , 0) 1B
			FROM batting
			GROUP BY playerID
		) filteredBatterStats
	) batterStats USING(playerID)
)
-- output to CSV
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/part_b.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
