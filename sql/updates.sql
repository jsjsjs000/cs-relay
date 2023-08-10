ALTER TABLE `devices_cu`
  ADD COLUMN `Name` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci' AFTER `Address`;
ALTER TABLE `devices_relays`
  ADD COLUMN `Name` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci' AFTER `Segment`;
ALTER TABLE `devices_temperatures`
  ADD COLUMN `Name` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci' AFTER `Segment`;

# Configuration Adam:
UPDATE `devices_temperatures` SET `Name` = "Salon i kuchnia - parter - powietrze" WHERE `Address` = CONV('74024593', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Salon i kuchnia - parter - podłoga" WHERE `Address` = CONV('74024593', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Korytarz, wejście, klatka schodowa - parter - powietrze" WHERE `Address` = CONV('edd60678', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Korytarz, wejście, klatka schodowa - parter - podłoga" WHERE `Address` = CONV('edd60678', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "WC - parter - powietrze" WHERE `Address` = CONV('da906314', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "WC - parter - podłoga" WHERE `Address` = CONV('da906314', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Sypialnia - I piętro - powietrze" WHERE `Address` = CONV('6efa00b0', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Sypialnia - I piętro - podłoga" WHERE `Address` = CONV('6efa00b0', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Łazienka - I piętro - powietrze" WHERE `Address` = CONV('66a8c8e8', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Łazienka - I piętro - podłoga" WHERE `Address` = CONV('66a8c8e8', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Korytarz, klatka schodowa - I piętro - powietrze" WHERE `Address` = CONV('262f6efd', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Korytarz, klatka schodowa - I piętro - podłoga" WHERE `Address` = CONV('262f6efd', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Poddasze - powietrze" WHERE `Address` = CONV('1b28c309', 16, 10) AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Poddasze - podłoga" WHERE `Address` = CONV('1b28c309', 16, 10) AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Zewnętrzna" WHERE `Address` = CONV('86246f30', 16, 10) AND `Segment` = 0;

UPDATE `devices_relays` SET `Name` = "Salon - parter" WHERE `Address` = CONV('bd2fa348', 16, 10) AND `Segment` = (0 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "Korytarz - parter" WHERE `Address` = CONV('bd2fa348', 16, 10) AND `Segment` = (1 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "WC - parter" WHERE `Address` = CONV('bc9ebdef', 16, 10) AND `Segment` = (0 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "Sypialnia - I piętro" WHERE `Address` = CONV('bc9ebdef', 16, 10) AND `Segment` = (1 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "Łazienka - I piętro" WHERE `Address` = CONV('e423a30f', 16, 10) AND `Segment` = (0 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "Korytarz - I piętro" WHERE `Address` = CONV('e423a30f', 16, 10) AND `Segment` = (1 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "Poddasze" WHERE `Address` = CONV('f12e11f2', 16, 10) AND `Segment` = (0 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "<brak>" WHERE `Address` = CONV('f12e11f2', 16, 10) AND `Segment` = (1 + 1) % 2;

INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("Salon - parter", CONV('bd2fa348', 16, 10), (0 + 1) % 2, "2000-1-1", "Off");
INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("Korytarz - parter", CONV('bd2fa348', 16, 10), (1 + 1) % 2, "2000-1-1", "Off");
INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("WC - parter", CONV('bc9ebdef', 16, 10), (0 + 1) % 2, "2000-1-1", "Off");
INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("Sypialnia - I piętro", CONV('bc9ebdef', 16, 10), (1 + 1) % 2, "2000-1-1", "Off");
INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("Łazienka - I piętro", CONV('e423a30f', 16, 10), (0 + 1) % 2, "2000-1-1", "Off");
INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("Korytarz - I piętro", CONV('e423a30f', 16, 10), (1 + 1) % 2, "2000-1-1", "Off");
INSERT INTO `devices_heating` (`Name`, `Address`, `Segment`, `LastUpdated`, `Mode`) VALUES ("Poddasze", CONV('f12e11f2', 16, 10), (0 + 1) % 2, "2000-1-1", "Off");

INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bd2fa348', 16, 10), 1, CONV('74024593', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bd2fa348', 16, 10), 1, CONV('74024593', 16, 10), 0, 0); # Powietrze
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bd2fa348', 16, 10), 0, CONV('edd60678', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bd2fa348', 16, 10), 0, CONV('edd60678', 16, 10), 0, 0); # Powietrze
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bc9ebdef', 16, 10), 1, CONV('da906314', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bc9ebdef', 16, 10), 1, CONV('da906314', 16, 10), 0, 0); # Powietrze
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bc9ebdef', 16, 10), 0, CONV('6efa00b0', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('bc9ebdef', 16, 10), 0, CONV('6efa00b0', 16, 10), 0, 0); # Powietrze
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('e423a30f', 16, 10), 1, CONV('66a8c8e8', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('e423a30f', 16, 10), 1, CONV('66a8c8e8', 16, 10), 0, 0); # Powietrze
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('e423a30f', 16, 10), 0, CONV('262f6efd', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('e423a30f', 16, 10), 0, CONV('262f6efd', 16, 10), 0, 0); # Powietrze
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('f12e11f2', 16, 10), 1, CONV('1b28c309', 16, 10), 1, 1); # Podłoga
INSERT INTO `devices_heating_structure` (ParentAddress, ParentSegment, Address, Segment, `Order`) VALUES (CONV('f12e11f2', 16, 10), 1, CONV('1b28c309', 16, 10), 0, 0); # Powietrze

# Configuration Adam Test:
UPDATE `devices_temperatures` SET `Name` = "Korytarz, wejście, klatka schodowa - parter - podłoga" WHERE `Address` = 4 AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Korytarz, wejście, klatka schodowa - parter - powietrze" WHERE `Address` = 4 AND `Segment` = 1;
UPDATE `devices_temperatures` SET `Name` = "Poddasze - podłoga" WHERE `Address` = 2 AND `Segment` = 0;
UPDATE `devices_temperatures` SET `Name` = "Poddasze - powietrze" WHERE `Address` = 2 AND `Segment` = 1;

UPDATE `devices_relays` SET `Name` = "Poddasze" WHERE `Address` = 3 AND `Segment` = (0 + 1) % 2;
UPDATE `devices_relays` SET `Name` = "<brak>" WHERE `Address` = 3 AND `Segment` = (1 + 1) % 2;

ALTER TABLE `history_temperatures_2023_01` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_02` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_03` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_04` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_05` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_06` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_07` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_08` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_09` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_10` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_11` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;
ALTER TABLE `history_temperatures_2023_12` CHANGE COLUMN `Temperature` `Temperature` FLOAT NOT NULL AFTER `Segment`;

# relays 0 <-> 1
SET foreign_key_checks = 0;
UPDATE devices_relays SET segment = segment + 3;
UPDATE devices_relays SET segment = segment % 2;
UPDATE devices_heating SET segment = segment + 3;
UPDATE devices_heating SET segment = segment % 2;
UPDATE devices_heating_structure SET parentsegment = parentsegment + 3;
UPDATE devices_heating_structure SET parentsegment = parentsegment % 2;
UPDATE history_relays_2023_02 SET segment = segment + 3;
UPDATE history_relays_2023_02 SET segment = segment % 2;
UPDATE history_heating_2023_02 SET segment = segment + 3;
UPDATE history_heating_2023_02 SET segment = segment % 2;

# history MINUTE(Dt) % 5
DELETE FROM history_heating_2023_02 WHERE MINUTE(Dt) % 5 != 0;
DELETE FROM history_relays_2023_02 WHERE MINUTE(Dt) % 5 != 0;
DELETE FROM history_temperatures_2023_02 WHERE MINUTE(Dt) % 5 != 0;
