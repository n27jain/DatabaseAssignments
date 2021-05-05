SET sql_mode = ""; # reads double quotes as characters

/*
DROP DATABASE IF EXISTS yelp_db_small; # Drop the database if already available. If you plan to run this code more than once, make sure to remove this line as it will take a long time to excute
CREATE DATABASE yelp_db_small; # Creates the database with the shown name. Make sure you use the exact spelling for the name of the DB
use yelp_db_small; # Chooses the DB yelp_db_small. The rest of the work will be applied to this chosen DB
*/

DROP TABLE IF EXISTS `Business`; # Drops the table Business if it already exists
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

#Start creating the table Business by defining the table name and its attributes. Make sure to determine the domain (type) for each attribute
CREATE TABLE `Business` (
  `address` varchar(70) DEFAULT NULL,
  `attributes` int(11) DEFAULT NULL,
  `attributes_AcceptsInsurance` varchar(5) DEFAULT NULL,
    `attributes_AgesAllowed` VARCHAR(7) DEFAULT NULL,
  `attributes_Alcohol` varchar(13) DEFAULT NULL,
  `attributes_Ambience` varchar(160) DEFAULT NULL,
  `attributes_BYOB` varchar(5) DEFAULT NULL,
  `attributes_BYOBCorkage` varchar(11) DEFAULT NULL,
  `attributes_BestNights` varchar(127) DEFAULT NULL,
  `attributes_BikeParking` varchar(5) DEFAULT NULL,
  `attributes_BusinessAcceptsBitcoin` varchar(5) DEFAULT NULL,
  `attributes_BusinessAcceptsCreditCards` varchar(3000) DEFAULT NULL,
  `attributes_BusinessParking` varchar(3000) DEFAULT NULL,
  `attributes_ByAppointmentOnly` varchar(5) DEFAULT NULL,
  `attributes_Caters` varchar(5) DEFAULT NULL,
  `attributes_CoatCheck` varchar(5) DEFAULT NULL,
  `attributes_Corkage` varchar(5) DEFAULT NULL,
  `attributes_DietaryRestrictions` varchar(20) DEFAULT NULL,
  `attributes_DogsAllowed` varchar(5) DEFAULT NULL,
  `attributes_DriveThru` varchar(5) DEFAULT NULL,
  `attributes_GoodForDancing` varchar(5) DEFAULT NULL,
  `attributes_GoodForKids` varchar(5) DEFAULT NULL,
  `attributes_GoodForMeal` varchar(108) DEFAULT NULL,
  `attributes_HairSpecializesIn` varchar(153) DEFAULT NULL,
  `attributes_HappyHour` varchar(5) DEFAULT NULL,
  `attributes_HasTV` varchar(5) DEFAULT NULL,
  `attributes_Music` varchar(126) DEFAULT NULL,
  `attributes_NoiseLevel` varchar(9) DEFAULT NULL,
  `attributes_Open24Hours` varchar(9) DEFAULT NULL,
  `attributes_OutdoorSeating` varchar(5) DEFAULT NULL,
  `attributes_RestaurantsAttire` varchar(6) DEFAULT NULL,
  `attributes_RestaurantsCounterService` varchar(30) DEFAULT NULL,
  `attributes_RestaurantsDelivery` varchar(5) DEFAULT NULL,
  `attributes_RestaurantsGoodForGroups` varchar(5) DEFAULT NULL,
  `attributes_RestaurantsPriceRange2` int(11) DEFAULT NULL,
  `attributes_RestaurantsReservations` varchar(5) DEFAULT NULL,
  `attributes_RestaurantsTableService` varchar(5) DEFAULT NULL,
  `attributes_RestaurantsTakeOut` varchar(5) DEFAULT NULL,
  `attributes_Smoking` varchar(7) DEFAULT NULL,
  `attributes_WheelchairAccessible` varchar(5) DEFAULT NULL,
  `attributes_WiFi` varchar(4) DEFAULT NULL,
  `business_id` varchar(22) NOT NULL,
  `categories` varchar(304) DEFAULT NULL,
  `city` varchar(31) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `hours_Friday` varchar(11) DEFAULT NULL,
  `hours_Monday` varchar(11) DEFAULT NULL,
  `hours_Saturday` varchar(11) DEFAULT NULL,
  `hours_Sunday` varchar(11) DEFAULT NULL,
  `hours_Thursday` varchar(11) DEFAULT NULL,
  `hours_Tuesday` varchar(11) DEFAULT NULL,
  `hours_Wednesday` varchar(11) DEFAULT NULL,
  `is_open` int(11) DEFAULT NULL,
  `latitude` decimal(12,10) DEFAULT NULL,
  `longitude` decimal(13,10) DEFAULT NULL,
  `name` varchar(63) DEFAULT NULL,
  `neighborhood` varchar(36) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `review_count` int(11) DEFAULT NULL,
  `stars` decimal(2,1) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL
);

