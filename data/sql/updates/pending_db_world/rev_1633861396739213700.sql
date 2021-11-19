INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1633861396739213700');

 -- Brazier of the Herald
SET @ENTRY := 175564;
DELETE FROM `smart_scripts` WHERE `entryOrGuid` = @ENTRY AND `source_type` = 1;
UPDATE `gameobject_template` SET `AIName` = "SmartGameObjectAI" WHERE `entry` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 34, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On loot state changed to GO_ACTIVATED - Set instance data #0 to 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = @ENTRY AND `SourceId` = 1;

-- remove "inhabit air"
UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` = 10506;

-- add sound to emote
UPDATE `creature_text` SET `Sound` = 557 WHERE `CreatureID` = 10506;
