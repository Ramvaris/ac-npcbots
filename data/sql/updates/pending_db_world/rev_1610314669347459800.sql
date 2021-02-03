INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1610314669347459800');

-- Increase drop chance of 'Tender Strider Meat' for quest Kyle's Gone Missing! (ID: 11129) to 50% based on videos that show that this quest is completed with one or two kills of a mob - currently on AC it's a 10% droprate which is considerable for a low level entry quest

DELETE FROM `creature_loot_template` WHERE `Entry` IN (2956,2957,3068) AND `Item` IN (33009);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(2956, 33009, 0, 50, 1, 1, 0, 1, 1, 'Adult Plainstrider - Tender Strider Meat');
(2957, 33009, 0, 50, 1, 1, 0, 1, 1, 'Elder Plainstrider - Tender Strider Meat');
(3068, 33009, 0, 50, 1, 1, 0, 1, 1, 'Mazzranache - Tender Strider Meat');

-- Remove 'Get In' Icon on Refurbished Steam Tank

UPDATE `creature_template` SET `IconName` = '', `VehicleId` = 0 WHERE (`entry` = 29144);
