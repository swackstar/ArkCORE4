
-- These two gossip menus on Injured rainspeaker oracle are not meant to be linked, they are two
-- seperate gossips the first one for Just Following Orders to help the injured rainspeaker oracle and start event
-- The second is to start the event for fortunate misunderstandings

UPDATE `gossip_menu_option` SET `action_menu_id`=0 WHERE  `menu_id`=9677 AND `id`=0;

-- Delete Ravenous Mangal Crocolisk as this is not meant to be spawned, it is summoned from spell
DELETE FROM `creature` WHERE  `guid`=229546; -- GUID by ArkDB
 
-- Spawn Shaman Jakjek and Lightningcaller Soo-met
DELETE FROM `creature` WHERE `id` IN(28106,28107); -- GUID by ArkDB 
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(199018, 28106, 571, 1, 1,  4869.281, 5912.271, -40.38539, 5.166174, 120, 0, 0), -- 28106 (Area: 3711)
(197944, 28107, 571, 1, 1,  5116.647, 5469.729, -91.70967, 1.605703, 120, 0, 0); -- 28107 (Area: 3711)

DELETE FROM `creature_template_addon` WHERE `entry` IN(28106,28107);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(28106, 0, 0x10000, 0x1, '52215'), -- 28106 - 52215
(28107, 0, 0x10000, 0x1, '52215'); -- 28107 - 52215

DELETE FROM `gossip_menu` WHERE `entry` IN(9744,9745);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(9745, 13364), -- 28106
(9744, 13363); -- 28107

-- The below spell area for phasing is not working correctly as these npcs should only be visible after a player has killed artruis and is working towards that faction
-- If a player swaps faction they are meant to no longer be able to see the npc for that faction
-- Currenly with below npc becomes visible once player unlocks dailies for that faction but will remain
-- visible even if player switches faction as there is no way of telling which faction player is working towards
-- as all quests remain completed, there a couple of hidden faction choice tracker quests too but even this stay rewarded
-- once spell is cast which adds hidden quest, other way would be by reputation but this is not possible with spell area either
-- My guess is a wolvar faction choice tracker and gorlok faction choice tracker quest and spells to engage these, cant find how these
-- would reset though

DELETE FROM `spell_area` WHERE `spell`=52217 AND `area` IN(4287,4288);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(52217,4287, 12692, 0, 0, 0, 2, 1, 64, 11),
(52217,4288, 12695, 0, 0, 0, 2, 1, 64, 11);

UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry` IN(28217,28325,28327);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(28217,28325,28327) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(28077) AND `source_type`=0 and `id`>14;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(28133) AND `source_type`=0 and `id`=4;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2811301) AND `source_type`=9 and `id`>0;
UPDATE `smart_scripts` SET `event_param1`=290 WHERE  `entryorguid`=28308 AND `source_type`=0 AND `id`=2 AND `link`=3;


DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2821700,2821701,2832700) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28217, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 11, 51329, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Cast Feign Death'), 
(28217, 0, 1, 14, 61, 0, 100, 0, 0, 0, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Set NPC Flags (Gossip Only)'), 
(28217, 0, 2, 3, 62, 0, 100, 0, 9677, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Say Line 1'), 
(28217, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 28, 51329, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Remove Aura - Feign Death'), 
(28217, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Remove Aura - Set NPC Flags - Quest + Gossip'), 
(28217, 0, 5, 15, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Close Gossip'), 
(28217, 0, 6, 0, 62, 0, 100, 0, 9677, 0, 0, 0, 85, 51382, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Invoker Cast Forcecast Summon Huge Crocolisk'), 
(28217, 0, 7, 0, 64, 0, 100, 0, 0, 0, 0, 0, 98, 9684, 13124, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Hello - Send Gossip Menu'), 
(28217, 0, 8, 10, 62, 0, 100, 0, 9684, 0, 0, 0, 2, 774, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Set Faction (Alliance)'), 
(28217, 0, 9, 10, 62, 0, 100, 0, 9684, 0, 0, 0, 2, 775, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Set Faction (Horde)'), 
(28217, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Store Targetlist'), 
(28217, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2821700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Run Script'), 
(28217, 0, 12, 0, 19, 0, 100, 0, 12570, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On On Quest Accept - Fortunate Misunderstandings - Say Line 2'), 
(28217, 0, 13, 0, 40, 0, 100, 0, 64, 28217, 0, 0, 80, 2821701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Reached WP80 - Run Script'), 
(28217, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 58806, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Add Aura Permanent Feign Death'), 
(28217, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 58806, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Select - Remove Aura Permanent Feign Death'), 
(28077, 0, 15, 16, 54, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Frenzyheart Tracker - On Just Summoned  - Set Orientation'), 
(28077, 0, 16, 17, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Frenzyheart Tracker - On Just Summoned  - Say Line 1'), 
(28077, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 8000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Frenzyheart Tracker - On Just Summoned  - Despawn After 8 seconds'), 
(28325, 0, 0, 0, 0, 0, 100, 0, 5000, 9000, 9000, 14000, 11, 34370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ravenous Mangal Crocolisk - In Combat - Cast Jagged Tooth Snap'),
(28325, 0, 1, 2, 54, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ravenous Mangal Crocolisk - On Just Summoned - Say Line 1'),
(28325, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Ravenous Mangal Crocolisk - On Just Summoned - Attack'),
(28325, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 51321, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ravenous Mangal Crocolisk - On Death - Cast Summon Shaman Vekjik'),
(28327, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - On Just Summoned - Say Line 1'),
(28327, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - On Just Summoned - Move to Position'),
(28327, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2832700, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - On Just Summoned - Run Script'),
(28113, 0, 4, 0, 64, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mosswalker Victim - On Gossip Hello - Say Line 3'),
(2821700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Set NPC Flags'),
(2821700, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Say Line 3'),
(2821700, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 53, 1, 28217, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Start WP'),
(2821701, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Say Line 4'),
(2821701, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51448, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Cast Oracle Intro Quest Complete'),
(2821701, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Say Line 5'),
(2821701, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 52100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Cast Summon Frenyheart Tracker'),
(2821701, 9, 4, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Despawn'),
(2811301, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 52156, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Mosswalker Victim - On Script - Cast Summon Shinies'),
(2811301, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mosswalker Victim - On Script - Kill Self'),
(2832700, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - Script - Say Line 2'),
(2832700, 9, 1, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - Script - Say Line 3'),
(2832700, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - Script - Say Line 4'),
(2832700, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - Script - Set Run On'),
(2832700, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 46, 50, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - Script - Move Foward'),
(2832700, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shaman Vekjik - Script - Despawn After 5 seconds');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9677;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=28217;

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 9677, 0, 0, 0, 1, 1, 51329, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if injured rainspeaker oracle has aura Feign Death'),
(22, 7, 28217, 0, 0, 9, 0, 12540, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle - Only run SAI if player has Just Following Orders taken'),
(22, 8, 28217, 0, 0, 9, 0, 12570, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle - Only run SAI if player has Fortunate Misunderstandings Taken'),
(22, 9, 28217, 0, 0, 16, 0, 1101, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle - Only run SAI if player is Alliance'),
(22, 10, 28217, 0, 0, 16, 0, 690, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle - Only run SAI if player is Horde');

DELETE FROM  `creature_text` WHERE `entry` IN(28217,28325,28327,28077,28213);
DELETE FROM  `creature_text` WHERE `entry` IN(28113) AND `groupid`=3;

INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
(28217, 0, 0, 'The Injured Rainspeaker Oracle rises clumsily to its feet.', 16, 0, 100, 0, 0, 0, 'Injured Rainspeaker Oracle',27785),
(28217, 1, 0, 'You tell us when it home time.', 12, 0, 100, 0, 0, 0, 'Injured Rainspeaker Oracle',27826),
(28217, 2, 0, 'Home not far. Come!', 12, 0, 100, 0, 0, 0, 'Injured Rainspeaker Oracle',27753),
(28217, 3, 0, 'Thanks!', 12, 0, 100, 0, 0, 0, 'Injured Rainspeaker Oracle',27752),
(28217, 4, 0, 'Oh no! Some puppy-men followed!', 12, 0, 100, 0, 0, 0, 'Injured Rainspeaker Oracle',27799),
(28325, 0, 0, 'You hear a low guttural growl from nearby.', 16, 0, 100, 0, 0, 0, 'Ravenous Mangal Crocolisk',27831),
(28327, 0, 0, 'Shaman Vekjik comes out of the underbrush nearby.', 16, 0, 100, 0, 0, 0, 'Shaman Vekjik',27738),
(28327, 1, 0, 'You help Rainspeaker! I saw you help Rainspeaker! Traitor thing!', 12, 0, 100, 0, 0, 0, 'Shaman Vekjik',27739),
(28327, 2, 0, 'If you want to be friends with big-tongues, you not friends with Frenzyheart! I tell village! We no trust you anymore!', 12, 0, 100, 0, 0, 0, 'Shaman Vekjik',27740),
(28327, 3, 0, 'Shaman Vekjik scurries off towards Frenzyheart Hill.', 16, 0, 100, 0, 0, 0, 'Shaman Vekjik',27741),
(28077, 0, 0, 'Dumb big-tongue lover! You not friend of Frenzyheart no more. Frenzyheart will get you good.', 14, 0, 100, 0, 0, 0, 'Frenzyheart Tracker',27798),
(28213, 0, 0, 'The %s screams with rage and rushes to the aid of her babies.', 16, 0, 100, 0, 0, 0, 'Hardknuckle Matriarch',27607),
(28113, 3, 0, 'The mosswalker victim groans in pain.', 16, 0, 100, 0, 0, 0, 'Mosswalker Victim',28638);

DELETE FROM `waypoints` WHERE `entry` IN(28217,28308);
DELETE FROM `script_waypoint` WHERE `entry` IN(28217);

INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(28217, 1,5462.371, 4514.91, -133.6022, 'Injured Rainspeaker Oracle'),
(28217, 2,5483.05, 4514.717, -141.1091, 'Injured Rainspeaker Oracle'),
(28217, 3,5485.3, 4516.467, -142.1091, 'Injured Rainspeaker Oracle'),
(28217, 4,5485.8, 4516.967, -143.3591, 'Injured Rainspeaker Oracle'),
(28217, 5,5486.8, 4517.717, -145.3591, 'Injured Rainspeaker Oracle'),
(28217, 6,5494.231, 4523.077, -149.136, 'Injured Rainspeaker Oracle'),
(28217, 7,5497.242, 4543.376, -146.9484, 'Injured Rainspeaker Oracle'),
(28217, 8,5499.492, 4544.876, -145.6984, 'Injured Rainspeaker Oracle'),
(28217, 9,5500.992, 4546.376, -145.1984, 'Injured Rainspeaker Oracle'),
(28217, 10,5502.492, 4547.626, -144.6984, 'Injured Rainspeaker Oracle'),
(28217, 11,5504.492, 4549.626, -143.9484, 'Injured Rainspeaker Oracle'),
(28217, 12,5507.492, 4552.126, -142.9484, 'Injured Rainspeaker Oracle'),
(28217, 13,5507.9, 4552.293, -142.7217, 'Injured Rainspeaker Oracle'),
(28217, 14,5509.15, 4553.793, -142.2217, 'Injured Rainspeaker Oracle'),
(28217, 15,5509.4, 4555.793, -141.7217, 'Injured Rainspeaker Oracle'),
(28217, 16,5509.4, 4558.793, -140.2217, 'Injured Rainspeaker Oracle'),
(28217, 17,5509.65, 4560.793, -139.4717, 'Injured Rainspeaker Oracle'),
(28217, 18,5509.9, 4563.543, -138.9717, 'Injured Rainspeaker Oracle'),
(28217, 19,5509.9, 4566.543, -137.9717, 'Injured Rainspeaker Oracle'),
(28217, 20,5510.15, 4568.543, -136.9717, 'Injured Rainspeaker Oracle'),
(28217, 21,5510.44, 4568.722, -136.8404, 'Injured Rainspeaker Oracle'),
(28217, 22,5510.44, 4571.722, -135.5904, 'Injured Rainspeaker Oracle'),
(28217, 23,5510.69, 4572.722, -135.3404, 'Injured Rainspeaker Oracle'),
(28217, 24,5510.69, 4575.722, -135.8404, 'Injured Rainspeaker Oracle'),
(28217, 25,5511.19, 4586.472, -135.0904, 'Injured Rainspeaker Oracle'),
(28217, 26,5511.44, 4589.472, -134.5904, 'Injured Rainspeaker Oracle'),
(28217, 27,5511.69, 4591.472, -133.8404, 'Injured Rainspeaker Oracle'),
(28217, 28,5511.69, 4593.472, -133.3404, 'Injured Rainspeaker Oracle'),
(28217, 29,5511.94, 4595.222, -132.5904, 'Injured Rainspeaker Oracle'),
(28217, 30,5512.074, 4593.584, -133.326, 'Injured Rainspeaker Oracle'),
(28217, 31,5512.074, 4595.584, -132.576, 'Injured Rainspeaker Oracle'),
(28217, 32,5512.324, 4597.584, -132.326, 'Injured Rainspeaker Oracle'),
(28217, 33,5513.824, 4600.334, -131.826, 'Injured Rainspeaker Oracle'),
(28217, 34,5514.824, 4601.834, -132.826, 'Injured Rainspeaker Oracle'),
(28217, 35,5515.324, 4602.834, -133.326, 'Injured Rainspeaker Oracle'),
(28217, 36,5518.074, 4607.084, -132.076, 'Injured Rainspeaker Oracle'),
(28217, 37,5520.074, 4610.334, -133.076, 'Injured Rainspeaker Oracle'),
(28217, 38,5520.324, 4611.084, -133.826, 'Injured Rainspeaker Oracle'),
(28217, 39,5520.824, 4611.834, -134.576, 'Injured Rainspeaker Oracle'),
(28217, 40,5521.324, 4612.834, -135.326, 'Injured Rainspeaker Oracle'),
(28217, 41,5521.824, 4613.584, -135.576, 'Injured Rainspeaker Oracle'),
(28217, 42,5524.574, 4617.834, -136.576, 'Injured Rainspeaker Oracle'),
(28217, 43,5528.879, 4624.343, -136.8704, 'Injured Rainspeaker Oracle'),
(28217, 44,5532.879, 4624.343, -137.1204, 'Injured Rainspeaker Oracle'),
(28217, 45,5550.51, 4624.694, -136.8637, 'Injured Rainspeaker Oracle'),
(28217, 46,5552.26, 4625.444, -137.3637, 'Injured Rainspeaker Oracle'),
(28217, 47,5565.26, 4629.944, -136.8637, 'Injured Rainspeaker Oracle'),
(28217, 48,5568.01, 4630.944, -136.3637, 'Injured Rainspeaker Oracle'),
(28217, 49,5571.01, 4631.944, -135.1137, 'Injured Rainspeaker Oracle'),
(28217, 50,5574.76, 4633.194, -134.3637, 'Injured Rainspeaker Oracle'),
(28217, 51,5577.51, 4634.194, -135.1137, 'Injured Rainspeaker Oracle'),
(28217, 52,5577.733, 4634.199, -135.0235, 'Injured Rainspeaker Oracle'),
(28217, 53,5580.983, 4635.449, -135.7735, 'Injured Rainspeaker Oracle'),
(28217, 54,5584.983, 4634.949, -136.0235, 'Injured Rainspeaker Oracle'),
(28217, 55,5587.983, 4634.449, -136.7735, 'Injured Rainspeaker Oracle'),
(28217, 56,5589.733, 4634.199, -138.0235, 'Injured Rainspeaker Oracle'),
(28217, 57,5594.733, 4633.699, -138.2735, 'Injured Rainspeaker Oracle'),
(28217, 58,5596.733, 4633.449, -137.5235, 'Injured Rainspeaker Oracle'),
(28217, 59,5599.733, 4633.199, -136.7735, 'Injured Rainspeaker Oracle'),
(28217, 60,5606.606, 4632.268, -136.4532, 'Injured Rainspeaker Oracle'),
(28217, 61,5612.106, 4626.518, -137.2032, 'Injured Rainspeaker Oracle'),
(28217, 62,5616.856, 4621.768, -137.7032, 'Injured Rainspeaker Oracle'),
(28217, 63,5620.638, 4618.1, -137.5758, 'Injured Rainspeaker Oracle'),
(28217, 64,5625.388, 4612.85, -137.0758, 'Injured Rainspeaker Oracle'),
(28308,1, 5295.424, 4436.538, -97.6029,'Captive Crocolisk'),
(28308,2, 5291.674, 4435.038, -97.1029,'Captive Crocolisk'),
(28308,3, 5287.924, 4433.538, -96.3529,'Captive Crocolisk'),
(28308,4, 5277.924, 4429.538, -95.8529,'Captive Crocolisk'),
(28308,5, 5277.777, 4429.427, -95.94301,'Captive Crocolisk'),
(28308,6, 5268.277, 4425.427, -95.44301,'Captive Crocolisk'),
(28308,7, 5249.84, 4405.99, -95.93161,'Captive Crocolisk'),
(28308,8, 5251.84, 4401.24, -95.18161,'Captive Crocolisk'),
(28308,9, 5262.34, 4376.74, -95.68161,'Captive Crocolisk'),
(28308,10, 5263.34, 4373.99, -96.43161,'Captive Crocolisk'),
(28308,11, 5264.34, 4371.99, -96.93161,'Captive Crocolisk'),
(28308,12, 5265.34, 4369.24, -97.68161,'Captive Crocolisk'),
(28308,13, 5262.209, 4376.323, -95.75699,'Captive Crocolisk'),
(28308,14, 5263.459, 4373.823, -96.50699,'Captive Crocolisk'),
(28308,15, 5264.209, 4372.073, -97.25699,'Captive Crocolisk'),
(28308,16, 5265.459, 4369.323, -98.00699,'Captive Crocolisk'),
(28308,17, 5266.959, 4365.823, -98.00699,'Captive Crocolisk'),
(28308,18, 5272.959, 4366.073, -99.00699,'Captive Crocolisk'),
(28308,19, 5274.709, 4366.073, -99.50699,'Captive Crocolisk'),
(28308,20, 5277.709, 4366.323, -100.257,'Captive Crocolisk'),
(28308,21, 5284.709, 4366.573, -101.007,'Captive Crocolisk'),
(28308,22, 5288.709, 4366.823, -101.757,'Captive Crocolisk'),
(28308,23, 5284.895, 4366.406, -101.2539,'Captive Crocolisk'),
(28308,24, 5288.895, 4366.656, -102.0039,'Captive Crocolisk'),
(28308,25, 5289.395, 4366.656, -102.0039,'Captive Crocolisk'),
(28308,26, 5291.395, 4366.406, -103.0039,'Captive Crocolisk'),
(28308,27, 5293.395, 4366.156, -104.2539,'Captive Crocolisk'),
(28308,28, 5294.395, 4366.156, -105.0039,'Captive Crocolisk'),
(28308,29, 5295.395, 4366.156, -106.0039,'Captive Crocolisk'),
(28308,30, 5296.395, 4365.906, -106.5039,'Captive Crocolisk'),
(28308,31, 5297.395, 4365.906, -107.2539,'Captive Crocolisk'),
(28308,32, 5298.395, 4365.906, -108.0039,'Captive Crocolisk'),
(28308,33, 5299.145, 4365.656, -108.7539,'Captive Crocolisk'),
(28308,34, 5300.145, 4365.656, -109.5039,'Captive Crocolisk'),
(28308,35, 5302.145, 4365.406, -110.0039,'Captive Crocolisk'),
(28308,36, 5304.145, 4365.406, -110.5039,'Captive Crocolisk'),
(28308,37, 5305.145, 4365.156, -111.2539,'Captive Crocolisk'),
(28308,38, 5306.145, 4365.156, -112.0039,'Captive Crocolisk'),
(28308,39, 5307.145, 4365.156, -112.5039,'Captive Crocolisk'),
(28308,40, 5308.145, 4365.156, -113.2539,'Captive Crocolisk'),
(28308,41, 5309.145, 4364.906, -114.0039,'Captive Crocolisk'),
(28308,42, 5311.145, 4364.906, -115.0039,'Captive Crocolisk'),
(28308,43, 5313.145, 4364.656, -116.0039,'Captive Crocolisk'),
(28308,44, 5316.145, 4364.406, -116.7539,'Captive Crocolisk'),
(28308,45, 5318.145, 4364.406, -117.5039,'Captive Crocolisk'),
(28308,46, 5320.145, 4364.406, -118.2539,'Captive Crocolisk'),
(28308,47, 5322.145, 4364.156, -119.0039,'Captive Crocolisk'),
(28308,48, 5325.145, 4363.906, -120.0039,'Captive Crocolisk'),
(28308,49, 5325.253, 4363.768, -120.1149,'Captive Crocolisk'),
(28308,50, 5330.003, 4363.268, -120.8649,'Captive Crocolisk'),
(28308,51, 5334.503, 4358.018, -121.6149,'Captive Crocolisk'),
(28308,52, 5336.503, 4355.768, -122.3649,'Captive Crocolisk'),
(28308,53, 5339.253, 4353.018, -123.3649,'Captive Crocolisk'),
(28308,54, 5341.253, 4350.768, -124.3649,'Captive Crocolisk'),
(28308,55, 5343.003, 4348.518, -126.1149,'Captive Crocolisk'),
(28308,56, 5345.003, 4346.018, -128.1149,'Captive Crocolisk'),
(28308,57, 5346.253, 4344.518, -129.6149,'Captive Crocolisk'),
(28308,58, 5347.003, 4343.768, -130.8649,'Captive Crocolisk'),
(28308,59, 5348.253, 4342.268, -132.3649,'Captive Crocolisk'),
(28308,60, 5349.003, 4341.518, -133.8649,'Captive Crocolisk'),
(28308,61, 5350.473, 4340.604, -135.0103,'Captive Crocolisk'),
(28308,62, 5351.223, 4340.104, -136.2603,'Captive Crocolisk'),
(28308,63, 5353.223, 4339.604, -137.2603,'Captive Crocolisk'),
(28308,64, 5354.973, 4338.854, -138.2603,'Captive Crocolisk'),
(28308,65, 5357.473, 4337.604, -139.0103,'Captive Crocolisk'),
(28308,66, 5359.223, 4336.604, -139.5103,'Captive Crocolisk'),
(28308,67, 5361.973, 4335.354, -140.5103,'Captive Crocolisk'),
(28308,68, 5363.723, 4334.604, -141.0103,'Captive Crocolisk'),
(28308,69, 5364.094, 4334.348, -141.0889,'Captive Crocolisk'),
(28308,70, 5365.344, 4333.598, -141.0889,'Captive Crocolisk'),
(28308,71, 5369.594, 4331.098, -142.5889,'Captive Crocolisk'),
(28308,72, 5372.844, 4328.848, -143.5889,'Captive Crocolisk'),
(28308,73, 5376.344, 4326.598, -144.5889,'Captive Crocolisk'),
(28308,74, 5379.344, 4324.598, -145.3389,'Captive Crocolisk'),
(28308,75, 5382.594, 4322.598, -146.0889,'Captive Crocolisk'),
(28308,76, 5402.844, 4309.598, -144.5889,'Captive Crocolisk'),
(28308,77, 5403.844, 4309.098, -143.3389,'Captive Crocolisk'),
(28308,78, 5403.236, 4309.773, -144.7202,'Captive Crocolisk'),
(28308,79, 5403.986, 4309.273, -143.2202,'Captive Crocolisk'),
(28308,80, 5405.736, 4308.023, -141.7202,'Captive Crocolisk'),
(28308,81, 5407.736, 4308.023, -141.2202,'Captive Crocolisk'),
(28308,82, 5409.736, 4307.773, -140.4702,'Captive Crocolisk'),
(28308,83, 5412.486, 4307.523, -139.7202,'Captive Crocolisk'),
(28308,84, 5416.486, 4307.273, -138.2202,'Captive Crocolisk'),
(28308,85, 5419.486, 4307.023, -137.7202,'Captive Crocolisk'),
(28308,86, 5424.486, 4306.773, -136.9702,'Captive Crocolisk'),
(28308,87, 5432.486, 4306.023, -136.4702,'Captive Crocolisk'),
(28308,88, 5432.637, 4305.777, -136.2332,'Captive Crocolisk'),
(28308,89, 5435.137, 4305.777, -135.9832,'Captive Crocolisk'),
(28308,90, 5439.137, 4305.277, -135.4832,'Captive Crocolisk'),
(28308,91, 5442.887, 4304.777, -134.7332,'Captive Crocolisk'),
(28308,92, 5445.887, 4304.527, -134.2332,'Captive Crocolisk'),
(28308,93, 5450.887, 4304.027, -133.4832,'Captive Crocolisk'),
(28308,94, 5458.887, 4303.027, -132.9832,'Captive Crocolisk'),
(28308,95, 5459.032, 4302.869, -132.6968,'Captive Crocolisk'),
(28308,96, 5465.032, 4302.119, -132.6968,'Captive Crocolisk'),
(28308,97, 5481.032, 4297.369, -131.9468,'Captive Crocolisk'),
(28308,98, 5483.032, 4296.869, -131.1968,'Captive Crocolisk'),
(28308,99, 5484.782, 4296.369, -130.6968,'Captive Crocolisk'),
(28308,100, 5485.782, 4296.119, -129.9468,'Captive Crocolisk'),
(28308,101, 5487.782, 4295.619, -128.9468,'Captive Crocolisk'),
(28308,102, 5489.532, 4294.869, -127.4468,'Captive Crocolisk'),
(28308,103, 5489.61, 4294.574, -127.3404,'Captive Crocolisk'),
(28308,104, 5490.61, 4294.324, -127.0904,'Captive Crocolisk'),
(28308,105, 5491.11, 4293.574, -126.3404,'Captive Crocolisk'),
(28308,106, 5491.86, 4291.824, -125.3404,'Captive Crocolisk'),
(28308,107, 5492.86, 4290.074, -124.0904,'Captive Crocolisk'),
(28308,108, 5493.86, 4288.324, -122.5904,'Captive Crocolisk'),
(28308,109, 5494.86, 4286.574, -121.5904,'Captive Crocolisk'),
(28308,110, 5495.36, 4285.574, -121.0904,'Captive Crocolisk'),
(28308,111, 5496.36, 4284.074, -119.3404,'Captive Crocolisk'),
(28308,112, 5496.61, 4283.074, -118.8404,'Captive Crocolisk'),
(28308,113, 5496.464, 4283.905, -119.1085,'Captive Crocolisk'),
(28308,114, 5496.964, 4282.905, -118.6085,'Captive Crocolisk'),
(28308,115, 5497.464, 4282.155, -117.3585,'Captive Crocolisk'),
(28308,116, 5497.964, 4281.155, -116.8585,'Captive Crocolisk'),
(28308,117, 5498.964, 4279.405, -115.8585,'Captive Crocolisk'),
(28308,118, 5499.214, 4278.655, -114.8585,'Captive Crocolisk'),
(28308,119, 5500.214, 4276.655, -113.6085,'Captive Crocolisk'),
(28308,120, 5501.714, 4274.155, -112.3585,'Captive Crocolisk'),
(28308,121, 5502.714, 4272.405, -111.6085,'Captive Crocolisk'),
(28308,122, 5503.714, 4270.655, -110.6085,'Captive Crocolisk'),
(28308,123, 5503.964, 4269.905, -110.1085,'Captive Crocolisk'),
(28308,124, 5505.464, 4268.655, -109.3585,'Captive Crocolisk'),
(28308,125, 5507.464, 4266.405, -107.8585,'Captive Crocolisk'),
(28308,126, 5508.714, 4265.155, -107.3585,'Captive Crocolisk'),
(28308,127, 5510.214, 4263.655, -106.1085,'Captive Crocolisk'),
(28308,128, 5511.714, 4262.155, -105.1085,'Captive Crocolisk'),
(28308,129, 5513.714, 4260.155, -104.3585,'Captive Crocolisk'),
(28308,130, 5515.964, 4257.905, -103.6085,'Captive Crocolisk'),
(28308,131, 5517.964, 4255.905, -103.1085,'Captive Crocolisk'),
(28308,132, 5518.275, 4255.893, -103.0304,'Captive Crocolisk'),
(28308,133, 5518.525, 4255.643, -102.7804,'Captive Crocolisk'),
(28308,134, 5521.525, 4256.143, -102.2804,'Captive Crocolisk'),
(28308,135, 5540.806, 4259.841, -102.1478,'Captive Crocolisk'),
(28308,136, 5552.306, 4261.591, -102.6478,'Captive Crocolisk'),
(28308,137, 5552.562, 4261.524, -102.5733,'Captive Crocolisk'),
(28308,138, 5564.562, 4263.524, -102.3233,'Captive Crocolisk'),
(28308,139, 5567.062, 4263.024, -101.8233,'Captive Crocolisk'),
(28308,140, 5570.062, 4262.774, -101.0733,'Captive Crocolisk'),
(28308,141, 5573.062, 4262.524, -100.5733,'Captive Crocolisk'),
(28308,142, 5581.062, 4261.524, -100.0733,'Captive Crocolisk'),
(28308,143, 5585.062, 4261.274, -99.32326,'Captive Crocolisk'),
(28308,144, 5585.636, 4261.419, -99.31418,'Captive Crocolisk'),
(28308,145, 5607.386, 4259.919, -98.81418,'Captive Crocolisk'),
(28308,146, 5607.644, 4260.124, -98.76741,'Captive Crocolisk'),
(28308,147, 5609.894, 4259.874, -98.76741,'Captive Crocolisk'),
(28308,148, 5620.644, 4259.624, -98.01741,'Captive Crocolisk'),
(28308,149, 5620.918, 4259.831, -98.01412,'Captive Crocolisk'),
(28308,150, 5633.668, 4259.581, -98.26412,'Captive Crocolisk'),
(28308,151, 5652.418, 4260.331, -98.76412,'Captive Crocolisk'),
(28308,152, 5652.634, 4260.799, -99.03739,'Captive Crocolisk'),
(28308,153, 5660.884, 4261.299, -98.53739,'Captive Crocolisk'),
(28308,154, 5681.829, 4266.604, -99.07877,'Captive Crocolisk'),
(28308,155, 5683.829, 4267.104, -99.57877,'Captive Crocolisk'),
(28308,156, 5686.579, 4267.604, -100.3288,'Captive Crocolisk'),
(28308,157, 5688.329, 4268.104, -100.8288,'Captive Crocolisk'),
(28308,158, 5691.329, 4268.854, -101.3288,'Captive Crocolisk'),
(28308,159, 5695.079, 4269.854, -102.0788,'Captive Crocolisk'),
(28308,160, 5699.079, 4270.854, -102.8288,'Captive Crocolisk'),
(28308,161, 5699.236, 4271.2, -103.1089,'Captive Crocolisk'),
(28308,162, 5708.486, 4273.7, -102.8589,'Captive Crocolisk'),
(28308,163, 5714.236, 4275.2, -103.3589,'Captive Crocolisk'),
(28308,164, 5717.736, 4275.95, -104.1089,'Captive Crocolisk'),
(28308,165, 5721.736, 4276.95, -104.8589,'Captive Crocolisk'),
(28308,166, 5725.486, 4277.95, -105.3589,'Captive Crocolisk'),
(28308,167, 5729.486, 4278.95, -106.1089,'Captive Crocolisk'),
(28308,168, 5732.236, 4279.7, -106.3589,'Captive Crocolisk'),
(28308,169, 5735.236, 4280.45, -106.8589,'Captive Crocolisk'),
(28308,170, 5737.986, 4281.2, -107.8589,'Captive Crocolisk'),
(28308,171, 5739.986, 4281.7, -108.6089,'Captive Crocolisk'),
(28308,172, 5741.986, 4282.45, -109.3589,'Captive Crocolisk'),
(28308,173, 5743.986, 4282.95, -110.1089,'Captive Crocolisk'),
(28308,174, 5746.736, 4283.7, -110.8589,'Captive Crocolisk'),
(28308,175, 5750.526, 4285.622, -112.3181,'Captive Crocolisk'),
(28308,176, 5752.526, 4287.872, -113.0681,'Captive Crocolisk'),
(28308,177, 5754.776, 4289.872, -113.8181,'Captive Crocolisk'),
(28308,178, 5757.026, 4291.872, -114.5681,'Captive Crocolisk'),
(28308,179, 5759.276, 4293.872, -113.0681,'Captive Crocolisk'),
(28308,180, 5836.026, 4365.122, -114.5681,'Captive Crocolisk'),
(28308,181, 5838.276, 4367.122, -113.0681,'Captive Crocolisk'),
(28308,182, 5840.798, 4369.525, -110.6656,'Captive Crocolisk'),
(28308,183, 5842.548, 4370.525, -109.9156,'Captive Crocolisk'),
(28308,184, 5843.298, 4371.025, -109.4156,'Captive Crocolisk'),
(28308,185, 5845.048, 4372.275, -108.4156,'Captive Crocolisk'),
(28308,186, 5846.548, 4373.525, -107.6656,'Captive Crocolisk'),
(28308,187, 5850.048, 4375.775, -106.6656,'Captive Crocolisk'),
(28308,188, 5852.298, 4377.275, -105.6656,'Captive Crocolisk'),
(28308,189, 5855.798, 4379.775, -104.4156,'Captive Crocolisk'),
(28308,190, 5857.298, 4380.775, -103.6656,'Captive Crocolisk'),
(28308,191, 5858.048, 4381.275, -102.9156,'Captive Crocolisk'),
(28308,192, 5859.048, 4382.025, -100.9156,'Captive Crocolisk'),
(28308,193, 5859.798, 4382.525, -100.1656,'Captive Crocolisk'),
(28308,194, 5862.298, 4384.275, -99.41559,'Captive Crocolisk'),
(28308,195, 5863.798, 4385.275, -100.4156,'Captive Crocolisk'),
(28308,196, 5868.048, 4388.275, -99.91559,'Captive Crocolisk'),
(28308,197, 5871.048, 4390.275, -99.16559,'Captive Crocolisk'),
(28308,198, 5874.298, 4392.525, -98.41559,'Captive Crocolisk'),
(28308,199, 5878.548, 4395.275, -97.91559,'Captive Crocolisk'),
(28308,200, 5889.048, 4402.775, -97.16559,'Captive Crocolisk'),
(28308,201, 5890.798, 4404.025, -96.41559,'Captive Crocolisk'),
(28308,202, 5893.298, 4405.525, -95.91559,'Captive Crocolisk'),
(28308,203, 5896.548, 4407.775, -95.16559,'Captive Crocolisk'),
(28308,204, 5889.418, 4402.901, -97.02716,'Captive Crocolisk'),
(28308,205, 5891.168, 4404.151, -96.27716,'Captive Crocolisk'),
(28308,206, 5893.418, 4405.901, -95.77716,'Captive Crocolisk'),
(28308,207, 5896.918, 4408.151, -95.27716,'Captive Crocolisk'),
(28308,208, 5897.418, 4408.651, -95.02716,'Captive Crocolisk'),
(28308,209, 5901.418, 4413.151, -94.52716,'Captive Crocolisk'),
(28308,210, 5906.418, 4419.151, -93.77716,'Captive Crocolisk'),
(28308,211, 5910.418, 4423.401, -93.27716,'Captive Crocolisk'),
(28308,212, 5922.168, 4437.151, -93.77716,'Captive Crocolisk'),
(28308,213, 5924.918, 4440.151, -94.52716,'Captive Crocolisk'),
(28308,214, 5922.623, 4437.382, -93.73592,'Captive Crocolisk'),
(28308,215, 5925.123, 4440.382, -94.23592,'Captive Crocolisk'),
(28308,216, 5925.623, 4440.882, -94.23592,'Captive Crocolisk'),
(28308,217, 5927.373, 4443.132, -94.73592,'Captive Crocolisk'),
(28308,218, 5929.873, 4446.382, -95.48592,'Captive Crocolisk'),
(28308,219, 5932.373, 4449.632, -95.98592,'Captive Crocolisk'),
(28308,220, 5935.123, 4453.382, -96.73592,'Captive Crocolisk'),
(28308,221, 5940.623, 4460.382, -95.98592,'Captive Crocolisk'),
(28308,222, 5941.873, 4461.882, -95.23592,'Captive Crocolisk'),
(28308,223, 5944.373, 4465.132, -94.48592,'Captive Crocolisk'),
(28308,224, 5947.373, 4469.132, -93.98592,'Captive Crocolisk'),
(28308,225, 5947.696, 4469.354, -94.11644,'Captive Crocolisk'),
(28308,226, 5953.196, 4476.604, -94.11644,'Captive Crocolisk'),
(28308,227, 5955.196, 4482.104, -93.61644,'Captive Crocolisk'),
(28308,228, 5956.696, 4485.604, -92.86644,'Captive Crocolisk'),
(28308,229, 5955.557, 4482.148, -93.45278,'Captive Crocolisk'),
(28308,230, 5957.057, 4485.898, -92.95278,'Captive Crocolisk'),
(28308,231, 5964.307, 4503.898, -92.70278,'Captive Crocolisk'),
(28308,232, 5962.057, 4529.648, -93.45278,'Captive Crocolisk'),
(28308,233, 5961.557, 4533.648, -93.95278,'Captive Crocolisk'),
(28308,234, 5961.307, 4536.648, -94.45278,'Captive Crocolisk'),
(28308,235, 5960.807, 4543.648, -94.95278,'Captive Crocolisk'),
(28308,236, 5962.334, 4529.804, -93.40747,'Captive Crocolisk'),
(28308,237, 5961.834, 4533.804, -93.90747,'Captive Crocolisk'),
(28308,238, 5961.584, 4536.804, -94.65747,'Captive Crocolisk'),
(28308,239, 5961.084, 4543.804, -95.15747,'Captive Crocolisk'),
(28308,240, 5960.834, 4546.804, -95.40747,'Captive Crocolisk'),
(28308,241, 5963.334, 4564.304, -95.90747,'Captive Crocolisk'),
(28308,242, 5963.584, 4566.304, -96.65747,'Captive Crocolisk'),
(28308,243, 5963.834, 4569.304, -97.65747,'Captive Crocolisk'),
(28308,244, 5963.431, 4564.66, -96.028,'Captive Crocolisk'),
(28308,245, 5963.681, 4566.66, -96.778,'Captive Crocolisk'),
(28308,246, 5963.931, 4569.66, -97.528,'Captive Crocolisk'),
(28308,247, 5965.431, 4579.41, -97.028,'Captive Crocolisk'),
(28308,248, 5969.632, 4614.113, -97.93755,'Captive Crocolisk'),
(28308,249, 5970.632, 4621.863, -98.43755,'Captive Crocolisk'),
(28308,250, 5976.144, 4659.492, -99.19481,'Captive Crocolisk'),
(28308,251, 5979.644, 4667.742, -98.44481,'Captive Crocolisk'),
(28308,252, 5980.644, 4670.492, -97.94481,'Captive Crocolisk'),
(28308,253, 5983.644, 4677.742, -97.19481,'Captive Crocolisk'),
(28308,254, 5990.394, 4693.242, -97.94481,'Captive Crocolisk'),
(28308,255, 5991.394, 4695.992, -98.44481,'Captive Crocolisk'),
(28308,256, 5983.768, 4677.933, -97.22537,'Captive Crocolisk'),
(28308,257, 5990.518, 4693.683, -97.47537,'Captive Crocolisk'),
(28308,258, 5991.768, 4696.433, -98.22537,'Captive Crocolisk'),
(28308,259, 5993.268, 4699.683, -98.97537,'Captive Crocolisk'),
(28308,260, 5995.518, 4704.183, -98.22537,'Captive Crocolisk'),
(28308,261, 5996.768, 4706.933, -97.47537,'Captive Crocolisk'),
(28308,262, 5998.518, 4710.433, -96.97537,'Captive Crocolisk'),
(28308,263, 6015.43, 4744.089, -96.98655,'Captive Crocolisk'),
(28308,264, 6021.18, 4757.589, -96.48655,'Captive Crocolisk'),
(28308,265, 6023.68, 4762.839, -95.98655,'Captive Crocolisk'),
(28308,266, 6029.43, 4775.839, -95.48655,'Captive Crocolisk'),
(28308,267, 6032.68, 4783.089, -94.73655,'Captive Crocolisk'),
(28308,268, 6029.549, 4775.949, -95.34583,'Captive Crocolisk'),
(28308,269, 6032.799, 4783.199, -94.84583,'Captive Crocolisk'),
(28308,270, 6035.549, 4788.949, -94.59583,'Captive Crocolisk'),
(28308,271, 6040.799, 4796.199, -93.84583,'Captive Crocolisk'),
(28308,272, 6052.299, 4810.949, -94.34583,'Captive Crocolisk'),
(28308,273, 6055.299, 4814.949, -93.34583,'Captive Crocolisk'),
(28308,274, 6058.299, 4818.949, -93.84583,'Captive Crocolisk'),
(28308,275, 6056.549, 4816.449, -92.84583,'Captive Crocolisk'),
(28308,276, 6059.549, 4820.449, -94.34583,'Captive Crocolisk'),
(28308,277, 6055.51, 4815.281, -93.31942,'Captive Crocolisk'),
(28308,278, 6056.76, 4816.781, -92.81942,'Captive Crocolisk'),
(28308,279, 6058.51, 4819.281, -93.81942,'Captive Crocolisk'),
(28308,280, 6059.76, 4820.781, -94.06942,'Captive Crocolisk'),
(28308,281, 6065.01, 4827.781, -94.06942,'Captive Crocolisk'),
(28308,282, 6065.26, 4840.781, -93.56942,'Captive Crocolisk'),
(28308,283, 6065.26, 4841.781, -92.81942,'Captive Crocolisk'),
(28308,284, 6065.26, 4848.531, -93.81942,'Captive Crocolisk'),
(28308,285, 6065.731, 4870.604, -94.3074,'Captive Crocolisk'),
(28308,286, 6077.481, 4876.354, -93.8074,'Captive Crocolisk'),
(28308,287, 6096.964, 4885.957, -94.31221,'Captive Crocolisk'),
(28308,288, 6119.714, 4901.457, -94.56221,'Captive Crocolisk'),
(28308,289, 6120.019, 4901.537, -94.72534,'Captive Crocolisk'),
(28308,290, 6120.519, 4902.037, -94.72534,'Captive Crocolisk');
