INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1626186297807070700');

DELETE FROM `gossip_menu` WHERE (`MenuID` = 7403) AND (`TextID` IN (8869));
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(7403, 8869);

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 14) AND (`SourceGroup` = 7403) AND (`SourceEntry` = 8869) AND (`SourceId` = 0) AND (`ElseGroup` = 0) AND (`ConditionTypeOrReference` = 16) AND (`ConditionTarget` = 0) AND (`ConditionValue1` = 1024) AND (`ConditionValue2` = 0) AND (`ConditionValue3` = 0);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14, 7403, 8869, 0, 0, 16, 0, 1024, 0, 0, 1, 0, 0, '', 'Enable GOSSIP_MENU only for non-Draenei');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 15) AND (`SourceGroup` = 7403) AND (`SourceEntry` = 0) AND (`SourceId` = 0) AND (`ElseGroup` = 0) AND (`ConditionTypeOrReference` = 16) AND (`ConditionTarget` = 0) AND (`ConditionValue1` = 1024) AND (`ConditionValue2` = 0) AND (`ConditionValue3` = 0);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 7403, 0, 0, 0, 16, 0, 1024, 0, 0, 0, 0, 0, '', 'Enable GOSSIP_MENU_OPTION only for Draenei');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 14) AND (`SourceGroup` = 7403) AND (`SourceEntry` = 8870) AND (`SourceId` = 0) AND (`ElseGroup` = 0) AND (`ConditionTypeOrReference` = 16) AND (`ConditionTarget` = 0) AND (`ConditionValue1` = 1024) AND (`ConditionValue2` = 0) AND (`ConditionValue3` = 0);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14, 7403, 8870, 0, 0, 16, 0, 1024, 0, 0, 0, 0, 0, '', 'Enable GOSSIP_MENU only for Draenei');

