-- source Z:\3B\ECE 356\Lab4\part_a_stats.sql
SELECT COUNT(DISTINCT playerID) "num_instances" FROM master;
SELECT COUNT(DISTINCT playerID) "num_nominated" FROM halloffame;