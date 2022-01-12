INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1641866061298667986');

-- Maraudon CTM
DELETE FROM `creature_template_movement` WHERE `CreatureId` IN 
(12223, 12207, 13323, 12216, 12217, 11790, 11791, 11792, 13141, 12236, 13142, 11345, 11685, 11785, 12222, 12221, 13282, 11794, 11784, 13743, 12206);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES 
(12223, 1, 1, 0, 0, 0, 0, NULL),
(12207, 1, 1, 0, 0, 0, 0, NULL),
(13323, 1, 1, 0, 0, 0, 0, NULL),
(12216, 1, 1, 0, 0, 0, 0, NULL),
(12217, 1, 1, 0, 0, 0, 0, NULL),
(11790, 1, 1, 0, 0, 0, 0, NULL),
(11791, 1, 1, 0, 0, 0, 0, NULL),
(11792, 1, 1, 0, 0, 0, 0, NULL),
(13141, 1, 1, 0, 0, 0, 0, NULL),
(12236, 1, 1, 0, 0, 0, 0, NULL),
(13142, 1, 1, 0, 0, 0, 0, NULL),
(11345, 1, 1, 0, 0, 0, 0, NULL),
(11685, 1, 1, 0, 0, 0, 0, NULL),
(11785, 1, 1, 0, 0, 0, 0, NULL),
(12222, 1, 1, 0, 0, 0, 0, NULL),
(13282, 1, 1, 0, 0, 0, 0, NULL),
(11794, 1, 1, 0, 0, 0, 0, NULL),
(13743, 1, 1, 0, 0, 0, 0, NULL),
(11784, 1, 1, 0, 0, 0, 0, NULL),
(12206, 1, 1, 0, 0, 0, 0, NULL),
(12221, 1, 1, 0, 0, 0, 0, NULL);
