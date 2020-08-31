DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200609200850');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200609200850');
-- Add your query below.


-- southshore
-- brewmeister says hiccup
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` = 15314;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (270502, 2705, 0, 0, 0, 100, 1, 10000, 20000, 60000, 80000, 270502, 0, 0, 'Brewmeister Bilger - Say Text OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (270502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1953, 0, 0, 0, 0, 0, 0, 0, 0, 'Brewmeister Bilger - Say Text');

-- correct position for guard
UPDATE `creature` SET `position_x` = -756.026, `position_y` = -658.905, `position_z` = 15.2827 WHERE `guid` = 16383;

-- correct position for guard
UPDATE `creature` SET `position_x` = -814.122, `position_y` = -689.843, `position_z` = 7.84335 WHERE `guid` = 16385;

-- add patrol to guard
UPDATE `creature` SET `position_x` = -891.071, `position_y` = -540.262, `position_z` = 6.86808, `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 15928;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(15928, 1, -891.071, -540.262, 6.86808, 100, 0, 0, 0),
(15928, 2, -874.494, -540.699, 7.83399, 100, 0, 0, 0),
(15928, 3, -870.078, -539.733, 8.15647, 100, 0, 0, 0),
(15928, 4, -857.136, -533.532, 9.48088, 100, 0, 0, 0),
(15928, 5, -848.029, -529.401, 10.7297, 100, 0, 0, 0),
(15928, 6, -839.734, -525.703, 11.2676, 100, 0, 0, 0),
(15928, 7, -828.533, -522.443, 12.6402, 100, 0, 0, 0),
(15928, 8, -826.198, -522.904, 12.9283, 100, 0, 0, 0),
(15928, 9, -807.977, -528.762, 15.5655, 100, 0, 0, 0),
(15928, 10, -805.925, -528.106, 15.8246, 100, 0, 0, 0),
(15928, 11, -798.267, -525.689, 16.9921, 100, 0, 0, 0),
(15928, 12, -805.925, -528.106, 15.8246, 100, 0, 0, 0),
(15928, 13, -807.977, -528.762, 15.5655, 100, 0, 0, 0),
(15928, 14, -826.198, -522.904, 12.9283, 100, 0, 0, 0),
(15928, 15, -828.533, -522.443, 12.6402, 100, 0, 0, 0),
(15928, 16, -839.734, -525.703, 11.2676, 100, 0, 0, 0),
(15928, 17, -848.029, -529.401, 10.7297, 100, 0, 0, 0),
(15928, 18, -857.136, -533.532, 9.48088, 100, 0, 0, 0),
(15928, 19, -870.078, -539.733, 8.15647, 100, 0, 0, 0),
(15928, 20, -874.494, -540.699, 7.83399, 100, 0, 0, 0);

-- correct patrol for guard
UPDATE `creature` SET `position_x` = -747.554, `position_y` = -684.579, `position_z` = 11.8954 WHERE `guid` = 16387;
DELETE FROM `creature_movement` WHERE `id` = 16387;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(16387, 1, -747.554, -684.579, 11.8954, 100, 0, 0, 0),
(16387, 2, -759.409, -686.896, 11.4542, 100, 0, 0, 0),
(16387, 3, -768.479, -688.378, 9.96307, 100, 0, 0, 0),
(16387, 4, -782.523, -685.884, 10.2641, 100, 0, 0, 0),
(16387, 5, -796.876, -687.57, 8.71147, 100, 0, 0, 0),
(16387, 6, -814.985, -689.771, 7.78994, 100, 0, 0, 0),
(16387, 7, -824.762, -690.335, 8.51905, 100, 0, 0, 0),
(16387, 8, -840.602, -685.264, 8.42936, 100, 0, 0, 0),
(16387, 9, -824.762, -690.335, 8.51905, 100, 0, 0, 0),
(16387, 10, -814.985, -689.771, 7.78994, 100, 0, 0, 0),
(16387, 11, -796.876, -687.57, 8.71147, 100, 0, 0, 0),
(16387, 12, -782.523, -685.884, 10.2641, 100, 0, 0, 0),
(16387, 13, -768.479, -688.378, 9.96307, 100, 0, 0, 0),
(16387, 14, -759.409, -686.896, 11.4542, 100, 0, 0, 0);