DESCRIBE Business; # Returns the attributes created in table business. Use this command to ensure the table was created correctly
LOAD DATA LOCAL INFILE 'yelp_data_business.csv' INTO TABLE Business # Imports the data from a CSV file into table Business. 
															# You need to insert the path to file. Make sure to add ".csv" at the
                                                            # end of your files name. An example of path to file is
                                                            # C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/yelp_academic_dataset_business_small_2.csv
FIELDS TERMINATED BY ',' ENCLOSED BY '"' # Informs sql to read data until it sees a ","
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES; # Ignores the first line in the CSV file which is just the names of the attributes


#the following is an example of a simple querry. Use it to check if the data was loaded correctly
#SELECT address, city, state FROM Business WHERE business_id = ('bBUMib8l6Me1ZB1_Qkezkg');

DROP TABLE IF EXISTS `Checkin`; # Drops the table Checkin if it already exists

#Start creating the table Checkin by defining the table name and its attributes. Make sure to determine the domain (type) for each attribute
CREATE TABLE `Checkin` (
  `business_id` varchar(100) DEFAULT NULL,
  `time_Fri_0` numeric(3,1) DEFAULT NULL,
  `time_Fri_1` numeric(3,1) DEFAULT NULL,
  `time_Fri_10` numeric(3,1) DEFAULT NULL,
  `time_Fri_11` numeric(3,1) DEFAULT NULL,
  `time_Fri_12` numeric(3,1) DEFAULT NULL,
  `time_Fri_13` numeric(3,1) DEFAULT NULL,
  `time_Fri_14` numeric(3,1) DEFAULT NULL,
  `time_Fri_15` numeric(3,1) DEFAULT NULL,
  `time_Fri_16` numeric(3,1) DEFAULT NULL,
  `time_Fri_17` numeric(3,1) DEFAULT NULL,
  `time_Fri_18` numeric(3,1) DEFAULT NULL,
  `time_Fri_19` numeric(3,1) DEFAULT NULL,
  `time_Fri_2` numeric(3,1) DEFAULT NULL,
  `time_Fri_20` numeric(3,1) DEFAULT NULL,
  `time_Fri_21` numeric(3,1) DEFAULT NULL,
  `time_Fri_22` numeric(3,1) DEFAULT NULL,
  `time_Fri_23` numeric(3,1) DEFAULT NULL,
  `time_Fri_3` numeric(3,1) DEFAULT NULL,
  `time_Fri_4` numeric(3,1) DEFAULT NULL,
  `time_Fri_5` numeric(2,1) DEFAULT NULL,
  `time_Fri_6` numeric(2,1) DEFAULT NULL,
  `time_Fri_7` numeric(2,1) DEFAULT NULL,
  `time_Fri_8` numeric(2,1) DEFAULT NULL,
  `time_Fri_9` numeric(3,1) DEFAULT NULL,
  `time_Mon_0` numeric(3,1) DEFAULT NULL,
  `time_Mon_1` numeric(3,1) DEFAULT NULL,
  `time_Mon_10` numeric(3,1) DEFAULT NULL,
  `time_Mon_11` numeric(3,1) DEFAULT NULL,
  `time_Mon_12` numeric(3,1) DEFAULT NULL,
  `time_Mon_13` numeric(3,1) DEFAULT NULL,
  `time_Mon_14` numeric(3,1) DEFAULT NULL,
  `time_Mon_15` numeric(3,1) DEFAULT NULL,
  `time_Mon_16` numeric(3,1) DEFAULT NULL,
  `time_Mon_17` numeric(3,1) DEFAULT NULL,
  `time_Mon_18` numeric(3,1) DEFAULT NULL,
  `time_Mon_19` numeric(3,1) DEFAULT NULL,
  `time_Mon_2` numeric(3,1) DEFAULT NULL,
  `time_Mon_20` numeric(3,1) DEFAULT NULL,
  `time_Mon_21` numeric(3,1) DEFAULT NULL,
  `time_Mon_22` numeric(3,1) DEFAULT NULL,
  `time_Mon_23` numeric(3,1) DEFAULT NULL,
  `time_Mon_3` numeric(2,1) DEFAULT NULL,
  `time_Mon_4` numeric(2,1) DEFAULT NULL,
  `time_Mon_5` numeric(2,1) DEFAULT NULL,
  `time_Mon_6` numeric(2,1) DEFAULT NULL,
  `time_Mon_7` numeric(2,1) DEFAULT NULL,
  `time_Mon_8` numeric(2,1) DEFAULT NULL,
  `time_Mon_9` numeric(3,1) DEFAULT NULL,
  `time_Sat_0` numeric(3,1) DEFAULT NULL,
  `time_Sat_1` numeric(3,1) DEFAULT NULL,
  `time_Sat_10` numeric(3,1) DEFAULT NULL,
  `time_Sat_11` numeric(3,1) DEFAULT NULL,
  `time_Sat_12` numeric(3,1) DEFAULT NULL,
  `time_Sat_13` numeric(3,1) DEFAULT NULL,
  `time_Sat_14` numeric(3,1) DEFAULT NULL,
  `time_Sat_15` numeric(3,1) DEFAULT NULL,
  `time_Sat_16` numeric(3,1) DEFAULT NULL,
  `time_Sat_17` numeric(3,1) DEFAULT NULL,
  `time_Sat_18` numeric(3,1) DEFAULT NULL,
  `time_Sat_19` numeric(3,1) DEFAULT NULL,
  `time_Sat_2` numeric(3,1) DEFAULT NULL,
  `time_Sat_20` numeric(3,1) DEFAULT NULL,
  `time_Sat_21` numeric(3,1) DEFAULT NULL,
  `time_Sat_22` numeric(3,1) DEFAULT NULL,
  `time_Sat_23` numeric(3,1) DEFAULT NULL,
  `time_Sat_3` numeric(3,1) DEFAULT NULL,
  `time_Sat_4` numeric(3,1) DEFAULT NULL,
  `time_Sat_5` numeric(3,1) DEFAULT NULL,
  `time_Sat_6` numeric(2,1) DEFAULT NULL,
  `time_Sat_7` numeric(2,1) DEFAULT NULL,
  `time_Sat_8` numeric(2,1) DEFAULT NULL,
  `time_Sat_9` numeric(3,1) DEFAULT NULL,
  `time_Sun_0` numeric(3,1) DEFAULT NULL,
  `time_Sun_1` numeric(3,1) DEFAULT NULL,
  `time_Sun_10` numeric(3,1) DEFAULT NULL,
  `time_Sun_11` numeric(3,1) DEFAULT NULL,
  `time_Sun_12` numeric(3,1) DEFAULT NULL,
  `time_Sun_13` numeric(3,1) DEFAULT NULL,
  `time_Sun_14` numeric(3,1) DEFAULT NULL,
  `time_Sun_15` numeric(3,1) DEFAULT NULL,
  `time_Sun_16` numeric(3,1) DEFAULT NULL,
  `time_Sun_17` numeric(3,1) DEFAULT NULL,
  `time_Sun_18` numeric(3,1) DEFAULT NULL,
  `time_Sun_19` numeric(3,1) DEFAULT NULL,
  `time_Sun_2` numeric(3,1) DEFAULT NULL,
  `time_Sun_20` numeric(3,1) DEFAULT NULL,
  `time_Sun_21` numeric(3,1) DEFAULT NULL,
  `time_Sun_22` numeric(3,1) DEFAULT NULL,
  `time_Sun_23` numeric(3,1) DEFAULT NULL,
  `time_Sun_3` numeric(3,1) DEFAULT NULL,
  `time_Sun_4` numeric(3,1) DEFAULT NULL,
  `time_Sun_5` numeric(3,1) DEFAULT NULL,
  `time_Sun_6` numeric(3,1) DEFAULT NULL,
  `time_Sun_7` numeric(2,1) DEFAULT NULL,
  `time_Sun_8` numeric(2,1) DEFAULT NULL,
  `time_Sun_9` numeric(3,1) DEFAULT NULL,
  `time_Thu_0` numeric(3,1) DEFAULT NULL,
  `time_Thu_1` numeric(3,1) DEFAULT NULL,
  `time_Thu_10` numeric(3,1) DEFAULT NULL,
  `time_Thu_11` numeric(3,1) DEFAULT NULL,
  `time_Thu_12` numeric(3,1) DEFAULT NULL,
  `time_Thu_13` numeric(3,1) DEFAULT NULL,
  `time_Thu_14` numeric(3,1) DEFAULT NULL,
  `time_Thu_15` numeric(3,1) DEFAULT NULL,
  `time_Thu_16` numeric(3,1) DEFAULT NULL,
  `time_Thu_17` numeric(3,1) DEFAULT NULL,
  `time_Thu_18` numeric(3,1) DEFAULT NULL,
  `time_Thu_19` numeric(3,1) DEFAULT NULL,
  `time_Thu_2` numeric(3,1) DEFAULT NULL,
  `time_Thu_20` numeric(3,1) DEFAULT NULL,
  `time_Thu_21` numeric(3,1) DEFAULT NULL,
  `time_Thu_22` numeric(3,1) DEFAULT NULL,
  `time_Thu_23` numeric(3,1) DEFAULT NULL,
  `time_Thu_3` numeric(3,1) DEFAULT NULL,
  `time_Thu_4` numeric(2,1) DEFAULT NULL,
  `time_Thu_5` numeric(2,1) DEFAULT NULL,
  `time_Thu_6` numeric(2,1) DEFAULT NULL,
  `time_Thu_7` numeric(2,1) DEFAULT NULL,
  `time_Thu_8` numeric(2,1) DEFAULT NULL,
  `time_Thu_9` numeric(3,1) DEFAULT NULL,
  `time_Tue_0` numeric(3,1) DEFAULT NULL,
  `time_Tue_1` numeric(3,1) DEFAULT NULL,
  `time_Tue_10` numeric(3,1) DEFAULT NULL,
  `time_Tue_11` numeric(3,1) DEFAULT NULL,
  `time_Tue_12` numeric(3,1) DEFAULT NULL,
  `time_Tue_13` numeric(3,1) DEFAULT NULL,
  `time_Tue_14` numeric(3,1) DEFAULT NULL,
  `time_Tue_15` numeric(3,1) DEFAULT NULL,
  `time_Tue_16` numeric(3,1) DEFAULT NULL,
  `time_Tue_17` numeric(3,1) DEFAULT NULL,
  `time_Tue_18` numeric(3,1) DEFAULT NULL,
  `time_Tue_19` numeric(3,1) DEFAULT NULL,
  `time_Tue_2` numeric(3,1) DEFAULT NULL,
  `time_Tue_20` numeric(3,1) DEFAULT NULL,
  `time_Tue_21` numeric(3,1) DEFAULT NULL,
  `time_Tue_22` numeric(3,1) DEFAULT NULL,
  `time_Tue_23` numeric(3,1) DEFAULT NULL,
  `time_Tue_3` numeric(3,1) DEFAULT NULL,
  `time_Tue_4` numeric(2,1) DEFAULT NULL,
  `time_Tue_5` numeric(2,1) DEFAULT NULL,
  `time_Tue_6` numeric(2,1) DEFAULT NULL,
  `time_Tue_7` numeric(2,1) DEFAULT NULL,
  `time_Tue_8` numeric(3,1) DEFAULT NULL,
  `time_Tue_9` numeric(3,1) DEFAULT NULL,
  `time_Wed_0` numeric(3,1) DEFAULT NULL,
  `time_Wed_1` numeric(3,1) DEFAULT NULL,
  `time_Wed_10` numeric(3,1) DEFAULT NULL,
  `time_Wed_11` numeric(3,1) DEFAULT NULL,
  `time_Wed_12` numeric(3,1) DEFAULT NULL,
  `time_Wed_13` numeric(3,1) DEFAULT NULL,
  `time_Wed_14` numeric(3,1) DEFAULT NULL,
  `time_Wed_15` numeric(3,1) DEFAULT NULL,
  `time_Wed_16` numeric(3,1) DEFAULT NULL,
  `time_Wed_17` numeric(3,1) DEFAULT NULL,
  `time_Wed_18` numeric(3,1) DEFAULT NULL,
  `time_Wed_19` numeric(3,1) DEFAULT NULL,
  `time_Wed_2` numeric(3,1) DEFAULT NULL,
  `time_Wed_20` numeric(3,1) DEFAULT NULL,
  `time_Wed_21` numeric(3,1) DEFAULT NULL,
  `time_Wed_22` numeric(3,1) DEFAULT NULL,
  `time_Wed_23` numeric(3,1) DEFAULT NULL,
  `time_Wed_3` numeric(3,1) DEFAULT NULL,
  `time_Wed_4` numeric(2,1) DEFAULT NULL,
  `time_Wed_5` numeric(2,1) DEFAULT NULL,
  `time_Wed_6` numeric(2,1) DEFAULT NULL,
  `time_Wed_7` numeric(2,1) DEFAULT NULL,
  `time_Wed_8` numeric(2,1) DEFAULT NULL,
  `time_Wed_9` numeric(3,1) DEFAULT NULL
);

