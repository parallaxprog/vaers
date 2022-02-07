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

CREATE TABLE `vaers`.`data` (
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `RECVDATE` date DEFAULT NULL,
  `STATE` varchar(5) DEFAULT NULL,
  `AGE_YRS` decimal(4,1) DEFAULT NULL,
  `CAGE_YR` int DEFAULT NULL,
  `CAGE_MO` decimal(4,1) DEFAULT NULL,
  `SEX` varchar(5) DEFAULT NULL,
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
  `V_ADMINBY` varchar(10) DEFAULT NULL,
  `V_FUNDBY` varchar(10) DEFAULT NULL,
  `OTHER_MEDS` varchar(300) DEFAULT NULL,
  `CUR_ILL` varchar(1000) DEFAULT NULL,
  `HISTORY` text,
  `PRIOR_VAX` varchar(300) DEFAULT NULL,
  `SPLTTYPE` varchar(300) DEFAULT NULL,
  `FORM_VERS` varchar(10) DEFAULT NULL,
  `TODAYS_DATE` date DEFAULT NULL,
  `BIRTH_DEFECT` tinyint(1) DEFAULT NULL,
  `OFC_VISIT` tinyint(1) DEFAULT NULL,
  `ER_ED_VISIT` tinyint(1) DEFAULT NULL,
  `ALLERGIES` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`VAERS_ID`),
  INDEX `YEAR_INDEX` (`YEAR`),
  INDEX `DIED_INDEX` (`DIED`),
  INDEX `NUMDAYS_INDEX` (`NUMDAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`vax` (
  `VAX_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int DEFAULT NULL,
  `VAX_TYPE` varchar(100) DEFAULT NULL,
  `VAX_MANU` varchar(100) DEFAULT NULL,
  `VAX_LOT` varchar(100) DEFAULT NULL,
  `VAX_DOSE_SERIES` varchar(10) DEFAULT NULL,
  `VAX_ROUTE` varchar(10) DEFAULT NULL,
  `VAX_SITE` varchar(10) DEFAULT NULL,
  `VAX_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VAX_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=52753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`symptoms` (
  `SYMPTOM_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `SYMPTOM` varchar(200) DEFAULT NULL,
  `SYMPTOMVERSION` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SYMPTOM_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=115185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vaers`.`nddata` (
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `RECVDATE` date DEFAULT NULL,
  `STATE` varchar(5) DEFAULT NULL,
  `AGE_YRS` decimal(4,1) DEFAULT NULL,
  `CAGE_YR` int DEFAULT NULL,
  `CAGE_MO` decimal(4,1) DEFAULT NULL,
  `SEX` varchar(5) DEFAULT NULL,
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
  `V_ADMINBY` varchar(10) DEFAULT NULL,
  `V_FUNDBY` varchar(10) DEFAULT NULL,
  `OTHER_MEDS` varchar(300) DEFAULT NULL,
  `CUR_ILL` varchar(1000) DEFAULT NULL,
  `HISTORY` text,
  `PRIOR_VAX` varchar(300) DEFAULT NULL,
  `SPLTTYPE` varchar(300) DEFAULT NULL,
  `FORM_VERS` varchar(10) DEFAULT NULL,
  `TODAYS_DATE` date DEFAULT NULL,
  `BIRTH_DEFECT` tinyint(1) DEFAULT NULL,
  `OFC_VISIT` tinyint(1) DEFAULT NULL,
  `ER_ED_VISIT` tinyint(1) DEFAULT NULL,
  `ALLERGIES` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`VAERS_ID`),
  INDEX `YEAR_INDEX` (`YEAR`),
  INDEX `DIED_INDEX` (`DIED`),
  INDEX `NUMDAYS_INDEX` (`NUMDAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`ndvax` (
  `VAX_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int DEFAULT NULL,
  `VAX_TYPE` varchar(100) DEFAULT NULL,
  `VAX_MANU` varchar(100) DEFAULT NULL,
  `VAX_LOT` varchar(100) DEFAULT NULL,
  `VAX_DOSE_SERIES` varchar(10) DEFAULT NULL,
  `VAX_ROUTE` varchar(10) DEFAULT NULL,
  `VAX_SITE` varchar(10) DEFAULT NULL,
  `VAX_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VAX_ID`),
  INDEX `YEAR_INDEX` (`YEAR`)
) ENGINE=InnoDB AUTO_INCREMENT=52753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vaers`.`ndsymptoms` (
  `SYMPTOM_ID` int NOT NULL AUTO_INCREMENT,
  `VAERS_ID` int NOT NULL,
  `YEAR` int NOT NULL,
  `SYMPTOM` varchar(200) DEFAULT NULL,
  `SYMPTOMVERSION` varchar(10) DEFAULT NULL,
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

INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (1,'Deaths');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (2,'COVID19 vax-associated deaths');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (3,'Injected');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (4,'Injections');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (5,'Symptoms');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (6,'Hospital');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (7,'Emergency');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (8,'Lifethreat');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (9,'Disabled');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (10,'Extended hospitalization');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (11,'Office/clinic visit');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (12,'Recovered');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (13,'Birth defect');
INSERT INTO `` (`sumtype_id`,`sumtype`) VALUES (14,'Flu vaccine');

ALTER TABLE `vax` ADD INDEX `vax__year_index` (`year`);
ALTER TABLE `symptoms` ADD INDEX `year_index` (`year`);
ALTER TABLE `data` ADD INDEX `year_index` (`year`);
ALTER TABLE `data` ADD INDEX `died_index` (`died`);
ALTER TABLE `nddata` ADD INDEX `year_index` (`year`);
ALTER TABLE `nddata` ADD INDEX `died_index` (`died`);
ALTER TABLE `ndvax` ADD INDEX `year_index` (`year`);
ALTER TABLE `ndsymptoms` ADD INDEX `year_index` (`year`);