-- guards should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` IN (15667, 15674);

-- add patrol to guard
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 15323;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(15323, 1, -668.212, -426.855, 66.7264, 100, 0, 0, 0),
(15323, 2, -669.422, -422.725, 66.7264, 100, 0, 0, 0),
(15323, 3, -673.001, -419.863, 66.7264, 100, 0, 0, 0),
(15323, 4, -679.104, -420.995, 66.7264, 100, 0, 0, 0),
(15323, 5, -682.164, -424.861, 66.7264, 100, 0, 0, 0),
(15323, 6, -681.714, -430.579, 66.7264, 100, 0, 0, 0),
(15323, 7, -677.304, -433.94, 66.7264, 100, 0, 0, 0),
(15323, 8, -670.475, -432.6, 66.7264, 100, 0, 0, 0);

-- correct patrol for farmer kent
UPDATE `creature` SET `position_x` = -841.737, `position_y` = -645.461, `position_z` = 16.2098 WHERE `guid` = 15976;
DELETE FROM `creature_movement_template` WHERE `entry` = 2436;
DELETE FROM `creature_movement` WHERE `id` = 15976;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2436, 1, -841.737, -645.461, 16.2098, 100, 35000, 3, 0),
(2436, 2, -831.83, -635.259, 14.3345, 100, 0, 0, 0),
(2436, 3, -819.674, -624.057, 13.1573, 100, 0, 0, 0),
(2436, 4, -812.915, -614.384, 13.8122, 100, 0, 0, 0),
(2436, 5, -811.959, -605.068, 14.5416, 100, 0, 0, 0),
(2436, 6, -815.261, -598.733, 14.9589, 100, 0, 0, 0),
(2436, 7, -819.857, -592.132, 15.1498, 100, 0, 0, 0),
(2436, 8, -819.461, -588.67, 15.1441, 100, 0, 0, 0),
(2436, 9, -814.409, -586.194, 15.1497, 100, 0, 0, 0),
(2436, 10, -803.176, -583.248, 15.1777, 100, 0, 0, 0),
(2436, 11, -799.71, -577.081, 15.2266, 100, 0, 0, 0),
(2436, 12, -801.756, -564.267, 15.3296, 100, 0, 0, 0),
(2436, 13, -805.514, -552.313, 15.3068, 100, 0, 0, 0),
(2436, 14, -810.399, -549.44, 15.5827, 100, 0, 0, 0),
(2436, 15, -818.993, -547.864, 15.1642, 100, 0, 0, 0),
(2436, 16, -831.07, -538.38, 13.9994, 100, 0, 0, 0),
(2436, 17, -837.066, -528.953, 11.9059, 100, 0, 0, 0),
(2436, 18, -835.905, -525.708, 11.6752, 100, 0, 0, 0),
(2436, 19, -829.477, -524.675, 12.6303, 100, 0, 0, 0),
(2436, 20, -819.564, -525.328, 13.9919, 100, 0, 0, 0),
(2436, 21, -806.105, -533.213, 15.5612, 100, 0, 0, 0),
(2436, 22, -790.476, -541.694, 17.2537, 100, 0, 0, 0),
(2436, 23, -778.512, -546.761, 18.1067, 100, 0, 0, 0),
(2436, 24, -764.971, -547.414, 17.9646, 100, 0, 0, 0),
(2436, 25, -759.796, -542.416, 18.2815, 100, 0, 0, 0),
(2436, 26, -760.603, -532.599, 20.4156, 100, 0, 0, 0),
(2436, 27, -762.946, -525.528, 21.6672, 100, 35000, 3, 0),
(2436, 28, -760.805, -531.455, 20.6622, 100, 0, 0, 0),
(2436, 29, -759.584, -541.195, 18.4437, 100, 0, 0, 0),
(2436, 30, -765.33, -545.01, 17.8981, 100, 0, 0, 0),
(2436, 31, -777.375, -542.039, 18.1251, 100, 0, 0, 0),
(2436, 32, -788.168, -537.554, 17.6941, 100, 0, 0, 0),
(2436, 33, -803.068, -528.471, 16.1562, 100, 0, 0, 0),
(2436, 34, -818.663, -520.831, 13.824, 100, 0, 0, 0),
(2436, 35, -825.753, -520.709, 12.8811, 100, 0, 0, 0),
(2436, 36, -830.401, -514.592, 13.0078, 100, 0, 0, 0),
(2436, 37, -833.587, -509.184, 14.7179, 100, 0, 0, 0),
(2436, 38, -836.202, -504.066, 15.4178, 100, 35000, 3, 0),
(2436, 39, -830.991, -513.241, 13.4235, 100, 0, 0, 0),
(2436, 40, -832.486, -520.262, 12.0842, 100, 0, 0, 0),
(2436, 41, -838.155, -522.563, 11.4391, 100, 0, 0, 0),
(2436, 42, -854.153, -530.878, 10.0486, 100, 0, 0, 0),
(2436, 43, -873.345, -539.598, 7.90118, 100, 0, 0, 0),
(2436, 44, -891.472, -539.817, 6.82986, 100, 0, 0, 0),
(2436, 45, -914.011, -537.511, 6.87867, 100, 35000, 3, 0),
(2436, 46, -892.276, -539.734, 6.79514, 100, 0, 0, 0),
(2436, 47, -874.356, -539.821, 7.88966, 100, 0, 0, 0),
(2436, 48, -855.265, -531.629, 9.87936, 100, 0, 0, 0),
(2436, 49, -843.386, -526.966, 11.15, 100, 0, 0, 0),
(2436, 50, -839.181, -530.965, 11.9806, 100, 0, 0, 0),
(2436, 51, -832.048, -539.427, 14.0818, 100, 0, 0, 0),
(2436, 52, -820.08, -547.083, 15.1296, 100, 0, 0, 0),
(2436, 53, -808.852, -549.713, 15.5885, 100, 0, 0, 0),
(2436, 54, -803.856, -564.587, 15.2886, 100, 0, 0, 0),
(2436, 55, -801.381, -576.707, 15.1806, 100, 35000, 3, 0),
(2436, 56, -805.453, -581.472, 15.152, 100, 0, 0, 0),
(2436, 57, -814.714, -584.228, 15.152, 100, 0, 0, 0),
(2436, 58, -818.322, -587.618, 15.146, 100, 0, 0, 0),
(2436, 59, -815.917, -596.718, 15.0605, 100, 0, 0, 0),
(2436, 60, -812.481, -603.175, 14.6819, 100, 0, 0, 0),
(2436, 61, -812.444, -612.786, 13.9281, 100, 0, 0, 0),
(2436, 62, -818.662, -623.293, 13.1924, 100, 0, 0, 0),
(2436, 63, -830.559, -634.047, 14.1155, 100, 0, 0, 0);

-- tarren mill
-- guards should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 9 WHERE `guid` IN (15558, 15538, 15535, 15355, 15533, 15354, 15353, 15307, 15306, 15303, 15515, 15282, 15541);

-- guards should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` IN (15521, 15518, 15514, 15531);

