DROP TABLE IF EXISTS `vaers`.`data`;
DROP TABLE IF EXISTS `vaers`.`vax`;
DROP TABLE IF EXISTS `vaers`.`symptoms`;
DROP TABLE IF EXISTS `vaers`.`nddata`;
DROP TABLE IF EXISTS `vaers`.`ndvax`;
DROP TABLE IF EXISTS `vaers`.`ndsymptoms`;
DROP TABLE IF EXISTS `vaers`.`studies`;
DROP TABLE IF EXISTS `vaers`.`sums`;
DROP TABLE IF EXISTS `vaers`.`sumtypes`;
DROP TABLE IF EXISTS `vaers`.`filedata`;
DROP TABLE IF EXISTS `vaers`.`vaxdist`;
DROP TABLE IF EXISTS `vaers`.`vaxlot`;

CREATE TABLE `vaers`.`data` (
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `RECVDATE` date DEFAULT NULL,
  `STATE` char(2) DEFAULT NULL,
  `AGE_YRS` decimal(4,1) DEFAULT NULL,
  `CAGE_YR` int DEFAULT NULL,
  `CAGE_MO` decimal(2,1) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `RPT_DATE` date DEFAULT NULL,
  `SYMPTOM_TEXT` text,
  `DIED` tinyint(1) DEFAULT NULL,
  `DATEDIED` date DEFAULT NULL,
  `L_THREAT` tinyint(1) DEFAULT NULL,
  `ER_VISIT` tinyint(1) DEFAULT NULL,
  `HOSPITAL` tinyint(1) DEFAULT NULL,
  `HOSPDAYS` int DEFAULT NULL,
  `X_STAY` tinyint(1) DEFAULT NULL,
  `DISABLE` tinyint(1) DEFAULT NULL,
  `RECOVD` tinyint(1) DEFAULT NULL,
  `VAX_DATE` date DEFAULT NULL,
  `ONSET_DATE` date DEFAULT NULL,
  `NUMDAYS` int DEFAULT NULL,
  `LAB_DATA` text,
  `V_ADMINBY` char(3) DEFAULT NULL,
  `V_FUNDBY` char(3) DEFAULT NULL,
  `OTHER_MEDS` char(240) DEFAULT NULL,
  `CUR_ILL` text,
  `HISTORY` text,
  `PRIOR_VAX` char(128) DEFAULT NULL,
  `SPLTTYPE` char(25) DEFAULT NULL,
  `FORM_VERS` int DEFAULT NULL,
  `TODAYS_DATE` date DEFAULT NULL,
  `BIRTH_DEFECT` tinyint(1) DEFAULT NULL,
  `OFC_VISIT` tinyint(1) DEFAULT NULL,
  `ER_ED_VISIT` tinyint(1) DEFAULT NULL,
  `ALLERGIES` text,
  PRIMARY KEY (`VAERS_ID`),
  INDEX `YEAR_INDEX` (`YEAR`),
  INDEX `DIED_INDEX` (`DIED`),
  INDEX `NUMDAYS_INDEX` (`NUMDAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`vax` (
  `VAX_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int DEFAULT NULL,
  `VAX_TYPE` char(15) DEFAULT NULL,
  `VAX_MANU` char(40) DEFAULT NULL,
  `VAX_LOT` char(15) DEFAULT NULL,
  `VAX_DOSE_SERIES` char(3) DEFAULT NULL,
  `VAX_ROUTE` char(6) DEFAULT NULL,
  `VAX_SITE` char(6) DEFAULT NULL,
  `VAX_NAME` char(100) DEFAULT NULL,
  PRIMARY KEY (`VAX_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=52753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`symptoms` (
  `SYMPTOM_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `SYMPTOM` char(100) DEFAULT NULL,
  `SYMPTOMVERSION` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`SYMPTOM_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=115185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vaers`.`nddata` (
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `RECVDATE` date DEFAULT NULL,
  `STATE` char(2) DEFAULT NULL,
  `AGE_YRS` decimal(4,1) DEFAULT NULL,
  `CAGE_YR` int DEFAULT NULL,
  `CAGE_MO` decimal(2,1) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `RPT_DATE` date DEFAULT NULL,
  `SYMPTOM_TEXT` text,
  `DIED` tinyint(1) DEFAULT NULL,
  `DATEDIED` date DEFAULT NULL,
  `L_THREAT` tinyint(1) DEFAULT NULL,
  `ER_VISIT` tinyint(1) DEFAULT NULL,
  `HOSPITAL` tinyint(1) DEFAULT NULL,
  `HOSPDAYS` int DEFAULT NULL,
  `X_STAY` tinyint(1) DEFAULT NULL,
  `DISABLE` tinyint(1) DEFAULT NULL,
  `RECOVD` tinyint(1) DEFAULT NULL,
  `VAX_DATE` date DEFAULT NULL,
  `ONSET_DATE` date DEFAULT NULL,
  `NUMDAYS` int DEFAULT NULL,
  `LAB_DATA` text,
  `V_ADMINBY` char(3) DEFAULT NULL,
  `V_FUNDBY` char(3) DEFAULT NULL,
  `OTHER_MEDS` char(240) DEFAULT NULL,
  `CUR_ILL` text,
  `HISTORY` text,
  `PRIOR_VAX` char(128) DEFAULT NULL,
  `SPLTTYPE` char(25) DEFAULT NULL,
  `FORM_VERS` int DEFAULT NULL,
  `TODAYS_DATE` date DEFAULT NULL,
  `BIRTH_DEFECT` tinyint(1) DEFAULT NULL,
  `OFC_VISIT` tinyint(1) DEFAULT NULL,
  `ER_ED_VISIT` tinyint(1) DEFAULT NULL,
  `ALLERGIES` text,
  PRIMARY KEY (`VAERS_ID`),
  INDEX `YEAR_INDEX` (`YEAR`),
  INDEX `DIED_INDEX` (`DIED`),
  INDEX `NUMDAYS_INDEX` (`NUMDAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`ndvax` (
  `VAX_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int DEFAULT NULL,
  `VAX_TYPE` char(15) DEFAULT NULL,
  `VAX_MANU` char(40) DEFAULT NULL,
  `VAX_LOT` char(15) DEFAULT NULL,
  `VAX_DOSE_SERIES` char(3) DEFAULT NULL,
  `VAX_ROUTE` char(6) DEFAULT NULL,
  `VAX_SITE` char(6) DEFAULT NULL,
  `VAX_NAME` char(100) DEFAULT NULL,
  PRIMARY KEY (`VAX_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=52753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`ndsymptoms` (
  `SYMPTOM_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `SYMPTOM` char(100) DEFAULT NULL,
  `SYMPTOMVERSION` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`SYMPTOM_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=115185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `studies` (
  `study_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `url` varchar(1000) NOT NULL,
  PRIMARY KEY (`study_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sums` (
  `sum_id` int NOT NULL AUTO_INCREMENT,
  `sumtype_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `sum` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1520 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sumtypes` (
  `sumtype_id` int NOT NULL AUTO_INCREMENT,
  `sumtype` varchar(200) NOT NULL,
  PRIMARY KEY (`sumtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `filedata` (
  `filedata_id` int NOT NULL AUTO_INCREMENT,
  `filetype` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`filedata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaxdist` (
  `vaxdist_id` int NOT NULL AUTO_INCREMENT,
  `vax_lot` varchar(100) DEFAULT NULL,
  `vax_manu` varchar(100) DEFAULT NULL,
  `injections` int DEFAULT NULL,
  PRIMARY KEY (`vaxdist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaxlot` (
  `vaxlot_id` int NOT NULL AUTO_INCREMENT,
  `vax_type` varchar(100) DEFAULT NULL,
  `vax_manu` varchar(100) DEFAULT NULL,
  `vax_lot` varchar(100) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `injections` int DEFAULT NULL,
  PRIMARY KEY (`vaxlot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=547409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (1,'Deaths');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (2,'COVID19 vax-associated deaths');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (3,'Injected');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (4,'Injections');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (5,'Symptoms');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (6,'Hospital');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (7,'Emergency');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (8,'Lifethreat');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (9,'Disabled');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (10,'Extended hospitalization');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (11,'Office/clinic visit');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (12,'Recovered');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (13,'Birth defect');
INSERT INTO `sumtypes` (`sumtype_id`,`sumtype`) VALUES (14,'Flu vaccine');


INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (34,1,2022,22771473,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (35,1,2021,652988813,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (36,1,2020,43237323,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (37,1,2019,42371954,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (38,1,2018,40955318,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (39,1,2017,28136641,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (40,1,2016,31141410,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (41,1,2015,28029697,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (42,1,2014,20174492,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (43,1,2013,16637710,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (44,1,2012,14801255,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (45,1,2011,13507241,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (46,1,2010,16092020,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (47,1,2009,19182718,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (48,1,2008,19965153,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (49,1,2007,17883557,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (50,1,2006,10035287,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (51,1,2005,8565191,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (52,1,2004,8889093,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (53,1,2003,8402492,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (54,1,2002,7687622,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (55,1,2001,6411439,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (56,1,2000,5683430,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (57,1,1999,3593404,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (58,1,1998,2885884,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (59,1,1997,3218784,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (60,1,1996,3107939,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (61,1,1995,2968570,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (62,1,1994,2966414,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (63,1,1993,2957798,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (64,1,1992,3095259,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (65,1,1991,2892801,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (66,1,1990,597231,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (67,2,2022,2863293,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (68,2,2021,79119711,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (69,2,2020,4682412,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (70,2,2019,4811984,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (71,2,2018,4773663,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (72,2,2017,3614966,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (73,2,2016,4035128,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (74,2,2015,3962814,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (75,2,2014,3172735,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (76,2,2013,2861212,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (77,2,2012,2702421,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (78,2,2011,2611482,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (79,2,2010,3211242,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (80,2,2009,3272385,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (81,2,2008,2908227,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (82,2,2007,2564069,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (83,2,2006,1437094,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (84,2,2005,1247498,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (85,2,2004,1207364,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (86,2,2003,1278135,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (87,2,2002,1067102,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (88,2,2001,1029865,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (89,2,2000,1043396,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (90,2,1999,973302,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (91,2,1998,763765,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (92,2,1997,826547,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (93,2,1996,807379,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (94,2,1995,755512,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (95,2,1994,762324,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (96,2,1993,764613,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (97,2,1992,736367,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (98,2,1991,646517,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (99,2,1990,138116,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (100,3,2022,2092709,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (101,3,2021,58362658,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (102,3,2020,4602404,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (103,3,2019,4552066,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (104,3,2018,4638649,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (105,3,2017,3916398,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (106,3,2016,4463630,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (107,3,2015,4184245,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (108,3,2014,3474754,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (109,3,2013,3177179,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (110,3,2012,2998552,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (111,3,2011,2987684,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (112,3,2010,3777483,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (113,3,2009,3871382,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (114,3,2008,3553961,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (115,3,2007,3337808,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (116,3,2006,2187949,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (117,3,2005,2004816,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (118,3,2004,1977404,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (119,3,2003,2124065,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (120,3,2002,1811593,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (121,3,2001,1735301,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (122,3,2000,1593883,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (123,3,1999,1374630,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (124,3,1998,1103177,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (125,3,1997,1186287,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (126,3,1996,1208602,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (127,3,1995,1228906,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (128,3,1994,1265833,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (129,3,1993,1194756,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (130,3,1992,1226607,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (131,3,1991,1119071,1);
INSERT INTO `filedata` (`filedata_id`,`filetype`,`year`,`size`,`status`) VALUES (132,3,1990,191116,1);