show tables;

DESCRIBE Checkin; # Returns the attributes created in table Checkin. Use this command to ensure the table was created correctly
LOAD DATA LOCAL INFILE 'yelp_data_checkin.csv' INTO TABLE Checkin # Imports the data from a CSV file into table Checkin. 
															# You need to insert the path to file. Make sure to add ".csv" at the
                                                            # end of your files name. An example of path to file is
                                                            # C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/yelp_academic_dataset_checkin_small_2.csv
FIELDS TERMINATED BY ',' ENCLOSED BY '"' # Informs sql to read data until it sees a ","
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES; # Ignores the first line in the CSV file which is just the names of the attributes

# The following is an example of a simple querry. Use it to check if the data was loaded correctly
#SELECT time_mon_12, time_wed_12 FROM Checkin LIMIT 5;


DROP TABLE IF EXISTS `Photo`;# Drops the table Photo if it already exists

#Start creating the table Photo by defining the table name and its attributes. Make sure to determine the domain (type) for each attribute
CREATE TABLE `Photo` (
    `business_id` VARCHAR(200) NOT NULL,
    `caption` VARCHAR(140) DEFAULT NULL,
    `label` VARCHAR(70) DEFAULT NULL,
    `photo_id` VARCHAR(200) NOT NULL
);


