INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1611776034016932100');

DROP TABLE IF EXISTS `creature_template_resistance`;
CREATE TABLE IF NOT EXISTS `creature_template_resistance` (
  `CreatureID` MEDIUMINT UNSIGNED NOT NULL,
  `School` TINYINT UNSIGNED NOT NULL,
  `Resistance` SMALLINT DEFAULT NULL,
  `VerifiedBuild` SMALLINT DEFAULT 0,
  CHECK (`School`>=1 AND `School`<=6),
  PRIMARY KEY (`CreatureID`, `School`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

DROP TABLE IF EXISTS `creature_template_spell`;
CREATE TABLE IF NOT EXISTS `creature_template_spell` (
  `CreatureID` MEDIUMINT UNSIGNED NOT NULL,
  `Index` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `Spell` MEDIUMINT UNSIGNED DEFAULT NULL,
  `VerifiedBuild` SMALLINT DEFAULT 0,
  CHECK (`Index`>=0 AND `Index`<=7),
  PRIMARY KEY (`CreatureID`, `Index`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `creature_template_resistance` SELECT `entry`, 1, `resistance1`, `VerifiedBuild` FROM `creature_template` WHERE `resistance1` <> 0;
INSERT INTO `creature_template_resistance` SELECT `entry`, 2, `resistance2`, `VerifiedBuild` FROM `creature_template` WHERE `resistance2` <> 0;
INSERT INTO `creature_template_resistance` SELECT `entry`, 3, `resistance3`, `VerifiedBuild` FROM `creature_template` WHERE `resistance3` <> 0;
INSERT INTO `creature_template_resistance` SELECT `entry`, 4, `resistance4`, `VerifiedBuild` FROM `creature_template` WHERE `resistance4` <> 0;
INSERT INTO `creature_template_resistance` SELECT `entry`, 5, `resistance5`, `VerifiedBuild` FROM `creature_template` WHERE `resistance5` <> 0;
INSERT INTO `creature_template_resistance` SELECT `entry`, 6, `resistance6`, `VerifiedBuild` FROM `creature_template` WHERE `resistance6` <> 0;

INSERT INTO `creature_template_spell` SELECT `entry`, 0, `spell1`, `VerifiedBuild` FROM `creature_template` WHERE `spell1` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 1, `spell2`, `VerifiedBuild` FROM `creature_template` WHERE `spell2` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 2, `spell3`, `VerifiedBuild` FROM `creature_template` WHERE `spell3` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 3, `spell4`, `VerifiedBuild` FROM `creature_template` WHERE `spell4` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 4, `spell5`, `VerifiedBuild` FROM `creature_template` WHERE `spell5` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 5, `spell6`, `VerifiedBuild` FROM `creature_template` WHERE `spell6` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 6, `spell7`, `VerifiedBuild` FROM `creature_template` WHERE `spell7` <> 0;
INSERT INTO `creature_template_spell` SELECT `entry`, 7, `spell8`, `VerifiedBuild` FROM `creature_template` WHERE `spell8` <> 0;

ALTER TABLE `creature_template`
	DROP COLUMN `resistance1`,
	DROP COLUMN `resistance2`,
	DROP COLUMN `resistance3`,
	DROP COLUMN `resistance4`,
	DROP COLUMN `resistance5`,
	DROP COLUMN `resistance6`,
	DROP COLUMN `spell1`,
	DROP COLUMN `spell2`,
	DROP COLUMN `spell3`,
	DROP COLUMN `spell4`,
	DROP COLUMN `spell5`,
	DROP COLUMN `spell6`,
	DROP COLUMN `spell7`,
	DROP COLUMN `spell8`;
