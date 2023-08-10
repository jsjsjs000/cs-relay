-- --------------------------------------------------------
-- Host:                         localhost
-- Wersja serwera:               10.4.24-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Zrzut struktury tabela inteligentny_dom.devices
CREATE TABLE IF NOT EXISTS `devices` (
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

-- Zrzucanie danych dla tabeli inteligentny_dom.devices
DELETE FROM `devices`;
INSERT INTO `devices` (`Address`, `LineNumber`, `HardwareType1`, `HardwareType2`, `HardwareSegmentsCount`, `HardwareVersion`, `ParentItem`, `Active`) VALUES
	(0xf938c9cd, 'None', 'DIN', 'CU', 2, 1, NULL, 1),
	(0xbd2fa348, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0xbc9ebdef, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0xe423a30f, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0xf12e11f2, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0x7e42b124, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0xe42ab667, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0x33f7971b, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0x89ae4267, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0x7bf90ca3, 'UART1', 'DIN', 'Rel', 2, 1, 0xf938c9cd, 1),
	(0x6e9dd4c0, 'UART1', 'DIN', 'Temp', 4, 1, 0xf938c9cd, 1),
	(0x1b28c309, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x83e3ceb7, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x2543d7e3, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x6efa00b0, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x66a8c8e8, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x262f6efd, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x74024593, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0xdcdb5dd9, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0xda906314, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0xedd60678, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x42473737, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0xd054c0f1, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x00e75578, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x028322a6, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x17511b75, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0xfa007455, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1),
	(0x86246f30, 'UART2', 'BOX', 'Temp', 2, 1, 0xf938c9cd, 1);

-- Zrzut struktury tabela inteligentny_dom.devices_cu
CREATE TABLE IF NOT EXISTS `devices_cu` (
  `Address` int(10) unsigned NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `ErrorFrom` datetime DEFAULT NULL,
  `Uptime` int(10) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Address`) USING BTREE,
  CONSTRAINT `FK_devices_cu_devices` FOREIGN KEY (`Address`) REFERENCES `devices` (`Address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli inteligentny_dom.devices_cu
DELETE FROM `devices_cu`;
INSERT INTO `devices_cu` (`Address`, `LastUpdated`, `Error`, `ErrorFrom`, `Uptime`, `Vin`) VALUES
	(0xf938c9cd, '2022-10-10 18:31:48', 0, NULL, 4228, 7.933);

-- Zrzut struktury tabela inteligentny_dom.devices_relays
CREATE TABLE IF NOT EXISTS `devices_relays` (
  `Address` int(10) unsigned NOT NULL,
  `Segment` tinyint(3) unsigned NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `Relay` tinyint(3) unsigned NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `ErrorFrom` datetime DEFAULT NULL,
  `Uptime` int(10) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Address`,`Segment`) USING BTREE,
  CONSTRAINT `FK_devices_relays_devices` FOREIGN KEY (`address`) REFERENCES `devices` (`address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli inteligentny_dom.devices_relays
DELETE FROM `devices_relays`;
INSERT INTO `devices_relays` (`Address`, `Segment`, `LastUpdated`, `Relay`, `Error`, `ErrorFrom`, `Uptime`, `Vin`) VALUES
	(0xbd2fa348, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xbd2fa348, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xbc9ebdef, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xbc9ebdef, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xe423a30f, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xe423a30f, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xf12e11f2, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xf12e11f2, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x7e42b124, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x7e42b124, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xe42ab667, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0xe42ab667, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x33f7971b, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x33f7971b, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x89ae4267, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x89ae4267, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x7bf90ca3, 0, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084),
	(0x7bf90ca3, 1, '2022-10-10 18:31:48', 0, 0, NULL, 7773, 12.084);

-- Zrzut struktury tabela inteligentny_dom.devices_temperatures
CREATE TABLE IF NOT EXISTS `devices_temperatures` (
  `Address` int(10) unsigned NOT NULL,
  `Segment` tinyint(3) unsigned NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `Temperature` float unsigned NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `ErrorFrom` datetime DEFAULT NULL,
  `Uptime` int(10) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Address`,`Segment`) USING BTREE,
  CONSTRAINT `FK_devices_temperatures_devices` FOREIGN KEY (`address`) REFERENCES `devices` (`address`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli inteligentny_dom.devices_temperatures
DELETE FROM `devices_temperatures`;
INSERT INTO `devices_temperatures` (`Address`, `Segment`, `LastUpdated`, `Temperature`, `Error`, `ErrorFrom`, `Uptime`, `Vin`) VALUES
	(0x6e9dd4c0, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 7821, 12.088),
	(0x6e9dd4c0, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 7821, 12.088),
	(0x6e9dd4c0, 2, '2022-10-10 18:31:48', 65535, 0, NULL, 7821, 12.088),
	(0x6e9dd4c0, 3, '2022-10-10 18:31:48', 65535, 0, NULL, 7821, 12.088),
	(0x1b28c309, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x1b28c309, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x83e3ceb7, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x83e3ceb7, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x2543d7e3, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x2543d7e3, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x6efa00b0, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x6efa00b0, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x66a8c8e8, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x66a8c8e8, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x262f6efd, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x262f6efd, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x74024593, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x74024593, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xdcdb5dd9, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xdcdb5dd9, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xda906314, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xda906314, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xedd60678, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xedd60678, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x42473737, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x42473737, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xd054c0f1, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xd054c0f1, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x00e75578, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x00e75578, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x028322a6, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x028322a6, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x17511b75, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x17511b75, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xfa007455, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0xfa007455, 1, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x86246f30, 0, '2022-10-10 18:31:48', 65535, 0, NULL, 4753, 12.403),
	(0x86246f30, 1, '2022-10-10 18:31:48', 21.8125, 0, NULL, 4753, 12.403);

-- Zrzut struktury tabela inteligentny_dom.history_relays_2022_10
CREATE TABLE IF NOT EXISTS `history_relays_2022_10` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dt` datetime NOT NULL,
  `Address` int(10) unsigned NOT NULL,
  `Segment` tinyint(3) unsigned NOT NULL,
  `Relay` tinyint(3) unsigned NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `Dt` (`Dt`) USING BTREE,
  KEY `Address` (`Address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Zrzucanie danych dla tabeli inteligentny_dom.history_relays_2022_10
DELETE FROM `history_relays_2022_10`;

-- Zrzut struktury tabela inteligentny_dom.history_temperatures_2022_10
CREATE TABLE IF NOT EXISTS `history_temperatures_2022_10` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dt` datetime NOT NULL,
  `Address` int(10) unsigned NOT NULL,
  `Segment` tinyint(3) unsigned NOT NULL,
  `Temperature` float unsigned NOT NULL,
  `Error` tinyint(3) unsigned NOT NULL,
  `Vin` float NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `Dt` (`Dt`) USING BTREE,
  KEY `Address` (`Address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM `history_temperatures_2022_10`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