DESCRIBE Photo; # Returns the attributes created in table Photo. Use this command to ensure the table was created correctly
LOAD DATA LOCAL INFILE 'yelp_data_photo.csv' INTO TABLE Photo # Imports the data from a CSV file into table Photo. 
															# You need to insert the path to file. Make sure to add ".csv" at the
                                                            # end of your files name. An example of path to file is
                                                            # C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/yelp_academic_dataset_photo_small_2.csv
character set latin1
FIELDS TERMINATED BY ',' ENCLOSED BY '"'# Informs sql to read data until it sees a ","
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES; # Ignores the first line in the CSV file which is just the names of the attributes

#the following is an example of a simple querry. Use it to check if the data was loaded correctly
#SELECT * FROM Photo LIMIT 5;


DROP TABLE IF EXISTS `Review`;# Drops the table Review if it already exists

#Start creating the table Review by defining the table name and its attributes. Make sure to determine the domain (type) for each attribute

CREATE TABLE `Review`(
    `business_id` VARCHAR(22) NOT NULL,
    `cool` INT(10),
    `date` DATETIME,
    `funny` INT(10),
    `review_id` VARCHAR(22) NOT NULL,
    `stars` INT(10),
    `text` VARCHAR(4998) DEFAULT NULL,
    `useful` INT(10),
    `user_id` VARCHAR(22) NOT NULL
);

