-- source Z:\3B\ECE 356\Lab4\part_b_stats.sql
SELECT COUNT(DISTINCT playerID) "num_nominated" FROM halloffame;
SELECT COUNT(DISTINCT playerID) "num_inducted" FROM halloffame WHERE inducted="Y";