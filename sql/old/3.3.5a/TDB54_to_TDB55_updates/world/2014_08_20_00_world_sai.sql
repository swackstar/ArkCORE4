

SET @CGUID := 197263; -- GUID by ArkDB

DELETE FROM `creature` WHERE  `guid` BETWEEN @CGUID AND @CGUID+10;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 28332, 571, 1, 1, 5711.057, 645.7639, 672.0823, 0, 120, 0, 0),  -- top
(@CGUID+1, 28332, 571, 1, 1, 5713.228, 646.6321, 653.1444, 0, 120, 0, 0), 
(@CGUID+2, 28332, 571, 1, 1, 5713.016, 648.0272, 657.1592, 0, 120, 0, 0), 
(@CGUID+3, 28332, 571, 1, 1, 5710.699, 648.6166, 656.5358, 0, 120, 0, 0), 
(@CGUID+4, 28332, 571, 1, 1, 5711.029, 645.7101, 653.7773, 0, 120, 0, 0), 
(@CGUID+5, 28332, 571, 1, 1, 5712.544, 644.6033, 656.4701, 0, 120, 0, 0), 
(@CGUID+6, 28332, 571, 1, 1, 5709.351, 644.943, 655.8727, 0, 120, 0, 0), 
(@CGUID+7, 28332, 571, 1, 1, 5711.693, 645.9358, 737.1865, 0, 120, 0, 0), 
(@CGUID+8, 28332, 571, 1, 1, 5711.447, 646.1441, 761.046, 0, 120, 0, 0), 
(@CGUID+9, 28332, 571, 1, 1, 5711.718, 645.9705, 796.1944, 0, 120, 0, 0), 
(@CGUID+10, 28332, 571, 1, 1, 5711.647, 645.8472, 856.7622, 0, 120, 0, 0); 

UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry` IN(34044,16128,28332,30116);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(34044,16128,28332,30116) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(-@CGUID-0,-@CGUID-1,-@CGUID-2,-@CGUID-3,-@CGUID-4,-@CGUID-5,-@CGUID-6,-@CGUID-7,-@CGUID-8,-@CGUID-9,-@CGUID-10) AND `source_type`=0;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(1612800,1612801,1612802,2833200,3011600) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(30116, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 80, 3011600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Archmage Aethas Sunreaver <Kirin Tor> - On Data Set - Run Script'), -- On retail Rhonin teleports back to original position since on tc teleport does not work for npcs this script is to respawn rhonin otherwise takes a long time to respawn.

(16128, 0, 0, 5, 20, 0, 100, 0, 13631, 0, 0, 0, 80, 1612800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - On Quest Reward (All Is Well That Ends Well) - Run Script'),
(16128, 0, 1, 5, 20, 0, 100, 0, 13819, 0, 0, 0, 80, 1612800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - On Quest Reward (Heroic: All Is Well That Ends Well) - Run Script'),
(16128, 0, 2, 0, 38, 0, 100, 0, 1, 1, 0, 0, 80, 1612801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - On Data Set 1 1 - Run Script 2'),
(16128, 0, 3, 0, 40, 0, 100, 0, 11, 16128, 0, 0, 80, 1612802, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - On Reached WP11 - Run Script 3'),
(16128, 0, 4, 5, 38, 0, 100, 0, 6, 6, 0, 0, 80, 1612800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - On Quest Reward (All Is Well That Ends Well) - Run Script'),
(16128, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 30116, 0, 0, 0, 0, 0, 0, 'Rhonin - Link - Set Data to Archmage Aethas Sunreaver <Kirin Tor>'), -- To trigger respawn script
(34044, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 53, 0, 34044, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann Bronzebeard - On On Spawn - Start WP'),
(34044, 0, 1, 2, 40, 0, 100, 0, 11, 34044, 0, 0, 54, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann Bronzebeard - On Reached WP13 - Pause WP'),
(34044, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann Bronzebeard - On Reached WP13 - Say Line 1'),
(34044, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 16128, 0, 0, 0, 0, 0, 0, 'Brann Bronzebeard - On Reached WP13 - Set Data On Rhonin'),
(34044, 0, 4, 0, 38, 0, 100, 0, 1, 1, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann Bronzebeard - On Data Set - Despawn'),
(-@CGUID-1, 0, 0, 0, 38, 0, 100, 0, 32, 32, 0, 0, 11, 64367, 0, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Algalon Event Beam'),
(-@CGUID-2, 0, 0, 0, 38, 0, 100, 0, 32, 32, 0, 0, 11, 64367, 0, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Algalon Event Beam'),
(-@CGUID-3, 0, 0, 0, 38, 0, 100, 0, 32, 32, 0, 0, 11, 64367, 0, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Algalon Event Beam'),
(-@CGUID-4, 0, 0, 0, 38, 0, 100, 0, 32, 32, 0, 0, 11, 64367, 0, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Algalon Event Beam'),
(-@CGUID-5, 0, 0, 0, 38, 0, 100, 0, 32, 32, 0, 0, 11, 64367, 0, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Algalon Event Beam'),
(-@CGUID-6, 0, 0, 0, 38, 0, 100, 0, 32, 32, 0, 0, 11, 64367, 0, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Algalon Event Beam'),
(-@CGUID-0, 0, 0, 0, 38, 0, 100, 0, 30, 30, 0, 0, 11, 64580, 2, 0, 0, 0, 0, 10, @CGUID+7, 28332, 0, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Reply-Code Alpha (Phase 2)'),
(-@CGUID-7, 0, 0, 0, 38, 0, 100, 0, 30, 30, 0, 0, 11, 64580, 2, 0, 0, 0, 0, 10, @CGUID+8, 28332, 0, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Reply-Code Alpha (Phase 2)'),
(-@CGUID-8, 0, 0, 0, 38, 0, 100, 0, 30, 30, 0, 0, 11, 64580, 2, 0, 0, 0, 0, 10, @CGUID+9, 28332, 0, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Reply-Code Alpha (Phase 2)'),
(-@CGUID-9, 0, 0, 0, 38, 0, 100, 0, 30, 30, 0, 0, 11, 64580, 2, 0, 0, 0, 0, 10, @CGUID+10, 28332, 0, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Reply-Code Alpha (Phase 2)'),
(-@CGUID-10, 0, 0, 0, 38, 0, 100, 0, 29, 29, 0, 0, 11, 64581, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Reply-Code Alpha (Phase 2)'),
(-@CGUID-10, 0, 1, 0, 38, 0, 100, 0, 31, 31, 0, 0, 11, 64510, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Cast Reply-Code Alpha (Phase 2)'),
(-@CGUID-0, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-1, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-2, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-3, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-4, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-5, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-6, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-7, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-8, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-9, 0, 1, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(-@CGUID-10, 0, 2, 0, 38, 0, 100, 0, 28, 28, 0, 0, 80, 2833200, 2, 0, 0, 0, 0, 9, 28332, 20, 200, 0, 0, 0, 0, 'Generic Trigger LAB (Large AOI) - On Data Set - Run Script'),
(3011600, 9, 0, 0, 0, 0, 100, 0, 205000, 205000, 0, 0, 70, 0, 0, 0, 0, 0, 0, 10, 95366, 16128, 0, 0, 0, 0, 0, 'Archmage Aethas Sunreaver <Kirin Tor> - Script - Respawn Rhonin'),
(2833200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 64367, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Generic Trigger LAB - Script - Remove aura'),
(2833200, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 64510, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Generic Trigger LAB - Script - Remove aura'),
(2833200, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 64580, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Generic Trigger LAB - Script - Remove aura'),
(1612800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script - Set NPC Flags'),
(1612800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 34044, 1, 300000, 0, 0, 0, 8, 0, 0, 0, 5800.296, 822.4527, 668.519, 4.812811, 'Rhonin - Script - Summon Brann Bronzebeard'),
(1612800, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script - Say Line 1'),
(1612801, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 53, 0, 16128, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 2 - Start WP'),
(1612802, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 32, 32, 0, 0, 0, 0, 10, @CGUID+1, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 32, 32, 0, 0, 0, 0, 10, @CGUID+2, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 32, 32, 0, 0, 0, 0, 10, @CGUID+3, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 32, 32, 0, 0, 0, 0, 10, @CGUID+4, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 32, 32, 0, 0, 0, 0, 10, @CGUID+5, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 32, 32, 0, 0, 0, 0, 10, @CGUID+6, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 30, 30, 0, 0, 0, 0, 10, @CGUID+0, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 30, 30, 0, 0, 0, 0, 10, @CGUID+7, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 30, 30, 0, 0, 0, 0, 10, @CGUID+8, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 30, 30, 0, 0, 0, 0, 10, @CGUID+9, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 31, 31, 0, 0, 0, 0, 10, @CGUID+10, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 2'),
(1612802, 9, 12, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 3'),
(1612802, 9, 13, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 3'),
(1612802, 9, 14, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 3'),
(1612802, 9, 15, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 3'),
(1612802, 9, 16, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 3'),
(1612802, 9, 17, 0, 0, 0, 100, 0, 14000, 14000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Say Line 3'),
(1612802, 9, 18, 0, 0, 0, 100, 0, 60000, 60000, 0, 0, 45, 29, 29, 0, 0, 0, 0, 10, @CGUID+10, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 19, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+0, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 20, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+1, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 21, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+2, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 22, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+3, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 23, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+4, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 24, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+5, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 25, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+6, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 26, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+7, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 27, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+8, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 28, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+9, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 29, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 28, 28, 0, 0, 0, 0, 10, @CGUID+10, 28332, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Generic Trigger LAB (Large AOI)'),
(1612802, 9, 30, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 34044, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Brann Bronzebeard'),
(1612802, 9, 31, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 51347, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Set Data on Brann Bronzebeard'),
(1612802, 9, 32, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rhonin - Script 3 - Despawn');



DELETE FROM `creature_text` WHERE `entry` IN(34044,16128);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
(34044, 0, 0, 'Just in time. Let''s see this thing off, then.', 12, 0, 100, 0, 0, 15826, 'Brann Bronzebeard',34084),
(16128, 0, 0, 'We received Brann''s message, and we have begun preparations.', 12, 0, 100, 1, 0, 15649, 'Rhonin',33982),
(16128, 1, 0, 'Citizens of Dalaran! Raise your eyes to the skies and observe!', 14, 0, 100, 0, 0, 15650, 'Rhonin',33983),
(16128, 2, 0, 'Today our world''s destruction has been averted in defiance of our very makers!', 14, 0, 100, 0, 0, 15651, 'Rhonin',33984),
(16128, 3, 0, 'Algalon the Observer, herald of the titans, has been defeated by our brave comrades in the depths of the titan city of Ulduar.', 14, 0, 100, 0, 0, 15652, 'Rhonin',33985),
(16128, 4, 0, 'Algalon was sent here to judge the fate of our world.', 14, 0, 100, 0, 0, 15653, 'Rhonin',33986),
(16128, 5, 0, 'He found a planet whose races had deviated from the titans'' blueprints. A planet where not everything had gone according to plan.', 14, 0, 100, 0, 0, 15654, 'Rhonin',33987),
(16128, 6, 0, 'Cold logic deemed our world not worth saving. Cold logic, however, does not account for the power of free will. It''s up to each of us to prove this is a world worth saving.', 14, 0, 100, 0, 0, 15655, 'Rhonin',33988),
(16128, 7, 0, 'That our lives... our lives are worth living.', 14, 0, 100, 0, 0, 15656, 'Rhonin',33989);

DELETE FROM `waypoints` WHERE `entry` IN(34044,16128);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(34044,1, 5799.257, 822.8445, 668.8303,'Brann Bronzebeard'),
(34044,2, 5800.257, 822.8445, 668.8303,'Brann Bronzebeard'),
(34044,3, 5800.367, 821.7542, 667.9642,'Brann Bronzebeard'),
(34044,4, 5800.662, 818.8298, 666.119,'Brann Bronzebeard'),
(34044,5, 5801.204, 813.4578, 662.2362,'Brann Bronzebeard'),
(34044,6, 5801.204, 813.4578, 662.2362,'Brann Bronzebeard'),
(34044,7, 5801.473, 813.3398, 662.5571,'Brann Bronzebeard'),
(34044,8, 5801.478, 811.0238, 662.2334,'Brann Bronzebeard'),
(34044,9, 5801.978, 807.0238, 662.2334,'Brann Bronzebeard'),
(34044,10, 5801.978, 806.2738, 662.2334,'Brann Bronzebeard'),
(34044,11, 5800.728, 802.5238, 662.2334,'Brann Bronzebeard'), -- Say 1
(34044,12, 5799.999, 799.77, 662.1868,'Brann Bronzebeard'),
(34044,13, 5798.749, 789.02, 662.1868,'Brann Bronzebeard'),
(34044,14, 5798.749, 787.77, 662.1868,'Brann Bronzebeard'),
(34044,15, 5798.499, 786.52, 662.1868,'Brann Bronzebeard'),
(34044,16, 5798.366, 786.4135, 662.1921,'Brann Bronzebeard'),
(34044,17, 5798.116, 784.4135, 662.1921,'Brann Bronzebeard'),
(34044,18, 5797.866, 783.6635, 662.6921,'Brann Bronzebeard'),
(34044,19, 5797.866, 779.4135, 662.6921,'Brann Bronzebeard'),
(34044,20, 5797.866, 775.6635, 661.9421,'Brann Bronzebeard'),
(34044,21, 5797.866, 774.6635, 661.6921,'Brann Bronzebeard'),
(34044,22, 5797.628, 774.3326, 661.3541,'Brann Bronzebeard'),
(34044,23, 5797.378, 772.5826, 661.3541,'Brann Bronzebeard'),
(34044,24, 5797.378, 772.0826, 661.3541,'Brann Bronzebeard'),
(34044,25, 5796.628, 766.8326, 661.6041,'Brann Bronzebeard'),
(34044,26, 5796.378, 761.8326, 658.3541,'Brann Bronzebeard'),
(34044,27, 5795.75, 756.938, 654.6126,'Brann Bronzebeard'),
(34044,28, 5795.75, 754.438, 652.8626,'Brann Bronzebeard'),
(34044,29, 5795.75, 745.438, 646.8626,'Brann Bronzebeard'),
(34044,30, 5795.75, 737.188, 640.8626,'Brann Bronzebeard'),
(34044,31, 5795.75, 736.188, 640.6126,'Brann Bronzebeard'),
(34044,32, 5795.629, 732.4694, 640.3873,'Brann Bronzebeard'),
(34044,33, 5795.379, 731.2194, 640.3873,'Brann Bronzebeard'),
(34044,34, 5794.879, 722.7194, 640.6373,'Brann Bronzebeard'),
(34044,35, 5794.379, 720.2194, 640.6373,'Brann Bronzebeard'),
(34044,36, 5794.141, 719.7362, 641.0156,'Brann Bronzebeard'),
(34044,37, 5794.141, 719.4862, 641.0156,'Brann Bronzebeard'),
(34044,38, 5793.391, 718.2362, 641.0156,'Brann Bronzebeard'),
(34044,39, 5792.141, 716.7362, 641.0156,'Brann Bronzebeard'),
(34044,40, 5788.391, 710.9862, 641.5156,'Brann Bronzebeard'),
(34044,41, 5784.409, 705.4751, 642.0784,'Brann Bronzebeard'),
(34044,42, 5780.409, 699.9751, 642.3284,'Brann Bronzebeard'),
(34044,43, 5778.909, 697.9751, 642.5784,'Brann Bronzebeard'),
(34044,44, 5778.659, 697.4751, 642.5784,'Brann Bronzebeard'),
(34044,45, 5773.409, 690.4751, 642.8284,'Brann Bronzebeard'),
(34044,46, 5772.659, 689.2251, 642.8284,'Brann Bronzebeard'),
(34044,47, 5772.451, 688.9385, 643.1041,'Brann Bronzebeard'),
(34044,48, 5769.951, 685.9385, 643.1041,'Brann Bronzebeard'),
(34044,49, 5767.951, 683.4385, 643.1041,'Brann Bronzebeard'),
(34044,50, 5761.951, 676.6885, 642.8541,'Brann Bronzebeard'),
(34044,51, 5758.701, 672.6885, 643.1041,'Brann Bronzebeard'),
(34044,52, 5757.701, 671.9385, 643.1041,'Brann Bronzebeard'),
(34044,53, 5756.951, 670.9385, 643.1041,'Brann Bronzebeard'),
(34044,54, 5755.701, 669.4385, 643.1041,'Brann Bronzebeard'),
(34044,55, 5754.951, 668.6885, 643.3541,'Brann Bronzebeard'),
(34044,56, 5750.951, 663.9385, 643.6041,'Brann Bronzebeard'),
(34044,57, 5750.721, 663.7521, 643.809,'Brann Bronzebeard'),
(34044,58, 5750.221, 663.2521, 643.809,'Brann Bronzebeard'),
(34044,59, 5745.221, 659.0021, 644.559,'Brann Bronzebeard'),
(34044,60, 5740.221, 654.7521, 645.559,'Brann Bronzebeard'),
(34044,61, 5740.14, 654.6359, 645.801,'Brann Bronzebeard'),
(34044,62, 5736.89, 651.8859, 646.051,'Brann Bronzebeard'),
(34044,63, 5734.89, 651.1359, 646.301,'Brann Bronzebeard'),
(34044,64, 5731.39, 649.8859, 646.801,'Brann Bronzebeard'),
(16128,1,  5797.603, 793.3063, 662.1119,'Rhonin'),
(16128,2,  5796.103, 777.5563, 662.3619,'Rhonin'),
(16128,3,  5794.603, 767.0563, 661.6119,'Rhonin'),
(16128,4,  5793.103, 753.0563, 651.8619,'Rhonin'),
(16128,5,  5790.603, 736.8063, 640.6119,'Rhonin'),
(16128,6,  5786.353, 717.5563, 641.1119,'Rhonin'),
(16128,7,  5773.603, 702.0563, 642.1119,'Rhonin'),
(16128,8,  5759.103, 683.5563, 642.6119,'Rhonin'),
(16128,9,  5746.853, 669.0563, 644.3619,'Rhonin'),
(16128,10,  5736.353, 658.8063, 645.8619,'Rhonin'),
(16128,11,  5727.353, 653.8063, 646.8619,'Rhonin');