INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1556034383320746900');

DELETE FROM `creature_text` WHERE `CreatureID` IN(32718, 32714, 32720) AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(32718, 0, 0, 'Be well, champion.', 12, 0, 50, 0, 0, 0, 0, 0, 'Dalaran shamy'),
(32714, 0, 0, 'Elune bless you, champion.', 12, 0, 100, 0, 0, 0, 0, 0, 'Dalaran priest'),
(32720, 0, 0, 'Good to see you, champion.', 12, 0, 50, 0, 0, 0, 0, 0, 'Dalaran mage');
