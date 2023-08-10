-- Adminer 4.8.1 MySQL 5.5.5-10.0.38-MariaDB-0ubuntu0.16.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `Address` int(10) unsigned NOT NULL,
  `LineNumber` enum('None','UART1','UART2','UART3','UART4','Radio','LAN') NOT NULL,
  `HardwareType1` enum('None','Common','DIN','BOX','RadioBOX') NOT NULL,
  `HardwareType2` enum('None','CU','CU_WR','Expander','Radio','Amplifier','Acin','Anin','Anout','Digin','Dim','Led','Mul','Rel','Rol','Temp','Tablet','TouchPanel') NOT NULL,
  `HardwareSegmentsCount` tinyint(3) unsigned NOT NULL,
  `HardwareVersion` tinyint(3) unsigned NOT NULL,
  `ParentItem` int(10) unsigned DEFAULT NULL,
  `Active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Address`) USING BTREE,
  KEY `FK_devices_devices` (`ParentItem`) USING BTREE,
  CONSTRAINT `FK_devices_devices` FOREIGN KEY (`ParentItem`) REFERENCES `devices` (`Address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `devices`;
INSERT INTO `devices` (`Address`, `LineNumber`, `HardwareType1`, `HardwareType2`, `HardwareSegmentsCount`, `HardwareVersion`, `ParentItem`, `Active`) VALUES
(455656201,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(640642813,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(1722337512,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(1861877936,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(1946305939,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(2250534704,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(3164519919,	'UART2',	'DIN',	'Rel',	2,	1,	4181248461,	1),
(3174015816,	'UART2',	'DIN',	'Rel',	2,	1,	4181248461,	1),
(3666895636,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(3827540751,	'UART2',	'DIN',	'Rel',	2,	1,	4181248461,	1),
(3990226552,	'UART2',	'BOX',	'Temp',	2,	1,	4181248461,	1),
(4046328306,	'UART2',	'DIN',	'Rel',	2,	1,	4181248461,	1),
(4181248461,	'None',	'DIN',	'CU',	2,	1,	NULL,	1);

DROP TABLE IF EXISTS `devices_cu`;
CREATE TABLE `devices_cu` (
  `Address` int(10) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `LastUpdated` datetime NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `ErrorFrom` datetime DEFAULT NULL,
  `Uptime` int(10) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Address`) USING BTREE,
  CONSTRAINT `FK_devices_cu_devices` FOREIGN KEY (`Address`) REFERENCES `devices` (`Address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `devices_cu`;
INSERT INTO `devices_cu` (`Address`, `Name`, `LastUpdated`, `Error`, `ErrorFrom`, `Uptime`, `Vin`) VALUES
(4181248461,	'',	'2023-02-07 22:57:46',	0,	NULL,	77687,	12.412);

DROP TABLE IF EXISTS `devices_relays`;
CREATE TABLE `devices_relays` (
  `Address` int(10) unsigned NOT NULL,
  `Segment` tinyint(3) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `LastUpdated` datetime NOT NULL,
  `Relay` tinyint(3) unsigned NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `ErrorFrom` datetime DEFAULT NULL,
  `Uptime` int(10) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Address`,`Segment`) USING BTREE,
  CONSTRAINT `FK_devices_relays_devices` FOREIGN KEY (`Address`) REFERENCES `devices` (`Address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `devices_relays`;
INSERT INTO `devices_relays` (`Address`, `Segment`, `Name`, `LastUpdated`, `Relay`, `Error`, `ErrorFrom`, `Uptime`, `Vin`) VALUES
(3164519919,	0,	'Sypialnia - I piętro',	'2023-02-07 22:57:47',	1,	0,	NULL,	1599578,	12.268),
(3164519919,	1,	'WC - parter',	'2023-02-07 22:57:47',	1,	0,	NULL,	1599578,	12.268),
(3174015816,	0,	'Korytarz - parter',	'2023-02-07 22:57:47',	1,	0,	NULL,	1599541,	12.305),
(3174015816,	1,	'Salon - parter',	'2023-02-07 22:57:47',	0,	0,	NULL,	1599541,	12.305),
(3827540751,	0,	'Korytarz - I piętro',	'2023-02-07 22:57:47',	1,	0,	NULL,	1599322,	12.277),
(3827540751,	1,	'Łazienka - I piętro',	'2023-02-07 22:57:47',	1,	0,	NULL,	1599322,	12.277),
(4046328306,	1,	'Poddasze',	'2023-02-07 22:57:47',	1,	0,	NULL,	1595734,	7.714);

DROP TABLE IF EXISTS `devices_temperatures`;
CREATE TABLE `devices_temperatures` (
  `Address` int(10) unsigned NOT NULL,
  `Segment` tinyint(3) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `LastUpdated` datetime NOT NULL,
  `Temperature` float unsigned NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `ErrorFrom` datetime DEFAULT NULL,
  `Uptime` int(10) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Address`,`Segment`) USING BTREE,
  CONSTRAINT `FK_devices_temperatures_devices` FOREIGN KEY (`Address`) REFERENCES `devices` (`Address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `devices_temperatures`;
INSERT INTO `devices_temperatures` (`Address`, `Segment`, `Name`, `LastUpdated`, `Temperature`, `Error`, `ErrorFrom`, `Uptime`, `Vin`) VALUES
(455656201,	0,	'Poddasze - powietrze',	'2023-02-07 22:57:47',	9.25,	0,	NULL,	82467,	11.617),
(455656201,	1,	'Poddasze - podłoga',	'2023-02-07 22:57:47',	19.8125,	0,	NULL,	82467,	11.617),
(640642813,	0,	'Korytarz, klatka schodowa - I piętro - powietrze',	'2023-02-07 22:57:46',	12.125,	0,	NULL,	1573975,	11.726),
(640642813,	1,	'Korytarz, klatka schodowa - I piętro - podłoga',	'2023-02-07 22:57:46',	15.75,	0,	NULL,	1573975,	11.726),
(1722337512,	0,	'Łazienka - I piętro - powietrze',	'2023-02-07 22:57:46',	12.875,	0,	NULL,	1573975,	11.94),
(1722337512,	1,	'Łazienka - I piętro - podłoga',	'2023-02-07 22:57:46',	21.625,	0,	NULL,	1573975,	11.94),
(1861877936,	0,	'Sypialnia - I piętro - powietrze',	'2023-02-07 22:57:46',	11.8125,	0,	NULL,	1573970,	11.905),
(1861877936,	1,	'Sypialnia - I piętro - podłoga',	'2023-02-07 22:57:46',	12.1875,	0,	NULL,	1573970,	11.905),
(1946305939,	0,	'Salon i kuchnia - parter - powietrze',	'2023-02-07 22:57:46',	15.8125,	0,	NULL,	80630,	12.059),
(1946305939,	1,	'Salon i kuchnia - parter - podłoga',	'2023-02-07 22:57:46',	22.5625,	0,	NULL,	80630,	12.059),
(2250534704,	0,	'Zewnętrzna',	'2023-02-07 22:57:47',	4088.69,	0,	NULL,	1573969,	12.356),
(3666895636,	0,	'WC - parter - powietrze',	'2023-02-07 22:57:46',	13.125,	0,	NULL,	1573975,	12.169),
(3666895636,	1,	'WC - parter - podłoga',	'2023-02-07 22:57:46',	22.0625,	0,	NULL,	1573975,	12.169),
(3990226552,	0,	'Korytarz, wejście, klatka schodowa - parter - powietrze',	'2023-02-07 22:57:46',	14.6875,	0,	NULL,	1573972,	12.189),
(3990226552,	1,	'Korytarz, wejście, klatka schodowa - parter - podłoga',	'2023-02-07 22:57:46',	18.6875,	0,	NULL,	1573972,	12.189);

-- 2023-02-07 21:58:13