DESCRIBE Review; # Returns the attributes created in table Photo. Use this command to ensure the table was created correctly
LOAD DATA LOCAL INFILE 'yelp_data_review.csv' INTO TABLE Review # Imports the data from a CSV file into table Review. 
															# You need to insert the path to file. Make sure to add ".csv" at the
                                                            # end of your files name. An example of path to file is
                                                            # C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/yelp_academic_dataset_review_small_2.csv
character set latin1
FIELDS TERMINATED BY ',' ENCLOSED BY '"'# Informs sql to read data until it sees a ","
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES; # Ignores the first line in the CSV file which is just the names of the attributes

#the following is an example of a simple querry. Use it to check if the data was loaded correctly
#SELECT * FROM Review LIMIT 5;


DROP TABLE IF EXISTS `Tip`; #Drops the table Tip if it already exists

#Start creating the table Tip by defining the table name and its attributes. Make sure to determine the domain (type) for each attribute


CREATE TABLE `Tip` (
    `business_id` VARCHAR(22) NOT NULL,
    `date` DATETIME DEFAULT NULL,
    `likes` INT(10) DEFAULT NULL,
    `text` VARCHAR(498) DEFAULT NULL,
    `user_id` VARCHAR(22) NOT NULL
);
DESCRIBE Tip; # Returns the attributes created in table Tip. Use this command to ensure the table was created correctly
LOAD DATA LOCAL INFILE 'yelp_data_tip.csv' INTO TABLE Tip # Imports the data from a CSV file into table Tip. 
															# You need to insert the path to file. Make sure to add ".csv" at the
                                                            # end of your files name. An example of path to file is
                                                            # C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/yelp_academic_dataset_tip_small_2.csv