-- correct pathing for jason lemieux
DELETE FROM `creature_movement` WHERE `id` = 15530;
UPDATE `creature` SET `position_x` = -16.677, `position_y` = -869.531, `position_z` = 59.3036 WHERE `guid` = 15530;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(3544, 1, -16.677, -869.531, 59.3036, 100, 0, 0, 0),
(3544, 2, -24.2488, -873.823, 58.0435, 100, 0, 0, 0),
(3544, 3, -38.4551, -877.71, 55.9891, 100, 0, 0, 0),
(3544, 4, -47.3143, -879.587, 55.6765, 100, 0, 0, 0),
(3544, 5, -56.1168, -881.308, 57.1123, 100, 0, 0, 0),
(3544, 6, -64.6819, -884.179, 57.3218, 100, 0, 0, 0),
(3544, 7, -73.2659, -886.636, 55.7801, 100, 0, 0, 0),
(3544, 8, -82.131, -888.546, 55.138, 100, 0, 0, 0),
(3544, 9, -85.0312, -889.372, 55.1381, 100, 0, 0, 0),
(3544, 10, -95.4084, -895.458, 55.1788, 100, 0, 0, 0),
(3544, 11, -96.8764, -897.811, 55.2525, 100, 0, 0, 0),
(3544, 12, -96.7181, -903.815, 55.3162, 100, 0, 0, 0),
(3544, 13, -96.4403, -905.784, 55.3049, 100, 0, 0, 0),
(3544, 14, -90.8491, -913.94, 55.1381, 100, 0, 0, 0),
(3544, 15, -89.5685, -915.429, 55.1382, 100, 0, 0, 0),
(3544, 16, -83.3932, -915.506, 55.1382, 100, 0, 0, 0),
(3544, 17, -77.4453, -915.131, 55.1496, 100, 0, 0, 0),
(3544, 18, -62.7434, -918.31, 55.8427, 100, 0, 0, 0),
(3544, 19, -52.3426, -924.423, 55.3438, 100, 0, 0, 0),
(3544, 20, -43.8006, -925.991, 54.6058, 100, 0, 0, 0),
(3544, 21, -35.5921, -918.552, 54.8637, 100, 0, 0, 0),
(3544, 22, -31.4669, -907.361, 55.6615, 100, 0, 0, 0),
(3544, 23, -28.9324, -901.922, 55.9294, 100, 0, 0, 0),
(3544, 24, -27.7982, -899.209, 55.9834, 100, 0, 0, 0),
(3544, 25, -34.2217, -886.604, 56.0895, 100, 0, 0, 0),
(3544, 26, -43.7807, -874.855, 55.6597, 100, 0, 0, 0),
(3544, 27, -50.0475, -864.494, 55.6615, 100, 0, 0, 0),
(3544, 28, -52.4975, -849.769, 56.3156, 100, 0, 0, 0),
(3544, 29, -52.201, -843.742, 56.4193, 100, 0, 0, 0),
(3544, 30, -48.3227, -832.333, 56.8317, 100, 0, 0, 0),
(3544, 31, -42.6116, -825.456, 57.1988, 100, 0, 0, 0),
(3544, 32, -37.7795, -821.797, 57.4075, 100, 0, 0, 0),
(3544, 33, -29.9667, -822.188, 57.4697, 100, 0, 0, 0),
(3544, 34, -21.9892, -826.54, 57.6968, 100, 0, 0, 0),
(3544, 35, -14.888, -832.099, 58.5827, 100, 0, 0, 0),
(3544, 36, -9.01751, -838.662, 60.0852, 100, 0, 0, 0),
(3544, 37, -7.05282, -847.149, 60.0365, 100, 0, 0, 0),
(3544, 38, -10.2388, -858.247, 59.8757, 100, 0, 0, 0);

-- hans zandin add missing text
DELETE FROM `creature_ai_scripts` WHERE `id` = 239601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (239601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 614, 615, 616, 0, 0, 0, 0, 0, 0, 'Hans Zandin - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
