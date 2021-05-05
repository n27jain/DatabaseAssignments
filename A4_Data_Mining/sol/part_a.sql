-- source Z:\3B\ECE 356\Lab4\part_a.sql

-- SELECT COUNT(DISTINCT playerID) "num_instances" FROM master;
-- SELECT COUNT(DISTINCT playerID) "num_nominated" FROM halloffame;

SELECT
	-- label data with headers
	"playerID",
	"bat_pitch_ratio",
	"percent_games_batted",
	"percent_games_pitched",
	"num_seasons",
	"games_per_season",
	"dead",
	"inactive",
	"allstar_games_played",
	"hit_rate",
	"homerun_rate",
	"strikeout_rate",
	"pitch_hit",
	"pitch_outs",
	"nominated"
UNION ALL
(	
	-- aggregate data
	SELECT DISTINCT
		playerID,
		IFNULL(A.G_batting/A.G_pitching, 0) bat_pitch_ratio,
		IFNULL(A.G_batting, 0)/A.G_all r_batting,
		IFNULL(A.G_pitching, 0)/A.G_all r_pitching,
		IFNULL(A.SN, 0) ASN,
		IFNULL(A.G_all/A.SN, 0) AGS,
		M.dead dead,
		M.inactive inactive,
		IFNULL(S.GP,  0) SGP,
		IFNULL(B.H ,  0) BH,
		IFNULL(B.HR,  0) BHR,
		IFNULL(B.SO,  0) BSO,
		IFNULL(P.H ,  0) PH,
		IFNULL(P.O ,  0) FO,
		ISNULL(halloffame.inducted) N
	FROM (
		(
			SELECT
				playerID,
				COUNT(DISTINCT yearID) SN,
				SUM(G_all) G_all,
				SUM(G_batting) G_batting,
				SUM(G_p) G_pitching
			FROM appearances
			GROUP BY playerID
		) A JOIN (
			SELECT
				playerID,
				LENGTH(deathYear)!=0 dead,
				LENGTH(finalGame)!=0 inactive
			FROM master
		) M USING(playerID) LEFT OUTER JOIN (
			-- Get data from All Star table
			SELECT DISTINCT
				playerID,
				SUM(GP) GP
			FROM allstarfull
			GROUP BY playerID
		) S USING(playerID) LEFT OUTER JOIN (
			-- Get data from batting table
			SELECT
				playerID,
				IFNULL(SUM(batting.H )/SUM(batting.AB), 0) H,
				IFNULL(SUM(batting.HR)/SUM(batting.R ), 0) HR,
				IFNULL(SUM(batting.SO)/SUM(batting.AB), 0) SO
			FROM batting
			GROUP BY playerID
		) B USING(playerID) LEFT OUTER JOIN (
			-- get data from pitching table
			SELECT
				playerID,
				SUM(pitching.H) H,
				SUM(pitching.IPOuts) O
			FROM pitching
			GROUP BY playerID
		) P USING(playerID) LEFT OUTER JOIN (
			-- get verification data on whether the player was nominated
			halloffame
		) USING(playerID)
	)
)
-- output to CSV
-- output path is given by this command:
-- SHOW VARIABLES LIKE "secure_file_priv";
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/part_a.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';