character set latin1
FIELDS TERMINATED BY ',' ENCLOSED BY '"'# Informs sql to read data until it sees a ","
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES; # Ignores the first line in the CSV file which is just the names of the attributes

#the following is an example of a simple querry. Use it to check if the data was loaded correctly
#SELECT * FROM Tip LIMIT 5;


DROP TABLE IF EXISTS `User_data`; #Drops the table User_data if it already exists

#Start creating the table User_data by defining the table name and its attributes. Make sure to determine the domain (type) for each attribute
CREATE TABLE `User_data` (
  `average_stars` decimal(3,2) DEFAULT NULL,
  `compliment_cool` int(11) DEFAULT NULL,
  `compliment_cute` int(11) DEFAULT NULL,
  `compliment_funny` int(11) DEFAULT NULL,
  `compliment_hot` int(11) DEFAULT NULL,
  `compliment_list` int(11) DEFAULT NULL,
  `compliment_more` int(11) DEFAULT NULL,
  `compliment_note` int(11) DEFAULT NULL,
  `compliment_photos` int(11) DEFAULT NULL,
  `compliment_plain` int(11) DEFAULT NULL,
  `compliment_profile` int(11) DEFAULT NULL,
  `compliment_writer` int(11) DEFAULT NULL,
  `cool` int(11) DEFAULT NULL,
  `elite` varchar(28) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `friends` varchar(11758) DEFAULT NULL,
  `funny` int(11) DEFAULT NULL,
  `name` varchar(22) DEFAULT NULL,
  `review_count` int(11) DEFAULT NULL,
  `useful` int(11) DEFAULT NULL,
  `user_id` varchar(22) DEFAULT NULL,
  `yelping_since` datetime DEFAULT NULL
) ;
DESCRIBE User_data; # Returns the attributes created in table User_data. Use this command to ensure the table was created correctly
LOAD DATA LOCAL INFILE 'yelp_data_user.csv' INTO TABLE User_data # Imports the data from a CSV file into table User_data. 
															# You need to insert the path to file. Make sure to add ".csv" at the
                                                            # end of your files name. An example of path to file is
                                                            # C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/yelp_academic_dataset_user_small_2.csv
character set latin1
FIELDS TERMINATED BY ',' ENCLOSED BY '"'# Informs sql to read data until it sees a ","
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES; # Ignores the first line in the CSV file which is just the names of the attributes

#the following is an example of a simple querry. Use it to check if the data was loaded correctly
#SELECT * FROM User_data LIMIT 5;
