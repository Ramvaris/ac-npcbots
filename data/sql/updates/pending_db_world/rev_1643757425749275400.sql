INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1643757425749275400');
UPDATE `quest_template_addon` SET `PrevQuestID` = 9280 WHERE `id` IN (9288, 9290, 9287, 9291, 9421, 9290);
UPDATE `quest_template` SET `Flags` = 65664, `AllowableRaces` = 1024 WHERE `id` IN (9288, 9290, 9287, 9291, 9421, 9290);
