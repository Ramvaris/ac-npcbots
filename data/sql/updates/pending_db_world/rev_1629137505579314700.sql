INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1629137505579314700');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 17770 AND `spell_effect` = 29940;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (17770,29940,0,'Wolfshead Helm Energy');
