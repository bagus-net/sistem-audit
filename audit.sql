/*
 Navicat Premium Data Transfer

 Source Server         : bagusdb
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : audit

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 08/09/2025 09:18:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit_answers
-- ----------------------------
DROP TABLE IF EXISTS `audit_answers`;
CREATE TABLE `audit_answers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED NOT NULL,
  `klausul_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `jawaban` tinyint(1) NOT NULL COMMENT 'Y=1, N=0',
  `bukti_hasil_kerja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `audit_answers_project_id_foreign`(`project_id` ASC) USING BTREE,
  INDEX `audit_answers_klausul_id_foreign`(`klausul_id` ASC) USING BTREE,
  INDEX `audit_answers_level_id_foreign`(`level_id` ASC) USING BTREE,
  INDEX `audit_answers_question_id_foreign`(`question_id` ASC) USING BTREE,
  CONSTRAINT `audit_answers_klausul_id_foreign` FOREIGN KEY (`klausul_id`) REFERENCES `klausuls` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `audit_answers_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `audit_answers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `audit_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4779 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of audit_answers
-- ----------------------------
INSERT INTO `audit_answers` VALUES (4653, 71, 8, 22, 598, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4654, 71, 8, 22, 599, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4655, 71, 8, 22, 600, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4656, 71, 8, 22, 601, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4657, 71, 8, 22, 602, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4658, 71, 8, 22, 603, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4659, 71, 8, 22, 604, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4660, 71, 8, 22, 605, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4661, 71, 8, 22, 606, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4662, 71, 8, 22, 607, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4663, 71, 8, 22, 608, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4664, 71, 8, 22, 609, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4665, 71, 8, 22, 610, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4666, 71, 8, 22, 611, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4667, 71, 8, 22, 612, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4668, 71, 8, 22, 613, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4669, 71, 8, 22, 614, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4670, 71, 8, 22, 615, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4671, 71, 8, 22, 616, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4672, 71, 8, 22, 617, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4673, 71, 8, 22, 618, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4674, 71, 8, 22, 619, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4675, 71, 8, 22, 620, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4676, 71, 8, 22, 621, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4677, 71, 8, 22, 622, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4678, 71, 8, 22, 623, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4679, 71, 8, 22, 624, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4680, 71, 8, 22, 625, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4681, 71, 8, 22, 626, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4682, 71, 8, 22, 627, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4683, 71, 8, 22, 628, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4684, 71, 8, 22, 629, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4685, 71, 8, 22, 630, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4686, 71, 8, 22, 631, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4687, 71, 8, 22, 632, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4688, 71, 8, 22, 633, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4689, 71, 8, 22, 634, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4690, 71, 8, 22, 635, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4691, 71, 8, 22, 636, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4692, 71, 8, 22, 637, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4693, 71, 8, 22, 638, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4694, 71, 8, 22, 639, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4695, 71, 8, 22, 640, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4696, 71, 8, 22, 641, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4697, 71, 8, 22, 642, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4698, 71, 8, 22, 643, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4699, 71, 8, 22, 644, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4700, 71, 8, 22, 645, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4701, 71, 8, 22, 646, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4702, 71, 8, 22, 647, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4703, 71, 8, 22, 648, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4704, 71, 8, 22, 649, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4705, 71, 8, 22, 650, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4706, 71, 8, 22, 651, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4707, 71, 8, 22, 652, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4708, 71, 8, 22, 653, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4709, 71, 8, 22, 654, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4710, 71, 8, 22, 655, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4711, 71, 8, 22, 656, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4712, 71, 8, 22, 657, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4713, 71, 8, 22, 658, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4714, 71, 8, 22, 659, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4715, 71, 8, 22, 660, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4716, 71, 8, 22, 661, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4717, 71, 8, 22, 662, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4718, 71, 8, 22, 663, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4719, 71, 8, 22, 664, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4720, 71, 8, 22, 665, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4721, 71, 8, 22, 666, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4722, 71, 8, 22, 667, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4723, 71, 8, 22, 668, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4724, 71, 8, 22, 669, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4725, 71, 8, 22, 670, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4726, 71, 8, 22, 671, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4727, 71, 8, 22, 672, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4728, 71, 8, 22, 673, 0, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4729, 71, 8, 22, 674, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4730, 71, 8, 22, 675, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4731, 71, 8, 22, 676, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4732, 71, 8, 22, 677, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4733, 71, 8, 22, 678, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4734, 71, 8, 22, 679, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4735, 71, 8, 22, 680, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4736, 71, 8, 22, 681, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4737, 71, 8, 22, 682, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4738, 71, 8, 22, 683, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4739, 71, 8, 22, 684, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4740, 71, 8, 22, 685, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4741, 71, 8, 22, 686, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4742, 71, 8, 22, 687, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4743, 71, 8, 22, 688, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4744, 71, 8, 22, 689, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4745, 71, 8, 22, 690, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4746, 71, 8, 22, 691, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4747, 71, 8, 22, 692, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4748, 71, 8, 22, 693, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4749, 71, 8, 22, 694, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4750, 71, 8, 22, 695, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4751, 71, 8, 22, 696, 1, NULL, '2025-09-04 10:33:08', '2025-09-04 10:33:08');
INSERT INTO `audit_answers` VALUES (4752, 71, 9, 26, 875, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4753, 71, 9, 26, 876, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4754, 71, 9, 26, 877, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4755, 71, 9, 26, 878, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4756, 71, 9, 26, 879, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4757, 71, 9, 26, 880, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4758, 71, 9, 26, 881, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4759, 71, 9, 26, 882, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4760, 71, 9, 26, 883, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4761, 71, 9, 26, 884, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4762, 71, 9, 26, 885, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4763, 71, 9, 26, 886, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4764, 71, 9, 26, 887, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4765, 71, 9, 26, 888, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4766, 71, 9, 26, 889, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4767, 71, 9, 26, 890, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4768, 71, 9, 26, 891, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4769, 71, 9, 26, 892, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4770, 71, 9, 26, 893, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4771, 71, 9, 26, 894, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4772, 71, 9, 26, 895, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4773, 71, 9, 26, 896, 0, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4774, 71, 9, 26, 897, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4775, 71, 9, 26, 898, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4776, 71, 9, 26, 899, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4777, 71, 9, 26, 900, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');
INSERT INTO `audit_answers` VALUES (4778, 71, 9, 26, 901, 1, NULL, '2025-09-04 10:33:36', '2025-09-04 10:33:36');

-- ----------------------------
-- Table structure for domains
-- ----------------------------
DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_domain` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of domains
-- ----------------------------
INSERT INTO `domains` VALUES (1, 'EDM', 'Evaluate, Direct and Monitor', NULL, '2025-06-11 03:55:06', '2025-06-11 03:55:06');
INSERT INTO `domains` VALUES (2, 'APO', 'Align, Plan and Organize', NULL, '2025-06-11 03:55:06', '2025-06-11 03:55:06');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for jawaban_audits
-- ----------------------------
DROP TABLE IF EXISTS `jawaban_audits`;
CREATE TABLE `jawaban_audits`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `proses_ti_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `jawaban` enum('Sudah','Belum','Tidak Berlaku') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `bukti_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tanggal_audit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jawaban_audits_proses_ti_id_foreign`(`proses_ti_id` ASC) USING BTREE,
  INDEX `jawaban_audits_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `jawaban_audits_proses_ti_id_foreign` FOREIGN KEY (`proses_ti_id`) REFERENCES `proses_tis` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jawaban_audits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jawaban_audits
-- ----------------------------

-- ----------------------------
-- Table structure for klausul_project
-- ----------------------------
DROP TABLE IF EXISTS `klausul_project`;
CREATE TABLE `klausul_project`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED NOT NULL,
  `klausul_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `klausul_project_project_id_klausul_id_unique`(`project_id` ASC, `klausul_id` ASC) USING BTREE,
  INDEX `klausul_project_klausul_id_foreign`(`klausul_id` ASC) USING BTREE,
  CONSTRAINT `klausul_project_klausul_id_foreign` FOREIGN KEY (`klausul_id`) REFERENCES `klausuls` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `klausul_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of klausul_project
-- ----------------------------
INSERT INTO `klausul_project` VALUES (30, 71, 8, NULL, NULL);
INSERT INTO `klausul_project` VALUES (31, 71, 9, NULL, NULL);

-- ----------------------------
-- Table structure for klausuls
-- ----------------------------
DROP TABLE IF EXISTS `klausuls`;
CREATE TABLE `klausuls`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_klausul` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_klausul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of klausuls
-- ----------------------------
INSERT INTO `klausuls` VALUES (4, 'K.4', 'Klausul 4', 'Konteks Organisasi', '2025-07-14 10:16:19', '2025-07-14 10:16:19');
INSERT INTO `klausuls` VALUES (5, 'K.5', 'Klausul 5', 'Kepemimpinan', '2025-07-14 14:47:52', '2025-07-14 14:47:52');
INSERT INTO `klausuls` VALUES (6, 'K.6', 'Klausul 6', 'Perencanaan', '2025-07-14 15:13:02', '2025-07-14 15:13:02');
INSERT INTO `klausuls` VALUES (7, 'K.7', 'Klausul 7', 'Dukungan', '2025-07-14 15:13:22', '2025-07-14 15:13:22');
INSERT INTO `klausuls` VALUES (8, 'K.8', 'Klausul 8', 'Operasi', '2025-07-14 15:13:47', '2025-07-14 15:13:47');
INSERT INTO `klausuls` VALUES (9, 'K.9', 'Klausul 9', 'Evaluasi Kinerja', '2025-07-14 15:14:09', '2025-07-14 15:14:09');
INSERT INTO `klausuls` VALUES (10, 'K.10', 'Klausul 10', 'Peningkatan', '2025-07-14 15:14:48', '2025-07-14 15:14:48');

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `klausul_id` bigint UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sub_proses` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `levels_klausul_id_foreign`(`klausul_id` ASC) USING BTREE,
  CONSTRAINT `levels_klausul_id_foreign` FOREIGN KEY (`klausul_id`) REFERENCES `klausuls` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES (4, 4, 2, '2025-07-14 14:31:49', '2025-07-14 14:31:49', '4.2 Memahami kebutuhan dan harapan dari pihak-pihak yang berkepentingan\r\n4.3 Menentukan ruang lingkup sistem manajemen mutu\r\n4.4 Sistem manajemen mutu dan proses-prosesnya\r\n4.4.2 Informasi terdokumentasi\r\n4.4.1 Menetapkan proses dan interaksinya');
INSERT INTO `levels` VALUES (6, 4, 3, '2025-07-14 15:15:41', '2025-07-14 15:15:41', '4.1 Memahami organisasi dan konteksnya\r\n4.2 Memahami kebutuhan dan harapan dari pihak-pihak yang berkepentingan\r\n4.3 Menentukan ruang lingkup sistem manajemen mutu\r\n4.4 Sistem manajemen mutu dan proses-prosesnya\r\n4.4.1 Menetapkan proses dan interaksinya\r\n4.4.2 Informasi terdokumentasi');
INSERT INTO `levels` VALUES (7, 4, 4, '2025-07-14 15:16:08', '2025-07-14 15:16:08', '4.1 Memahami organisasi dan konteksnya\r\n4.2 Memahami kebutuhan dan harapan dari pihak-pihak yang berkepentingan\r\n4.4 Sistem manajemen mutu dan proses-prosesnya\r\n4.4.1 Menetapkan proses dan interaksinya');
INSERT INTO `levels` VALUES (8, 4, 5, '2025-07-14 15:16:16', '2025-07-14 15:16:16', '4.1 Memahami organisasi dan konteksnya\r\n4.3 Menentukan ruang lingkup sistem manajemen mutu\r\n4.4 Sistem manajemen mutu dan proses-prosesnya');
INSERT INTO `levels` VALUES (10, 5, 2, '2025-07-16 12:23:00', '2025-07-16 12:23:00', '5.1.1 Umum\r\n5.2.2 Mengkomunikasikan Kebijakan Mutu\r\n5.3 Aturan Organisasi, Tanggungjawab dan Wewenang');
INSERT INTO `levels` VALUES (11, 5, 3, '2025-07-16 12:23:22', '2025-07-16 12:23:22', '5.1.1 Umum \r\n5.1.2 Fokus Pelanggan\r\n5.3 Aturan Organisasi, Tanggungjawab  dan Wewenang');
INSERT INTO `levels` VALUES (12, 5, 4, '2025-07-16 12:23:36', '2025-07-16 12:23:36', '5.1.1 Umum \r\n5.1.2 Fokus Pelanggan');
INSERT INTO `levels` VALUES (13, 5, 5, '2025-07-16 12:23:47', '2025-07-16 12:23:47', '5.1.1 Umum');
INSERT INTO `levels` VALUES (14, 6, 2, '2025-07-16 12:34:26', '2025-07-16 12:34:26', '6.1.1 Ketika merencanakan sistem manajemen mutu, organisasi harus mempertimbangkan isu-isu dimaksud dalam 4.1 dan persyaratan sebagaimana dimaksud dalam 4.2 dan menentukan risiko dan Peluang yang perlu ditujukan kepada:\r\n6.1.2 Organisasi harus merencanakan:  tindakan untuk menangani risiko dan peluang\r\n6.3 Perencanaan perubahan');
INSERT INTO `levels` VALUES (15, 6, 3, '2025-07-16 12:34:44', '2025-07-16 12:34:44', '6.1.1 Ketika merencanakan sistem manajemen mutu, organisasi harus mempertimbangkan isu-isu dimaksud dalam 4.1 dan persyaratan sebagaimana dimaksud dalam 4.2 dan menentukan risiko dan Peluang yang perlu ditujukan kepada:\r\n6.2.2 Ketika merencanakan bagaimana mencapai sasaran mutu, organisasi harus menetapkan\r\n6.2.1 Organisasi harus menetapkan sasaran mutu pada fungsi, tingkat dan proses-proses yang dibutuhkan untuk sistem manajemen mutu.\r\n6.2.2 Ketika merencanakan bagaimana mencapai sasaran mutu, organisasi harus menetapkan\r\n6.3 Perencanaan perubahan');
INSERT INTO `levels` VALUES (16, 6, 4, '2025-07-16 12:34:53', '2025-07-16 12:34:53', '6.1.1 Ketika merencanakan sistem manajemen mutu, organisasi harus mempertimbangkan isu-isu dimaksud dalam 4.1 dan persyaratan sebagaimana dimaksud dalam 4.2 dan menentukan risiko dan Peluang yang perlu ditujukan kepada:\r\n6.2.2 Ketika merencanakan bagaimana mencapai sasaran mutu, organisasi harus menetapkan\r\n6.2.1 Organisasi harus menetapkan sasaran mutu pada fungsi, tingkat dan proses-proses yang dibutuhkan untuk sistem manajemen mutu.\r\n6.1.2 Organisasi harus merencanakan:  tindakan untuk menangani risiko dan peluang\r\n6.3 Perencanaan perubahan');
INSERT INTO `levels` VALUES (17, 6, 5, '2025-07-16 12:35:08', '2025-07-16 12:35:08', '6.2.1 Organisasi harus menetapkan sasaran mutu pada fungsi, tingkat dan proses-proses yang dibutuhkan untuk sistem manajemen mutu.\r\n6.1.2 Organisasi harus merencanakan:  tindakan untuk menangani risiko dan peluang\r\n6.1.1 Ketika merencanakan sistem manajemen mutu, organisasi harus mempertimbangkan isu-isu dimaksud dalam 4.1 dan persyaratan sebagaimana dimaksud dalam 4.2 dan menentukan risiko dan Peluang yang perlu ditujukan kepada:');
INSERT INTO `levels` VALUES (18, 7, 2, '2025-07-28 15:26:02', '2025-07-28 15:26:02', '7.1.1 Umum (Organisasi harus menetapkan dan menyediakan\r\n sumber daya yang dibutuhkan untuk menetapkan, melaksanakan, memelihara dan memperbaiki terus menerus dari sistem manajemen mutu)\r\n7.3 Kesadaran\r\n7.1.2 Orang\r\n7.1.3 Infrastruktur\r\n7.2 Kompetensi\r\n7.1.6 Pengetahuan Organisasi\r\n7.1.5.1 Umum (Organisasi harus menetapkan dan menyediakan sumber daya yang diperlukan)\r\n7.5.3.2 Kegiatan Kontrol');
INSERT INTO `levels` VALUES (19, 7, 3, '2025-07-29 03:36:45', '2025-08-03 12:15:15', '7.1.1 Umum (Organisasi harus menetapkan dan menyediakan\r\n sumber daya yang dibutuhkan untuk menetapkan, melaksanakan, memelihara dan memperbaiki terus menerus dari sistem manajemen mutu)\r\n7.3 Kesadaran\r\n7.1.2 Orang\r\n7.1.3 Infrastruktur\r\n7.2 Kompetensi\r\n7.1.6 Pengetahuan Organisasi\r\n7.1.5.1 Umum (Organisasi harus menetapkan dan menyediakan sumber daya yang diperlukan)\r\n7.5.3.2 Kegiatan Kontrol');
INSERT INTO `levels` VALUES (20, 7, 4, '2025-08-03 12:15:38', '2025-08-03 12:15:38', '7.1.1 Umum (Organisasi harus menetapkan dan menyediakan\r\n sumber daya yang dibutuhkan untuk menetapkan, melaksanakan, memelihara dan memperbaiki terus menerus dari sistem manajemen mutu)\"\r\n7.1.2 Orang\r\n7.5.2 Membuat/Update\r\n7.5.3.1 Pengendalian Info\r\n7.5.3.2 Kegiatan Kontrol\r\n7.1.5.1 Umum (Organisasi harus menetapkan dan menyediakan sumber daya yang diperlukan)\r\n7.3 Kesadaran\r\n7.1.6 Pengetahuan Organisasi\r\n7.1.3 Infrastruktur\r\n7.1.4 Lingkungan Proses\r\n7.1.5.2 Ketelusuran');
INSERT INTO `levels` VALUES (21, 7, 5, '2025-08-03 12:15:51', '2025-08-03 12:15:51', '7.1.1 Umum (Organisasi harus menetapkan dan menyediakan\r\n sumber daya yang dibutuhkan untuk menetapkan, melaksanakan, memelihara dan memperbaiki terus menerus dari sistem manajemen mutu)\"\r\n7.1.5.2 Ketelusuran\r\n7.3 Kesadaran\r\n7.5.3.1 Pengendalian Info\r\n7.5.3.2 Kegiatan Kontrol');
INSERT INTO `levels` VALUES (22, 8, 2, '2025-08-03 12:35:21', '2025-08-03 12:35:21', '8.1 Perencanaan dan pengendalian operasional\r\n8:2 Persyaratan untuk produk dan layanan\r\n8.2.2 Penentuan persyaratan untuk produk dan layanan\r\n8.3.1 Umum\r\n8.3.5 Output desain dan pengembangan\r\n8.2.3.1 Organisasi harus memastikan bahwa memiliki kemampuan untuk memenuhi persyaratan untuk produk dan layanan yang akan ditawarkan kepada pelanggan\r\n8.3 Desain dan pengembangan produk dan layanan\r\n8.2.3.2 Organisasi harus menyimpan informasi terdokumentasi, sebagaimana berlaku\r\n8.5 Produksi dan penyediaan layanan\r\n8.5.1 Pengendalian produksi dan penyediaan layanan\r\n8.5.4 Perlindungan\r\n8.5.5 Kegiatan pasca pengiriman');
INSERT INTO `levels` VALUES (23, 8, 3, '2025-08-03 12:35:46', '2025-08-03 12:35:46', '8.1 Perencanaan dan pengendalian operasiona\r\n8:2 Persyaratan untuk produk dan layanan\r\n8.2.1 Komunikasi pelanggan\r\n8.2.2 Penentuan persyaratan untuk produk dan layanan\r\n8.2.3.2 Organisasi harus menyimpan informasi terdokumentasi, sebagaimana berlaku\r\n8.2.4 Perubahan persyaratan untuk produk dan layanan\r\n8.3 Desain dan pengembangan produk dan layanan\r\n8.3.5 Output desain dan pengembangan\r\n8.3.6 Perubahan desain dan pengembangan\r\n8.4 Pengendalian produk dan layanan eksternal yang disediakan');
INSERT INTO `levels` VALUES (24, 8, 4, '2025-08-03 12:36:13', '2025-08-03 12:36:13', '8.1 Perencanaan dan pengendalian operasional\r\n8:2 Persyaratan untuk produk dan layanan\r\n8.2.1 Komunikasi pelanggan\r\n8.2.3 Tinjauan persyaratan yang berkaitan dengan produk dan layanan\r\n8.2.3.2 Organisasi harus menyimpan informasi terdokumentasi, sebagaimana berlaku\r\n8.2.4 Perubahan persyaratan untuk produk dan layanan\r\n8.3.5 Output desain dan pengembangan\r\n8.3.6 Perubahan desain dan pengembangan\r\n8.4 Pengendalian produk dan layanan eksternal yang disediakan\r\n8.4.2 Jenis dan tingkat pengendalian\r\n8.4.3 Informasi untuk penyedia eksternal\r\n8.5.1 Pengendalian produksi dan penyediaan layanan');
INSERT INTO `levels` VALUES (25, 8, 5, '2025-08-03 12:36:27', '2025-08-03 12:36:27', '8.1 Perencanaan dan pengendalian operasional\r\n8.3.5 Output desain dan pengembangan\r\n8.3.6 Perubahan desain dan pengembangan\r\n8.4 Pengendalian produk dan layanan eksternal yang disediakan\r\n8.5.6 Kendali atas perubahan\r\n8.6 Pelepasan atas produk dan layanan\r\n8.7 Kendali atas output yang tidak sesuai');
INSERT INTO `levels` VALUES (26, 9, 2, '2025-08-03 12:59:33', '2025-08-03 12:59:33', '9.3.1 Umum (Manajemen puncak harus meninjau sistem \r\nmanajemen mutu organisasi, pada selang \r\nwaktu terencana)\r\n9.3.2 Input tinjauan manajemen\r\n9.3.3 Output tinjauan manajemen');
INSERT INTO `levels` VALUES (27, 9, 3, '2025-08-03 12:59:49', '2025-08-03 12:59:49', '9.3.1 Umum (Manajemen puncak harus meninjau sistem \r\nmanajemen mutu organisasi, pada selang \r\nwaktu terencana)\r\n9.3.2 Input tinjauan manajemen\r\n9.3.3 Output tinjauan manajemen');
INSERT INTO `levels` VALUES (28, 9, 4, '2025-08-03 13:00:01', '2025-08-03 13:00:01', '9.3.1 Umum (Manajemen puncak harus meninjau sistem \r\nmanajemen mutu organisasi, pada selang \r\nwaktu terencana)\r\n9.3.2 Input tinjauan manajemen\r\n9.3.3 Output tinjauan manajemen');
INSERT INTO `levels` VALUES (29, 9, 5, '2025-08-03 13:00:14', '2025-08-03 13:00:14', '9.3.2 Input tinjauan manajemen\r\n9.3.3 Output tinjauan manajemen');
INSERT INTO `levels` VALUES (30, 10, 2, '2025-08-03 13:06:05', '2025-08-03 13:06:05', '10.2.1 Ketidaksesuaian\r\n10.2.2 Informasi terdokumentasi\r\n10.3 Peningkatan terus-menerus');
INSERT INTO `levels` VALUES (31, 10, 3, '2025-08-03 13:06:19', '2025-08-03 13:06:19', '10.1 Umum\r\n10.2.1 Ketidaksesuaian\r\n10.2.2 Informasi terdokumentasi\r\n10.3 Peningkatan terus-menerus');
INSERT INTO `levels` VALUES (32, 10, 4, '2025-08-03 13:06:39', '2025-08-03 13:06:39', '10.2.1 Ketidaksesuaian\r\n10.2.2 Informasi terdokumentasi\r\n10.3 Peningkatan terus-menerus');
INSERT INTO `levels` VALUES (33, 10, 5, '2025-08-03 13:06:51', '2025-08-03 13:06:51', '10.2.1 Ketidaksesuaian\r\n10.2.2 Informasi terdokumentasi');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_06_10_041552_create_domains_table', 1);
INSERT INTO `migrations` VALUES (6, '2025_06_10_041657_create_klausuls_table', 1);
INSERT INTO `migrations` VALUES (7, '2025_06_10_041728_create_proses_tis_table', 1);
INSERT INTO `migrations` VALUES (8, '2025_06_10_041901_create_jawaban_audits_table', 1);
INSERT INTO `migrations` VALUES (9, '2025_06_11_071254_create_projects_table', 2);
INSERT INTO `migrations` VALUES (10, '2025_07_12_000002_create_levels_table', 3);
INSERT INTO `migrations` VALUES (11, '2025_07_12_000003_create_questions_table', 3);
INSERT INTO `migrations` VALUES (12, '2025_07_12_000004_create_projects_table', 4);
INSERT INTO `migrations` VALUES (13, '2025_07_12_000005_create_audit_answers_table', 4);
INSERT INTO `migrations` VALUES (14, '2025_08_27_000001_create_klausul_project_table', 5);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `klausul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (71, 'Pris', 'admin', '2025-09-04 10:31:57', '2025-09-04 10:31:57', NULL);

-- ----------------------------
-- Table structure for proses_tis
-- ----------------------------
DROP TABLE IF EXISTS `proses_tis`;
CREATE TABLE `proses_tis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `domain_id` bigint UNSIGNED NULL DEFAULT NULL,
  `klausul_id` bigint UNSIGNED NULL DEFAULT NULL,
  `kode_proses` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_proses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pertanyaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referensi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `proses_tis_klausul_id_foreign`(`klausul_id` ASC) USING BTREE,
  INDEX `proses_tis_domain_id_foreign`(`domain_id` ASC) USING BTREE,
  CONSTRAINT `proses_tis_domain_id_foreign` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `proses_tis_klausul_id_foreign` FOREIGN KEY (`klausul_id`) REFERENCES `klausuls` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proses_tis
-- ----------------------------

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `level_id` bigint UNSIGNED NOT NULL,
  `pertanyaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questions_level_id_foreign`(`level_id` ASC) USING BTREE,
  CONSTRAINT `questions_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (7, 4, 'Pahami visi, strategi, dan tantangan perusahaan saat ini.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (8, 4, 'Pertimbangkan budaya, filosofi manajemen, toleransi risiko, keamanan, etika, dan integritas.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (9, 4, 'Gunakan kaskade tujuan COBIT dan faktor desain untuk menetapkan prioritas manajemen dan implementasinya.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (10, 4, 'Menyediakan sumber daya yang cukup dan terampil untuk mendukung proses komunikasi', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (11, 4, 'Mengembangkan model proses tata kelola TI sesuai prioritas organisasi.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (12, 4, 'Identifikasi keputusan penting untuk pencapaian strategi TI dan layanan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (13, 4, 'Libatkan pemangku kepentingan utama dalam pengambilan keputusan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (14, 4, 'Tetapkan ruang lingkup, mandat, dan tanggung jawab fungsi TI sesuai tata kelola.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (15, 4, 'Menetapkan, menyepakati, dan mengkomunikasikan peran serta tanggung jawab TI sesuai kebutuhan bisnis, dengan jelas menguraikan akuntabilitas dan pengambilan keputusan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (16, 4, 'Memperhitungkan kesinambungan layanan, pelatihan silang, dan cadangan staf.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (17, 4, 'Memberikan masukan pada proses kesinambungan layanan TI dengan menjaga informasi kontak dan deskripsi peran terkini di perusahaan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (18, 4, 'Memperbarui informasi kontak dan deskripsi peran untuk mendukung kesinambungan layanan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (19, 4, 'Memasukkan kepatuhan terhadap kebijakan, kode etik, dan standar profesional dalam deskripsi peran.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (20, 4, 'Mencegah adanya peran tunggal yang berisiko dengan pembagian tugas yang tepat.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (21, 4, 'Mengidentifikasi keterampilan dan kompetensi yang diperlukan untuk mencapai tujuan manajemen yang dipilih.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (22, 4, 'Menganalisis kesenjangan antara keterampilan dan kemampuan target untuk perusahaan dan keterampilan tenaga kerja saat ini', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (23, 4, 'Mengidentifikasi tujuan manajemen prioritas yang dapat dicapai dengan mengotomatisasi layanan, aplikasi, atau infrastruktur.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (24, 4, 'Pilih dan terapkan alat yang paling tepat dan komunikasikan kepada para pemangku kepentingan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (25, 4, 'Memberikan pelatihan tentang alat yang dipilih, sesuai kebutuhan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (26, 4, 'Mengembangkan dan mempertahankan pemahaman tentang lingkungan eksternal perusahaan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (27, 4, 'Memahami kondisi saat ini, termasuk lingkungan operasional, arsitektur perusahaan, budaya, dan tantangan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (28, 4, 'Memahami arah dan strategi masa depan perusahaan serta ambisi digitalisasi, mulai dari efisiensi hingga inovasi model bisnis baru.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (29, 4, 'Membuat garis dasar kemampuan dan layanan bisnis serta TI, termasuk layanan eksternal, tata kelola I&T, dan kompetensi TI di seluruh perusahaan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (30, 4, 'Merangkum konteks dan arah perusahaan untuk menentukan fokus I&T, seperti digitalisasi proses, teknologi baru, model bisnis digital, dan pengembangan produk digital.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (31, 4, 'Tentukan tujuan dan sasaran I&T tingkat tinggi dan tentukan kontribusinya terhadap tujuan perusahaan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (32, 4, 'Menilai layanan TI saat ini untuk menemukan kesenjangan dengan kebutuhan bisnis, serta mengidentifikasi area dan opsi peningkatan layanan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (33, 4, 'Menganalisis, mempelajari, dan memperkirakan permintaan di masa depan serta mengonfirmasi kapasitas layanan yang mendukung TIK yang ada.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (34, 4, 'Menerbitkan dalam katalog layanan langsung berkemampuan I&T yang relevan, paket layanan, dan opsi tingkat layanan dari portofolio.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (35, 4, 'Menetapkan standar, praktik, dan prosedur manajemen mutu yang sejalan dengan persyaratan kerangka kerja kontrol I&T dan kriteria dan kebijakan manajemen mutu perusahaan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (36, 4, 'Buatlah platform untuk berbagi praktik-praktik yang baik dan tangkap informasi tentang cacat dan kesalahan untuk memungkinkan pembelajaran dari hal tersebut.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (37, 4, 'Menetapkan dan memelihara metode untuk pengumpulan, klasifikasi, dan analisis data terkait risiko TI.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (38, 4, 'Mencatat data terkait risiko I&T yang relevan dan signifikan pada lingkungan operasi internal dan eksternal perusahaan', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (39, 4, 'Menginventarisasi proses bisnis dan ketergantungan pada layanan TI, sumber daya, personel, aplikasi, infrastruktur, vendor, dan outsourcing penting.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (40, 4, 'Menentukan dan menyepakati layanan TI dan sumber daya infrastruktur TI mana yang penting untuk menopang operasi bisnis \r\nproses. Menganalisis ketergantungan dan mengidentifikasi hubungan yang lemah.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (41, 4, 'Mengagregasi skenario risiko saat ini berdasarkan kategori, lini bisnis, dan area fungsional', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (42, 4, 'Memelihara inventaris kontrol risiko yang ada, mengklasifikasikan, dan memetakan kontrol tersebut ke skenario dan agregasi risiko TI sesuai toleransi risiko.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (43, 4, 'Gunakan permintaan perubahan formal melalui proses manajemen perubahan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (44, 4, 'Kategorikan perubahan berdasarkan jenis dan item konfigurasi yang terdampak.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (45, 4, 'Prioritaskan berdasarkan kebutuhan bisnis, teknis, dan kepatuhan hukum.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (46, 4, 'Dapatkan persetujuan formal dari pihak terkait; tetapkan perubahan standar untuk kasus yang umum dan berisiko rendah.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (47, 4, 'Rencanakan dan jadwalkan perubahan yang disetujui.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (48, 4, 'Tentukan kriteria perubahan darurat.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (49, 4, 'Pastikan ada prosedur terdokumentasi untuk menyatakan, menilai, menyetujui awal, mengotorisasi, dan mencatat perubahan darurat.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (50, 4, 'Pastikan perubahan dicatat dalam dokumentasi manajemen, seperti prosedur operasional bisnis dan TI, dokumentasi pemulihan bencana, konfigurasi, aplikasi, bantuan, dan materi pelatihan.', '2025-07-14 14:37:44', '2025-07-14 14:37:44');
INSERT INTO `questions` VALUES (72, 6, 'Memvalidasi prioritas yang dipilih untuk implementasi tujuan manajemen dengan praktik-praktik yang baik dan industri yang spesifik (misalnya, peraturan khusus industri) dan dengan struktur tata kelola yang sesuai.', '2025-07-14 15:26:23', '2025-07-14 15:26:23');
INSERT INTO `questions` VALUES (73, 6, 'Tentukan kebutuhan komunikasi dan terapkan rencana yang mencakup komunikasi top-down, bottom-up, dan horizontal.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (74, 6, 'Komunikasikan tujuan dan arah I&T secara berkelanjutan dengan dukungan nyata dari manajemen eksekutif melalui berbagai saluran.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (75, 6, 'Pastikan informasi yang disampaikan mencakup misi, tujuan layanan, kontrol internal, kualitas, etika, kebijakan, prosedur, serta peran dan tanggung jawab, dengan tingkat detail yang sesuai untuk setiap audiens.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (76, 6, 'Menganalisis kesenjangan antara model proses target untuk organisasi dengan praktik dan aktivitas saat ini.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (77, 6, 'Tentukan ruang lingkup fungsi internal dan eksternal, peran internal dan eksternal, serta kemampuan dan hak pengambilan keputusan yang diperlukan untuk mencakup semua praktik, termasuk yang dilakukan oleh pihak ketiga.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (78, 6, 'Menyelaraskan organisasi yang berhubungan dengan I&T dengan model organisasi arsitektur perusahaan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (79, 6, 'Membentuk komite pengarah I&T (atau yang setara) yang terdiri dari eksekutif, bisnis dan manajemen I&T untuk melacak status proyek, menyelesaikan konflik sumber daya, dan memantau tingkat layanan dan peningkatan layanan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (80, 6, 'Menyediakan panduan untuk setiap struktur manajemen (termasuk mandat, tujuan, peserta rapat, waktu, pelacakan, pengawasan dan pemantauan) serta masukan yang diperlukan dan hasil yang diharapkan dari rapat.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (81, 6, 'Lakukan pengawasan untuk memastikan setiap orang menjalankan tugasnya dengan baik, memiliki wewenang dan sumber daya yang cukup, serta kinerjanya ditinjau secara rutin. Tingkat pengawasan disesuaikan dengan pentingnya posisi dan besar tanggung jawab yang dipegang.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (82, 6, 'Pahami kondisi perusahaan dan strategi yang digunakan, termasuk bagaimana TI akan dikelola', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (83, 6, 'Cari tahu dan nilai berbagai pilihan untuk menempatkan fungsi TI, sumber daya, dan cara operasinya.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (84, 6, 'Tentukan pilihan terbaik untuk penempatan fungsi TI dan pastikan sudah disetujui oleh pihak terkait.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (85, 6, 'Menyediakan panduan untuk memastikan klasifikasi item informasi di seluruh perusahaan yang tepat dan konsisten', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (86, 6, 'Membuat dan memelihara inventaris informasi (sistem dan data) yang mencakup daftar pemilik, kustodian, dan klasifikasi. Sertakan sistem yang dialihdayakan dan sistem yang kepemilikannya harus tetap berada di dalam perusahaan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (87, 6, 'Menilai dan membedakan antara data, informasi, dan sistem yang kritis (bernilai tinggi) dan tidak kritis. Pastikan perlindungan yang sesuai yang tepat untuk setiap kategori.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (88, 6, 'Membuat serangkaian kebijakan untuk mendorong ekspektasi kontrol TI pada topik-topik utama yang relevan seperti kualitas, keamanan, privasi, kontrol internal, penggunaan aset TI, etika, dan hak kekayaan intelektual (HAKI).', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (89, 6, 'Meluncurkan dan menegakkan kebijakan TI secara seragam untuk semua staf yang relevan sehingga kebijakan tersebut menjadi bagian integral dari operasi perusahaan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (90, 6, 'Menilai kematangan digital di berbagai dimensi (mis., kemampuan kepemimpinan untuk memanfaatkan teknologi, tingkat penerimaan risiko teknologi yang diterima, pendekatan terhadap inovasi, budaya dan tingkat pengetahuan pengguna). Menilai keinginan untuk melakukan perubahan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (91, 6, 'Tentukan layanan dan produk TI apa saja yang dibutuhkan untuk mencapai tujuan perusahaan. Pertimbangkan juga teknologi baru yang sudah terbukti, standar industri, praktik dari pesaing, dan tren layanan TI terbaru.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (92, 6, 'Tentukan kemampuan TI, metode kerja, dan pendekatan organisasi yang tepat untuk menghasilkan produk dan layanan TI. Pilih metode pengembangan seperti Agile, Scrum, Waterfall, atau lainnya, sesuai dengan kebutuhan bisnis dan tujuan TI.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (93, 6, 'Mengidentifikasi semua kesenjangan dan perubahan yang diperlukan untuk mewujudkan lingkungan target.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (94, 6, 'Menjelaskan perubahan tingkat tinggi dalam arsitektur perusahaan (domain bisnis, informasi, data, aplikasi, dan teknologi).', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (95, 6, 'Pertimbangkan implikasi tingkat tinggi dari semua kesenjangan. Menilai dampak perubahan potensial pada bisnis dan model operasi I&T, Kemampuan penelitian dan pengembangan I&T, dan program investasi I&T.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (96, 6, 'Tentukan inisiatif yang diperlukan untuk menutup kesenjangan antara lingkungan saat ini dan lingkungan target. Mengintegrasikan inisiatif ke dalam strategi I&T yang koheren yang menyelaraskan I&T dengan semua aspek bisnis.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (97, 6, 'Merinci peta jalan yang mendefinisikan langkah-langkah tambahan yang diperlukan untuk mencapai tujuan dan sasaran strategi TI', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (98, 6, 'Pertimbangkan ekosistem eksternal (mitra perusahaan, pemasok, perusahaan rintisan, dll.)', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (99, 6, 'Kelompokkan tindakan ke dalam program atau proyek yang jelas tujuannya. Untuk setiap proyek, tentukan kebutuhan sumber daya utama, jadwal, anggaran investasi atau operasional, risiko, dan dampak perubahan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (100, 6, 'Kenali ketergantungan, tumpang tindih, sinergi, dan pengaruh antar proyek, lalu prioritaskan berdasarkan hal tersebut.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (101, 6, 'Selesaikan peta jalan (roadmap) yang menunjukkan jadwal dan keterkaitan antar proyek.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (102, 6, 'Pastikan fokus tetap pada perjalanan transformasi digital. Tunjuk seorang pemimpin transformasi digital (seperti chief digital officer/CDO atau jabatan eksekutif lain) untuk menyelaraskan bisnis dan TI.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (103, 6, 'Dapatkan dukungan dan persetujuan resmi dari para pemangku kepentingan untuk rencana tersebut.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (104, 6, 'Buat rencana komunikasi yang mencakup pesan utama, sasaran audiens, cara komunikasi, dan jadwal pelaksanaannya.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (105, 6, 'Siapkan materi komunikasi yang efektif dengan memanfaatkan media dan teknologi yang ada.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (106, 6, 'Bangun dan jaga jaringan untuk mendukung, menyetujui, dan mendorong strategi I&T.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (107, 6, 'Analisis aktivitas proses bisnis untuk menemukan kebutuhan layanan I&T baru atau yang perlu diperbarui.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (108, 6, 'Bandingkan kebutuhan tersebut dengan layanan yang sudah ada dalam portofolio. Jika memungkinkan, gabungkan layanan yang ada menjadi paket baru sesuai kebutuhan bisnis.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (109, 6, 'Lakukan peninjauan rutin bersama manajemen portofolio dan hubungan bisnis untuk mengidentifikasi layanan yang sudah usang. Sepakati penghentian layanan dan ajukan perubahan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (110, 6, 'Pastikan portofolio layanan dan katalog layanan selalu lengkap dan terbaru secara berkala.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (111, 6, 'Sampaikan setiap pembaruan katalog layanan kepada manajemen hubungan bisnis.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (112, 6, 'Tentukan, sepakati, dan dokumentasikan perjanjian operasional internal yang mendukung perjanjian layanan pelanggan, jika diperlukan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (113, 6, 'Koordinasikan dengan manajemen pemasok untuk memastikan kontrak komersial yang sesuai dengan penyedia layanan eksternal mendukung perjanjian layanan pelanggan, jika diperlukan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (114, 6, 'Lakukan peninjauan rutin terhadap perjanjian layanan sesuai kesepakatan untuk memastikan efektivitas dan keterbaruan. Pertimbangkan perubahan kebutuhan, layanan I&T, paket layanan, atau opsi tingkat layanan jika perlu.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (115, 6, 'Pastikan kerangka kontrol I&T dan proses bisnis & TI memiliki pendekatan standar, formal, dan berkelanjutan untuk manajemen kualitas yang sesuai dengan kebutuhan perusahaan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (116, 6, 'Tentukan kebutuhan dan kriteria kualitas (misalnya berdasarkan persyaratan hukum dan pelanggan).\r\nJelaskan peran, tugas, hak keputusan, dan tanggung jawab dalam manajemen kualitas di struktur organisasi.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (117, 6, 'Dapatkan masukan dari manajemen serta pemangku kepentingan internal dan eksternal terkait definisi kebutuhan dan kriteria kualitas.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (118, 6, 'Fokuskan manajemen kualitas pada kebutuhan pelanggan baik internal maupun eksternal, pastikan standar dan praktik TI sesuai dengan kebutuhan tersebut, serta jelaskan dan komunikasikan peran dan tanggung jawab dalam menyelesaikan konflik antara pengguna/pelanggan dengan tim TI.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (119, 6, 'Kelola kebutuhan dan harapan bisnis untuk setiap proses, layanan TI, dan solusi baru, serta jaga kriteria penerimaan kualitasnya.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (120, 6, 'Sampaikan kebutuhan dan harapan pelanggan ke seluruh organisasi bisnis dan TI.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (121, 6, 'Gabungkan praktik manajemen kualitas yang diperlukan ke dalam proses dan solusi utama.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (122, 6, 'Pertimbangkan keuntungan dan biaya sertifikasi kualitas.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (123, 6, 'Sosialisasikan pendekatan manajemen kualitas secara efektif, misalnya lewat pelatihan berkala dan formal.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (124, 6, 'Siapkan dan lakukan tinjauan kualitas untuk proses dan solusi utama dalam organisasi.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (125, 6, 'Temukan contoh proses pengiriman berkualitas tinggi yang bisa bermanfaat bagi layanan atau proyek lain, dan bagikan dengan tim layanan serta tim proyek untuk mendorong perbaikan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (126, 6, 'Identifikasi contoh cacat kualitas yang berulang, cari penyebab utamanya, evaluasi dampak dan hasilnya, lalu sepakati tindakan perbaikan bersama tim layanan atau tim proyek.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (127, 6, 'Berikan pelatihan kepada karyawan tentang metode dan alat untuk perbaikan berkelanjutan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (128, 6, 'Gunakan atau buat taksonomi risiko untuk mendefinisikan secara konsisten skenario risiko serta kategori dampak dan kemungkinan terjadinya risiko.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (129, 6, 'Catat data tentang kejadian risiko yang sudah atau mungkin berdampak pada bisnis sesuai kategori dampak dalam taksonomi tersebut. Ambil data terkait dari isu, insiden, masalah, dan investigasi yang relevan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (130, 6, 'Tentukan ruang lingkup analisis risiko yang tepat dengan mempertimbangkan semua faktor risiko dan tingkat kritikalitas aset bisnis.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (131, 6, 'Buat dan perbarui secara rutin skenario risiko TI, potensi kerugian terkait TI, serta risiko reputasi, termasuk skenario gabungan dari berbagai jenis ancaman yang terjadi bersamaan atau berurutan. Tentukan harapan terhadap aktivitas pengendalian dan kemampuan deteksi.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (132, 6, 'Perkirakan frekuensi (kemungkinan) dan besaran kerugian atau keuntungan dari skenario risiko TI, dengan mempertimbangkan semua faktor risiko dan kontrol operasional yang ada.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (133, 6, 'Bandingkan risiko saat ini dengan selera risiko dan toleransi risiko yang diterima. Identifikasi risiko yang tidak dapat diterima atau meningkat.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (134, 6, 'Usulkan respons risiko untuk risiko yang melebihi selera dan toleransi risiko.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (135, 6, 'Tentukan kebutuhan utama untuk proyek atau program yang akan menjalankan respons risiko tersebut, termasuk kebutuhan dan harapan terhadap pengendalian utama yang tepat untuk mitigasi risiko.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (136, 6, 'Secara rutin kumpulkan semua informasi tentang profil risiko dan gabungkan menjadi satu profil risiko yang menyeluruh.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (137, 6, 'Catat juga status rencana tindakan risiko untuk dimasukkan ke dalam profil risiko TI perusahaan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (138, 6, 'Laporkan hasil analisis risiko kepada semua pemangku kepentingan dengan cara dan format yang membantu pengambilan keputusan perusahaan. Bila memungkinkan, sertakan probabilitas dan perkiraan kerugian atau keuntungan beserta tingkat keyakinannya agar manajemen dapat menyeimbangkan risiko dan imbal hasil.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (139, 6, 'Berikan pemahaman kepada pengambil keputusan tentang skenario terburuk dan yang paling mungkin terjadi, potensi kerugian terkait TI, serta pertimbangan penting terkait reputasi, hukum, dan regulasi, atau kategori dampak lain sesuai taksonomi risiko.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (140, 6, 'Sampaikan profil risiko terkini kepada semua pemangku kepentingan, termasuk efektivitas proses manajemen risiko, efektivitas pengendalian, kekurangan, ketidaksesuaian, duplikasi, status perbaikan, dan dampaknya terhadap profil risiko.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (141, 6, 'Secara berkala, identifikasi peluang terkait TI yang memungkinkan penerimaan risiko lebih besar untuk mendorong pertumbuhan dan imbal hasil, khususnya di area yang risiko dan kapasitas risikonya seimbang.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (142, 6, 'Pastikan setiap unit dalam organisasi memonitor risiko dan bertanggung jawab untuk beroperasi sesuai dengan batas toleransi risiko masing-masing dan portofolio keseluruhan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (143, 6, 'Susun rangkaian proyek yang seimbang yang bertujuan mengurangi risiko dan/atau mendukung peluang strategis perusahaan, dengan mempertimbangkan biaya, manfaat, pengaruh terhadap profil risiko saat ini, serta kepatuhan terhadap regulasi.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (144, 6, 'Buat, perbarui, dan uji rencana yang menjelaskan langkah-langkah yang harus diambil apabila terjadi risiko yang berpotensi menyebabkan insiden operasional atau pengembangan yang signifikan dan berdampak besar pada bisnis', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (145, 6, 'Laksanakan rencana tanggapan yang sesuai untuk mengurangi dampak saat insiden risiko terjadi.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (146, 6, 'Nilai dan rencanakan perubahan secara terstruktur dengan analisis dampak pada bisnis, sistem, dan penyedia layanan. Pertimbangkan risiko, keamanan, hukum, dan keterkaitan perubahan. Libatkan pemilik proses bisnis bila perlu.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (147, 6, 'Perhatikan juga dampak pada layanan kontrak dan integrasikan dengan manajemen perubahan penyedia.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (148, 6, 'Pastikan akses darurat untuk perubahan sudah diotorisasi, tercatat, dan dicabut setelah selesai.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (149, 6, 'Tentukan periode retensi yang tepat untuk dokumentasi perubahan dan dokumentasi sistem dan pengguna sebelum dan sesudah perubahan.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (150, 6, 'Lakukan review dokumen dengan tingkat yang sama seperti perubahan itu sendiri.', '2025-07-14 15:26:24', '2025-07-14 15:26:24');
INSERT INTO `questions` VALUES (152, 7, 'Susun peta jalan (road map) untuk menerapkan proses atau aktivitas yang belum tersedia. Gunakan metrik praktik untuk memantau keberhasilan implementasi.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (153, 7, 'Tentukan dan terapkan struktur organisasi. Tinjau secara berkala efektivitas dan kecocokannya.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (154, 7, 'Tetapkan dan komunikasikan kebijakan serta prosedur. Evaluasi dan perbarui setidaknya setiap tahun agar sesuai dengan perubahan lingkungan bisnis atau operasional.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (155, 7, 'Tinjau kinerja komponen kerangka kerja secara berkala dan ambil tindakan yang diperlukan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (156, 7, 'Identifikasi proses bisnis penting berdasarkan kinerja, kepatuhan, dan risiko. Nilai kapabilitas dan tentukan target peningkatan. Analisis kesenjangan serta cari opsi perbaikan atau perancangan ulang proses.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (157, 7, 'Pertimbangkan nilai dari perubahan yang mungkin dilakukan terhadap kapabilitas bisnis dan TI, layanan TI, serta arsitektur perusahaan, termasuk dampaknya jika tidak dilakukan perubahan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (158, 7, 'Perjelas definisi lingkungan target dan siapkan pernyataan nilai yang menjelaskan manfaat dari lingkungan tersebut.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (159, 7, 'Uraikan tujuan menjadi hasil yang terukur dengan metrik (apa) dan target (berapa banyak). Pastikan hasil tersebut mendukung manfaat bagi perusahaan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (160, 7, 'Kumpulkan umpan balik dan perbarui rencana komunikasi serta metode penyampaian sesuai kebutuhan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (161, 7, 'Sesuaikan permintaan dengan paket layanan yang tersedia dan ciptakan layanan standar untuk efisiensi menyeluruh.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (162, 7, 'Tetapkan dan pelihara metrik untuk memantau serta mengumpulkan data layanan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (163, 7, 'Evaluasi kinerja dan buat laporan formal secara berkala terkait kesesuaian dengan perjanjian layanan, termasuk penyimpangan, lalu distribusikan ke manajemen hubungan bisnis.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (164, 7, 'Lakukan tinjauan rutin untuk memprediksi dan mengidentifikasi tren dalam kinerja layanan, serta terapkan praktik manajemen mutu dalam pemantauan layanan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (165, 7, 'Sediakan informasi manajemen yang relevan untuk mendukung pengelolaan kinerja.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (166, 7, 'Sepakati rencana aksi dan perbaikan untuk mengatasi masalah kinerja atau tren negatif.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (167, 7, 'Lakukan revisi terhadap perjanjian layanan dengan penyedia jika diperlukan. Perbarui dan sepakati kembali perjanjian operasional internal.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (168, 7, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (169, 7, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (170, 7, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (171, 7, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (172, 7, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (173, 7, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (174, 7, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (175, 7, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (176, 7, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (177, 7, 'Survei dan analisis data historis risiko TI serta kerugian, termasuk data eksternal, tren industri, dan database kejadian.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (178, 7, 'Klasifikasikan data kejadian serupa dan identifikasi faktor penyebab umum.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (179, 7, 'Tentukan kondisi khusus yang memicu atau memperparah kejadian risiko dan pengaruhnya terhadap frekuensi dan besarnya kerugian.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (180, 7, 'Lakukan analisis berkala untuk mendeteksi risiko baru dan memahami faktor risiko internal maupun eksternal.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (181, 7, 'Validasi hasil analisis risiko dan Business Impact Analysis (BIA) sebelum dijadikan dasar pengambilan keputusan. Pastikan sesuai dengan kebutuhan perusahaan dan bebas dari bias.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (182, 7, 'Tetapkan indikator risiko berdasarkan data profil risiko untuk memantau kondisi dan tren risiko.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (183, 7, 'Rekam kejadian risiko TI yang terjadi sebagai bagian dari profil risiko perusahaan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (184, 7, 'Tinjau hasil penilaian pihak ketiga, audit internal, dan peninjauan mutu. Masukkan ke dalam profil risiko. Evaluasi celah dan paparan kerugian TI untuk menentukan perlunya analisis tambahan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (185, 7, 'Kategorikan insiden dan bandingkan kerugian TI dengan ambang toleransi risiko. Sampaikan dampaknya kepada pengambil keputusan dan perbarui profil risiko.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (186, 7, 'Analisis kejadian buruk dan peluang yang terlewat untuk menemukan akar masalahnya.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (187, 7, 'Pantau semua perubahan darurat dan lakukan tinjauan pasca-implementasi bersama pihak terkait. Tinjauan harus mengidentifikasi dan memperbaiki akar masalah seperti proses bisnis, pengembangan aplikasi, lingkungan pengujian, dokumentasi, dan integritas data.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (188, 7, 'Kategorikan permintaan perubahan (ditolak, disetujui namun belum dimulai, sedang diproses, dan selesai).', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (189, 7, 'Buat laporan status perubahan dengan metrik kinerja untuk mendukung evaluasi dan pemantauan manajemen. Pastikan laporan ini membentuk jejak audit lengkap dari awal hingga selesai.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (190, 7, 'Pantau perubahan yang masih terbuka agar setiap perubahan diselesaikan tepat waktu sesuai prioritas.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (191, 7, 'Jaga sistem pelacakan dan pelaporan untuk seluruh permintaan perubahan.', '2025-07-14 15:30:12', '2025-07-14 15:30:12');
INSERT INTO `questions` VALUES (192, 8, 'Prioritaskan inisiatif perbaikan berdasarkan manfaat dan biaya potensial. Terapkan perbaikan, jadikan sebagai praktik bisnis rutin, dan tetapkan tujuan serta metrik kinerja untuk pemantauan.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (193, 8, 'Tingkatkan efisiensi dan efektivitas melalui pelatihan, dokumentasi, standarisasi, atau otomatisasi proses.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (194, 8, 'Terapkan praktik manajemen mutu untuk memperbarui proses.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (195, 8, 'Hapus komponen tata kelola yang sudah usang (seperti proses, dokumen informasi, kebijakan, dll.).', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (196, 8, 'Tanggapi temuan hasil tinjauan untuk terus meningkatkan sistem manajemen mutu.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (197, 8, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (198, 8, 'Analisis biaya/manfaat dari berbagai opsi respons risiko, seperti menghindari, mengurangi, mentransfer, menerima, atau memanfaatkan risiko. Tentukan respons risiko terbaik.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (199, 8, 'Komunikasikan akar masalah, kebutuhan respons tambahan, dan perbaikan proses kepada pengambil keputusan. Pastikan semua hal tersebut tercakup dalam proses tata kelola risiko.', '2025-07-14 15:31:18', '2025-07-14 15:31:18');
INSERT INTO `questions` VALUES (203, 10, 'Memperoleh pemahaman tentang visi, arah, dan strategi perusahaan serta konteks dan tantangan perusahaan saat ini.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (204, 10, 'Pertimbangkan lingkungan internal perusahaan, termasuk budaya dan filosofi manajemen, toleransi risiko, kebijakan keamanan dan privasi, nilai-nilai etika, kode etik, akuntabilitas, dan persyaratan integritas manajemen.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (205, 10, 'Menerapkan kaskade tujuan COBIT dan faktor desain pada strategi dan konteks perusahaan untuk menentukan prioritas sistem manajemen dan, dengan demikian, untuk implementasi prioritas tujuan manajemen.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (206, 10, 'Menyediakan sumber daya yang cukup dan terampil untuk mendukung proses komunikasi', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (207, 10, 'Mengembangkan model proses target tata kelola TI yang spesifik untuk organisasi, berdasarkan pemilihan tujuan manajemen prioritas (output dari kaskade tujuan dan latihan faktor desain).', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (208, 10, 'Mengidentifikasi keputusan yang diperlukan untuk pencapaian hasil perusahaan dan strategi TI serta untuk pengelolaan dan pelaksanaan layanan TI.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (209, 10, 'Melibatkan pemangku kepentingan yang sangat penting dalam pengambilan keputusan (akuntabel, bertanggung jawab, dikonsultasikan atau diberi informasi)', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (210, 10, 'Tentukan ruang lingkup, fokus, mandat, dan tanggung jawab setiap fungsi dalam organisasi yang terkait dengan TI, sesuai dengan arahan tata kelola.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (211, 10, 'Menetapkan, menyepakati, dan mengkomunikasikan peran dan tanggung jawab terkait TI untuk semua personel di perusahaan, sesuai dengan kebutuhan dan tujuan bisnis. Menggambarkan dengan jelas tanggung jawab dan akuntabilitas, terutama untuk pengambilan keputusan dan persetujuan.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (212, 10, 'Pertimbangkan persyaratan dari perusahaan dan kesinambungan layanan TI saat mendefinisikan peran, termasuk cadangan staf dan persyaratan pelatihan silang.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (213, 10, 'Memberikan masukan pada proses kesinambungan layanan TI dengan menjaga informasi kontak dan deskripsi peran terkini di perusahaan.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (214, 10, 'Sertakan persyaratan khusus dalam deskripsi peran dan tanggung jawab mengenai kepatuhan terhadap kebijakan dan prosedur manajemen , kode etik, dan praktik-praktik profesional.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (215, 10, 'Memastikan bahwa akuntabilitas didefinisikan melalui peran dan tanggung jawab.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (216, 10, 'Menyusun peran dan tanggung jawab untuk mengurangi kemungkinan adanya peran tunggal yang membahayakan proses penting.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (217, 10, 'Mengidentifikasi keterampilan dan kompetensi yang diperlukan untuk mencapai tujuan manajemen yang dipilih.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (218, 10, 'Menganalisis kesenjangan antara keterampilan dan kemampuan target untuk perusahaan dan keterampilan tenaga kerja saat ini', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (219, 10, 'Mengidentifikasi tujuan manajemen prioritas yang dapat dicapai dengan mengotomatisasi layanan, aplikasi, atau infrastruktur.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (220, 10, 'Pilih dan terapkan alat yang paling tepat dan komunikasikan kepada para pemangku kepentingan.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (221, 10, 'Memberikan pelatihan tentang alat yang dipilih, sesuai kebutuhan.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (222, 10, 'Memberikan pelatihan tentang alat yang dipilih, sesuai kebutuhan.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (223, 10, 'Menetapkan standar, praktik, dan prosedur manajemen mutu yang sejalan dengan persyaratan kerangka kerja kontrol I&T dan kriteria dan kebijakan manajemen mutu perusahaan.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (224, 10, 'Buatlah platform untuk berbagi praktik-praktik yang baik dan tangkap informasi tentang cacat dan kesalahan untuk memungkinkan pembelajaran dari hal tersebut.', '2025-07-16 12:26:05', '2025-07-16 12:26:05');
INSERT INTO `questions` VALUES (225, 11, 'Memvalidasi prioritas yang dipilih untuk implementasi tujuan manajemen dengan praktik-praktik yang baik dan industri yang spesifik (misalnya, peraturan khusus industri) dan dengan struktur tata kelola yang sesuai.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (226, 11, 'Menetapkan aturan dasar untuk komunikasi dengan mengidentifikasi kebutuhan komunikasi dan mengimplementasikan rencana berdasarkan kebutuhan tersebut, \r\ndengan mempertimbangkan komunikasi dari atas ke bawah, dari bawah ke atas, dan komunikasi horizontal.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (227, 11, 'Mengkomunikasikan tujuan dan arah I&T secara terus menerus. Memastikan bahwa komunikasi didukung oleh manajemen eksekutif dalam tindakan dan kata-kata, dengan menggunakan semua saluran yang tersedia.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (228, 11, 'Memastikan informasi yang dikomunikasikan mencakup misi yang diartikulasikan dengan jelas, tujuan layanan, kontrol internal, kualitas, kode etik/perilaku, kebijakan dan prosedur, peran dan tanggung jawab, dll. Mengkomunikasikan informasi pada tingkat - tingkat detail yang sesuai untuk masing-masing audiens di dalam perusahaan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (229, 11, 'Menganalisis kesenjangan antara model proses target untuk organisasi dengan praktik dan aktivitas saat ini.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (230, 11, 'Tentukan ruang lingkup fungsi internal dan eksternal, peran internal dan eksternal, serta kemampuan dan hak pengambilan keputusan yang diperlukan untuk \r\nmencakup semua praktik, termasuk yang dilakukan oleh pihak ketiga.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (231, 11, 'Menyelaraskan organisasi yang berhubungan dengan I&T dengan model organisasi arsitektur perusahaan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (232, 11, 'Membentuk komite pengarah I&T (atau yang setara) yang terdiri dari eksekutif, bisnis dan manajemen I&T untuk melacak status proyek, menyelesaikan konflik sumber daya, dan memantau tingkat layanan dan peningkatan layanan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (233, 11, 'Menyediakan panduan untuk setiap struktur manajemen (termasuk mandat, tujuan, peserta rapat, waktu, pelacakan, pengawasan dan pemantauan) serta masukan yang diperlukan dan hasil yang diharapkan dari rapat.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (234, 11, 'Menerapkan praktik-praktik pengawasan yang memadai untuk memastikan bahwa peran dan tanggung jawab dijalankan dengan baik, untuk menilai apakah semua apakah semua personil memiliki wewenang dan sumber daya yang memadai untuk melaksanakan peran dan tanggung jawab mereka, dan secara umum untuk meninjau kinerja. Tingkat pengawasan harus selaras dengan sensitivitas posisi dan luasnya tanggung jawab yang diberikan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (235, 11, 'Memahami konteks untuk penempatan fungsi TI, termasuk penilaian strategi perusahaan dan model operasi (terpusat, federasi, terdesentralisasi, hibrida), pentingnya TI, serta situasi dan pilihan sumber daya.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (236, 11, 'Mengidentifikasi, mengevaluasi, dan memprioritaskan opsi-opsi untuk penempatan organisasi, sumber daya, dan model operasi.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (237, 11, 'Tentukan penempatan fungsi TI dan dapatkan persetujuan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (238, 11, 'Menyediakan panduan untuk memastikan klasifikasi item informasi di seluruh perusahaan yang tepat dan konsisten', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (239, 11, 'Membuat dan memelihara inventaris informasi (sistem dan data) yang mencakup daftar pemilik, kustodian, dan klasifikasi. Sertakan sistem yang dialihdayakan dan sistem yang kepemilikannya harus tetap berada di dalam perusahaan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (240, 11, 'Menilai dan membedakan antara data, informasi, dan sistem yang kritis (bernilai tinggi) dan tidak kritis. Pastikan perlindungan yang sesuai yang tepat untuk setiap kategori.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (241, 11, 'Membuat serangkaian kebijakan untuk mendorong ekspektasi kontrol TI pada topik-topik utama yang relevan seperti kualitas, keamanan, privasi, kontrol internal, penggunaan aset TI, etika, dan hak kekayaan intelektual (HAKI).', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (242, 11, 'Meluncurkan dan menegakkan kebijakan TI secara seragam untuk semua staf yang relevan sehingga kebijakan tersebut menjadi bagian integral dari operasi perusahaan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (243, 11, 'Pastikan kerangka kontrol I&T dan proses bisnis & TI memiliki pendekatan standar, formal, dan berkelanjutan untuk manajemen kualitas yang sesuai dengan kebutuhan perusahaan.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (244, 11, 'Tentukan kebutuhan dan kriteria kualitas (misalnya berdasarkan persyaratan hukum dan pelanggan).\r\nJelaskan peran, tugas, hak keputusan, dan tanggung jawab dalam manajemen kualitas di struktur organisasi.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (245, 11, 'Dapatkan masukan dari manajemen serta pemangku kepentingan internal dan eksternal terkait definisi kebutuhan dan kriteria kualitas.', '2025-07-16 12:29:59', '2025-07-16 12:29:59');
INSERT INTO `questions` VALUES (246, 11, 'Fokuskan manajemen kualitas pada kebutuhan pelanggan baik internal maupun eksternal, pastikan standar dan praktik TI sesuai dengan kebutuhan tersebut, serta jelaskan dan komunikasikan peran dan tanggung jawab dalam menyelesaikan konflik antara pengguna/pelanggan dengan tim TI.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (247, 11, 'Kelola kebutuhan dan harapan bisnis untuk setiap proses, layanan TI, dan solusi baru, serta jaga kriteria penerimaan kualitasnya.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (248, 11, 'Sampaikan kebutuhan dan harapan pelanggan ke seluruh organisasi bisnis dan TI.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (249, 11, 'Gabungkan praktik manajemen kualitas yang diperlukan ke dalam proses dan solusi utama.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (250, 11, 'Pertimbangkan keuntungan dan biaya sertifikasi kualitas.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (251, 11, 'Sosialisasikan pendekatan manajemen kualitas secara efektif, misalnya lewat pelatihan berkala dan formal.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (252, 11, 'Siapkan dan lakukan tinjauan kualitas untuk proses dan solusi utama dalam organisasi.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (253, 11, 'Temukan contoh proses pengiriman berkualitas tinggi yang bisa bermanfaat bagi layanan atau proyek lain, dan bagikan dengan tim layanan serta tim proyek untuk mendorong perbaikan.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (254, 11, 'Identifikasi contoh cacat kualitas yang berulang, cari penyebab utamanya, evaluasi dampak dan hasilnya, lalu sepakati tindakan perbaikan bersama tim layanan atau tim proyek.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (255, 11, 'Berikan pelatihan kepada karyawan tentang metode dan alat untuk perbaikan berkelanjutan.', '2025-07-16 12:30:00', '2025-07-16 12:30:00');
INSERT INTO `questions` VALUES (256, 12, 'Susun peta jalan (road map) untuk menerapkan proses atau aktivitas yang belum tersedia. Gunakan metrik praktik untuk memantau keberhasilan implementasi.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (257, 12, 'Tentukan dan terapkan struktur organisasi. Tinjau secara berkala efektivitas dan kecocokannya.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (258, 12, 'Tinjau kinerja komponen kerangka kerja secara berkala dan ambil tindakan yang diperlukan.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (259, 12, 'Identifikasi proses bisnis penting berdasarkan kinerja, kepatuhan, dan risiko. Nilai kapabilitas dan tentukan target peningkatan. Analisis kesenjangan serta cari opsi perbaikan atau perancangan ulang proses.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (260, 12, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (261, 12, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (262, 12, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (263, 12, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (264, 12, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (265, 12, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (266, 12, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (267, 12, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (268, 12, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-07-16 12:31:08', '2025-07-16 12:31:08');
INSERT INTO `questions` VALUES (269, 13, 'Prioritaskan inisiatif perbaikan berdasarkan manfaat dan biaya potensial. Terapkan perbaikan, jadikan sebagai praktik bisnis rutin, dan tetapkan tujuan serta metrik kinerja untuk pemantauan.', '2025-07-16 12:31:37', '2025-07-16 12:31:37');
INSERT INTO `questions` VALUES (270, 13, 'Tingkatkan efisiensi dan efektivitas melalui pelatihan, dokumentasi, standarisasi, atau otomatisasi proses.', '2025-07-16 12:31:37', '2025-07-16 12:31:37');
INSERT INTO `questions` VALUES (271, 13, 'Terapkan praktik manajemen mutu untuk memperbarui proses.', '2025-07-16 12:31:37', '2025-07-16 12:31:37');
INSERT INTO `questions` VALUES (272, 13, 'Hapus komponen tata kelola yang sudah usang (seperti proses, dokumen informasi, kebijakan, dll.).', '2025-07-16 12:31:37', '2025-07-16 12:31:37');
INSERT INTO `questions` VALUES (273, 13, 'Tanggapi temuan hasil tinjauan untuk terus meningkatkan sistem manajemen mutu.', '2025-07-16 12:31:37', '2025-07-16 12:31:37');
INSERT INTO `questions` VALUES (274, 13, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-07-16 12:31:37', '2025-07-16 12:31:37');
INSERT INTO `questions` VALUES (275, 14, 'Identifikasi pemangku kepentingan bisnis, kepentingan mereka, dan tanggung jawabnya.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (276, 14, 'Tinjau arah perusahaan saat ini, isu strategis, tujuan bisnis, dan kesesuaiannya dengan arsitektur perusahaan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (277, 14, 'Pahami kondisi lingkungan bisnis saat ini, kendala proses, ekspansi atau kontraksi geografis, serta faktor industri dan regulasi.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (278, 14, 'Pelihara pemahaman atas proses bisnis dan aktivitas terkait, termasuk pola permintaan terhadap volume dan penggunaan layanan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (279, 14, 'Koordinasikan dan komunikasikan perubahan serta transisi seperti rencana proyek/perubahan, jadwal, kebijakan rilis, kesalahan yang diketahui, dan pelatihan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (280, 14, 'Koordinasikan aktivitas operasional, peran dan tanggung jawab, termasuk definisi jenis permintaan, eskalasi berjenjang, gangguan besar (terencana dan tidak terencana), serta isi dan frekuensi laporan layanan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (281, 14, 'Ambil tanggung jawab atas respons terhadap peristiwa besar yang dapat memengaruhi hubungan dengan bisnis, serta berikan dukungan langsung jika diperlukan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (282, 14, 'Menetapkan standar, praktik, dan prosedur manajemen mutu yang sejalan dengan persyaratan kerangka kerja kontrol I&T dan kriteria dan kebijakan manajemen mutu perusahaan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (283, 14, 'Buatlah platform untuk berbagi praktik-praktik yang baik dan tangkap informasi tentang cacat dan kesalahan untuk memungkinkan pembelajaran dari hal tersebut.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (284, 14, 'Menetapkan dan memelihara metode untuk pengumpulan, klasifikasi, dan analisis data terkait risiko TI.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (285, 14, 'Mencatat data terkait risiko I&T yang relevan dan signifikan pada lingkungan operasi internal dan eksternal perusahaan', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (286, 14, 'Menginventarisasi proses bisnis dan ketergantungan pada layanan TI, sumber daya, personel, aplikasi, infrastruktur, vendor, dan outsourcing penting.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (287, 14, 'Menentukan dan menyepakati layanan TI dan sumber daya infrastruktur TI mana yang penting untuk menopang operasi bisnis \r\nproses. Menganalisis ketergantungan dan mengidentifikasi hubungan yang lemah.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (288, 14, 'Mengagregasi skenario risiko saat ini berdasarkan kategori, lini bisnis, dan area fungsional', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (289, 14, 'Memelihara inventaris kontrol risiko yang ada, mengklasifikasikan, dan memetakan kontrol tersebut ke skenario dan agregasi risiko TI sesuai toleransi risiko.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (290, 14, 'Gunakan permintaan perubahan formal melalui proses manajemen perubahan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (291, 14, 'Kategorikan perubahan berdasarkan jenis dan item konfigurasi yang terdampak.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (292, 14, 'Prioritaskan berdasarkan kebutuhan bisnis, teknis, dan kepatuhan hukum.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (293, 14, 'Dapatkan persetujuan formal dari pihak terkait; tetapkan perubahan standar untuk kasus yang umum dan berisiko rendah.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (294, 14, 'Rencanakan dan jadwalkan perubahan yang disetujui.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (295, 14, 'Tentukan kriteria perubahan darurat.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (296, 14, 'Pastikan ada prosedur terdokumentasi untuk menyatakan, menilai, menyetujui awal, mengotorisasi, dan mencatat perubahan darurat.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (297, 14, 'Pastikan perubahan dicatat dalam dokumentasi manajemen, seperti prosedur operasional bisnis dan TI, dokumentasi pemulihan bencana, konfigurasi, aplikasi, bantuan, dan materi pelatihan.', '2025-07-16 12:37:26', '2025-07-16 12:37:26');
INSERT INTO `questions` VALUES (298, 15, 'Kelola ekspektasi dengan memastikan unit bisnis memahami prioritas, ketergantungan, keterbatasan anggaran, dan perlunya penjadwalan permintaan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (299, 15, 'Posisikan TI sebagai mitra bisnis. Bersikap proaktif dalam mengidentifikasi dan berkomunikasi dengan pemangku kepentingan mengenai peluang, risiko, dan batasan, termasuk teknologi, layanan, dan model proses bisnis terbaru.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (300, 15, 'Bekerja sama dalam inisiatif besar bersama manajemen portofolio, program, dan proyek. Pastikan TI terlibat sejak awal dengan memberikan saran bernilai tambah dan bertanggung jawab atas bagian pekerjaan TI.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (301, 15, 'Tunjuk manajer hubungan sebagai kontak tunggal untuk setiap unit bisnis penting. Pastikan terdapat satu kontak yang memahami bisnis, memiliki pengetahuan teknologi, dan berwenang.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (302, 15, 'Kelola hubungan secara formal dan transparan untuk mencapai tujuan bersama dalam mendukung sasaran strategis dengan memperhatikan anggaran dan risiko.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (303, 15, 'Tentukan dan komunikasikan prosedur pengaduan dan eskalasi untuk menyelesaikan masalah hubungan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (304, 15, 'Pastikan keputusan penting disetujui oleh pemangku kepentingan yang bertanggung jawab.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (305, 15, 'Buat dan jalankan rencana komunikasi menyeluruh yang mengatur isi, frekuensi, dan penerima informasi layanan, termasuk status nilai yang diberikan dan risiko yang teridentifikasi.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (306, 15, 'Pastikan kerangka kontrol I&T dan proses bisnis & TI memiliki pendekatan standar, formal, dan berkelanjutan untuk manajemen kualitas yang sesuai dengan kebutuhan perusahaan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (307, 15, 'Tentukan kebutuhan dan kriteria kualitas (misalnya berdasarkan persyaratan hukum dan pelanggan). Jelaskan peran, tugas, hak keputusan, dan tanggung jawab dalam manajemen kualitas di struktur organisasi.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (308, 15, 'Dapatkan masukan dari manajemen serta pemangku kepentingan internal dan eksternal terkait definisi kebutuhan dan kriteria kualitas.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (309, 15, 'Fokuskan manajemen kualitas pada kebutuhan pelanggan baik internal maupun eksternal, pastikan standar dan praktik TI sesuai dengan kebutuhan tersebut, serta jelaskan dan komunikasikan peran dan tanggung jawab dalam menyelesaikan konflik antara pengguna/pelanggan dengan tim TI.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (310, 15, 'Kelola kebutuhan dan harapan bisnis untuk setiap proses, layanan TI, dan solusi baru, serta jaga kriteria penerimaan kualitasnya.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (311, 15, 'Sampaikan kebutuhan dan harapan pelanggan ke seluruh organisasi bisnis dan TI.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (312, 15, 'Gabungkan praktik manajemen kualitas yang diperlukan ke dalam proses dan solusi utama.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (313, 15, 'Pertimbangkan keuntungan dan biaya sertifikasi kualitas.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (314, 15, 'Sosialisasikan pendekatan manajemen kualitas secara efektif, misalnya lewat pelatihan berkala dan formal.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (315, 15, 'Siapkan dan lakukan tinjauan kualitas untuk proses dan solusi utama dalam organisasi.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (316, 15, 'Temukan contoh proses pengiriman berkualitas tinggi yang bisa bermanfaat bagi layanan atau proyek lain, dan bagikan dengan tim layanan serta tim proyek untuk mendorong perbaikan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (317, 15, 'Identifikasi contoh cacat kualitas yang berulang, cari penyebab utamanya, evaluasi dampak dan hasilnya, lalu sepakati tindakan perbaikan bersama tim layanan atau tim proyek.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (318, 15, 'Berikan pelatihan kepada karyawan tentang metode dan alat untuk perbaikan berkelanjutan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (319, 15, 'Gunakan atau buat taksonomi risiko untuk mendefinisikan secara konsisten skenario risiko serta kategori dampak dan kemungkinan terjadinya risiko.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (320, 15, 'Catat data tentang kejadian risiko yang sudah atau mungkin berdampak pada bisnis sesuai kategori dampak dalam taksonomi tersebut. Ambil data terkait dari isu, insiden, masalah, dan investigasi yang relevan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (321, 15, 'Tentukan ruang lingkup analisis risiko yang tepat dengan mempertimbangkan semua faktor risiko dan tingkat kritikalitas aset bisnis.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (322, 15, 'Buat dan perbarui secara rutin skenario risiko TI, potensi kerugian terkait TI, serta risiko reputasi, termasuk skenario gabungan dari berbagai jenis ancaman yang terjadi bersamaan atau berurutan. Tentukan harapan terhadap aktivitas pengendalian dan kemampuan deteksi.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (323, 15, 'Perkirakan frekuensi (kemungkinan) dan besaran kerugian atau keuntungan dari skenario risiko TI, dengan mempertimbangkan semua faktor risiko dan kontrol operasional yang ada.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (324, 15, 'Bandingkan risiko saat ini dengan selera risiko dan toleransi risiko yang diterima. Identifikasi risiko yang tidak dapat diterima atau meningkat.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (325, 15, 'Usulkan respons risiko untuk risiko yang melebihi selera dan toleransi risiko.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (326, 15, 'Tentukan kebutuhan utama untuk proyek atau program yang akan menjalankan respons risiko tersebut, termasuk kebutuhan dan harapan terhadap pengendalian utama yang tepat untuk mitigasi risiko.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (327, 15, 'Secara rutin kumpulkan semua informasi tentang profil risiko dan gabungkan menjadi satu profil risiko yang menyeluruh.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (328, 15, 'Catat juga status rencana tindakan risiko untuk dimasukkan ke dalam profil risiko TI perusahaan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (329, 15, 'Laporkan hasil analisis risiko kepada semua pemangku kepentingan dengan cara dan format yang membantu pengambilan keputusan perusahaan. Bila memungkinkan, sertakan probabilitas dan perkiraan kerugian atau keuntungan beserta tingkat keyakinannya agar manajemen dapat menyeimbangkan risiko dan imbal hasil.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (330, 15, 'Berikan pemahaman kepada pengambil keputusan tentang skenario terburuk dan yang paling mungkin terjadi, potensi kerugian terkait TI, serta pertimbangan penting terkait reputasi, hukum, dan regulasi, atau kategori dampak lain sesuai taksonomi risiko.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (331, 15, 'Sampaikan profil risiko terkini kepada semua pemangku kepentingan, termasuk efektivitas proses manajemen risiko, efektivitas pengendalian, kekurangan, ketidaksesuaian, duplikasi, status perbaikan, dan dampaknya terhadap profil risiko.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (332, 15, 'Secara berkala, identifikasi peluang terkait TI yang memungkinkan penerimaan risiko lebih besar untuk mendorong pertumbuhan dan imbal hasil, khususnya di area yang risiko dan kapasitas risikonya seimbang.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (333, 15, 'Pastikan setiap unit dalam organisasi memonitor risiko dan bertanggung jawab untuk beroperasi sesuai dengan batas toleransi risiko masing-masing dan portofolio keseluruhan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (334, 15, 'Susun rangkaian proyek yang seimbang yang bertujuan mengurangi risiko dan/atau mendukung peluang strategis perusahaan, dengan mempertimbangkan biaya, manfaat, pengaruh terhadap profil risiko saat ini, serta kepatuhan terhadap regulasi.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (335, 15, 'Buat, perbarui, dan uji rencana yang menjelaskan langkah-langkah yang harus diambil apabila terjadi risiko yang berpotensi menyebabkan insiden operasional atau pengembangan yang signifikan dan berdampak besar pada bisnis', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (336, 15, 'Laksanakan rencana tanggapan yang sesuai untuk mengurangi dampak saat insiden risiko terjadi.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (337, 15, 'Nilai dan rencanakan perubahan secara terstruktur dengan analisis dampak pada bisnis, sistem, dan penyedia layanan. Pertimbangkan risiko, keamanan, hukum, dan keterkaitan perubahan. Libatkan pemilik proses bisnis bila perlu.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (338, 15, 'Perhatikan juga dampak pada layanan kontrak dan integrasikan dengan manajemen perubahan penyedia.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (339, 15, 'Pastikan akses darurat untuk perubahan sudah diotorisasi, tercatat, dan dicabut setelah selesai.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (340, 15, 'Tentukan periode retensi yang tepat untuk dokumentasi perubahan dan dokumentasi sistem dan pengguna sebelum dan sesudah perubahan.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (341, 15, 'Lakukan review dokumen dengan tingkat yang sama seperti perubahan itu sendiri.', '2025-07-16 12:40:28', '2025-07-16 12:40:28');
INSERT INTO `questions` VALUES (342, 16, 'Jelaskan ekspektasi bisnis terhadap layanan dan solusi berbasis TI. Pastikan kebutuhan tersebut didefinisikan dengan kriteria dan metrik penerimaan bisnis.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (343, 16, 'Pastikan terdapat kesepakatan antara TI dan seluruh departemen bisnis mengenai ekspektasi dan cara pengukurannya, serta disetujui oleh semua pemangku kepentingan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (344, 16, 'Rencanakan interaksi dan jadwal secara spesifik berdasarkan tujuan bersama dan bahasa yang dimengerti kedua belah pihak (misalnya rapat evaluasi layanan dan kinerja, peninjauan strategi atau rencana baru, dll).', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (345, 16, 'Lakukan analisis kepuasan pelanggan dan penyedia layanan. Pastikan isu-isu ditangani dan laporkan hasil serta statusnya.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (346, 16, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (347, 16, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (348, 16, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (349, 16, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (350, 16, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (351, 16, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (352, 16, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (353, 16, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (354, 16, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (355, 16, 'Survei dan analisis data historis risiko TI serta kerugian, termasuk data eksternal, tren industri, dan database kejadian.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (356, 16, 'Klasifikasikan data kejadian serupa dan identifikasi faktor penyebab umum.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (357, 16, 'Tentukan kondisi khusus yang memicu atau memperparah kejadian risiko dan pengaruhnya terhadap frekuensi dan besarnya kerugian.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (358, 16, 'Lakukan analisis berkala untuk mendeteksi risiko baru dan memahami faktor risiko internal maupun eksternal.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (359, 16, 'Validasi hasil analisis risiko dan Business Impact Analysis (BIA) sebelum dijadikan dasar pengambilan keputusan. Pastikan sesuai dengan kebutuhan perusahaan dan bebas dari bias.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (360, 16, 'Tetapkan indikator risiko berdasarkan data profil risiko untuk memantau kondisi dan tren risiko.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (361, 16, 'Rekam kejadian risiko TI yang terjadi sebagai bagian dari profil risiko perusahaan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (362, 16, 'Tinjau hasil penilaian pihak ketiga, audit internal, dan peninjauan mutu. Masukkan ke dalam profil risiko. Evaluasi celah dan paparan kerugian TI untuk menentukan perlunya analisis tambahan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (363, 16, 'Kategorikan insiden dan bandingkan kerugian TI dengan ambang toleransi risiko. Sampaikan dampaknya kepada pengambil keputusan dan perbarui profil risiko.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (364, 16, 'Analisis kejadian buruk dan peluang yang terlewat untuk menemukan akar masalahnya.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (365, 16, 'Pantau semua perubahan darurat dan lakukan tinjauan pasca-implementasi bersama pihak terkait. Tinjauan harus mengidentifikasi dan memperbaiki akar masalah seperti proses bisnis, pengembangan aplikasi, lingkungan pengujian, dokumentasi, dan integritas data.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (366, 16, 'Kategorikan permintaan perubahan (ditolak, disetujui namun belum dimulai, sedang diproses, dan selesai).', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (367, 16, 'Buat laporan status perubahan dengan metrik kinerja untuk mendukung evaluasi dan pemantauan manajemen. Pastikan laporan ini membentuk jejak audit lengkap dari awal hingga selesai.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (368, 16, 'Pantau perubahan yang masih terbuka agar setiap perubahan diselesaikan tepat waktu sesuai prioritas.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (369, 16, 'Jaga sistem pelacakan dan pelaporan untuk seluruh permintaan perubahan.', '2025-07-16 12:42:13', '2025-07-16 12:42:13');
INSERT INTO `questions` VALUES (370, 17, 'Bekerja sama untuk mengidentifikasi, mengkomunikasikan, dan melaksanakan inisiatif perbaikan.', '2025-07-16 12:42:41', '2025-07-16 12:42:41');
INSERT INTO `questions` VALUES (371, 17, 'Bekerja dengan manajemen layanan dan pemilik proses untuk memastikan bahwa layanan berbasis TI dan proses manajemen layanan terus ditingkatkan, serta akar penyebab dari masalah dapat diidentifikasi dan diselesaikan.', '2025-07-16 12:42:41', '2025-07-16 12:42:41');
INSERT INTO `questions` VALUES (372, 17, 'Tanggapi temuan hasil tinjauan untuk terus meningkatkan sistem manajemen mutu.', '2025-07-16 12:42:41', '2025-07-16 12:42:41');
INSERT INTO `questions` VALUES (373, 17, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-07-16 12:42:41', '2025-07-16 12:42:41');
INSERT INTO `questions` VALUES (374, 17, 'Analisis biaya/manfaat dari berbagai opsi respons risiko, seperti menghindari, mengurangi, mentransfer, menerima, atau memanfaatkan risiko. Tentukan respons risiko terbaik.', '2025-07-16 12:42:41', '2025-07-16 12:42:41');
INSERT INTO `questions` VALUES (375, 17, 'Komunikasikan akar masalah, kebutuhan respons tambahan, dan perbaikan proses kepada pengambil keputusan. Pastikan semua hal tersebut tercakup dalam proses tata kelola risiko.', '2025-07-16 12:42:41', '2025-07-16 12:42:41');
INSERT INTO `questions` VALUES (377, 18, 'Memperoleh pemahaman tentang visi, arah, dan strategi perusahaan serta konteks dan tantangan perusahaan saat ini.', '2025-07-28 15:26:40', '2025-07-28 15:26:40');
INSERT INTO `questions` VALUES (378, 18, 'Pertimbangkan lingkungan internal perusahaan, termasuk budaya dan filosofi manajemen, toleransi risiko, \r\nkebijakan keamanan dan privasi, nilai-nilai etika, kode etik, akuntabilitas, dan persyaratan integritas manajemen.', '2025-07-29 03:37:48', '2025-07-29 03:37:48');
INSERT INTO `questions` VALUES (379, 18, 'Memperoleh pemahaman tentang visi, arah, dan strategi perusahaan serta konteks dan tantangan perusahaan saat ini.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (380, 18, 'Pertimbangkan lingkungan internal perusahaan, termasuk budaya dan filosofi manajemen, toleransi risiko, kebijakan keamanan dan privasi, nilai-nilai etika, kode etik, akuntabilitas, dan persyaratan integritas manajemen.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (381, 18, 'Menerapkan kaskade tujuan COBIT dan faktor desain pada strategi dan konteks perusahaan untuk menentukan prioritas sistem manajemen dan, dengan demikian, untuk implementasi prioritas tujuan manajemen.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (382, 18, 'Menyediakan sumber daya yang cukup dan terampil untuk mendukung proses komunikasi.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (383, 18, 'Mengembangkan model proses target tata kelola TI yang spesifik untuk organisasi, berdasarkan pemilihan tujuan manajemen prioritas (output dari kaskade tujuan dan latihan faktor desain).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (384, 18, 'Mengidentifikasi keputusan yang diperlukan untuk pencapaian hasil perusahaan dan strategi TI serta untuk pengelolaan dan pelaksanaan layanan TI.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (385, 18, 'Melibatkan pemangku kepentingan yang sangat penting dalam pengambilan keputusan (akuntabel, bertanggung jawab, dikonsultasikan atau diberi informasi)', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (386, 18, 'Tentukan ruang lingkup, fokus, mandat, dan tanggung jawab setiap fungsi dalam organisasi yang terkait dengan TI, sesuai dengan arahan tata kelola.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (387, 18, 'Menetapkan, menyepakati, dan mengkomunikasikan peran dan tanggung jawab terkait TI untuk semua personel di perusahaan, sesuai dengan kebutuhan dan tujuan bisnis. Menggambarkan dengan jelas tanggung jawab dan akuntabilitas, terutama untuk pengambilan keputusan dan persetujuan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (388, 18, 'Pertimbangkan persyaratan dari perusahaan dan kesinambungan layanan TI saat mendefinisikan peran, termasuk cadangan staf dan persyaratan pelatihan silang.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (389, 18, 'Memberikan masukan pada proses kesinambungan layanan TI dengan menjaga informasi kontak dan deskripsi peran terkini di perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (390, 18, 'Sertakan persyaratan khusus dalam deskripsi peran dan tanggung jawab mengenai kepatuhan terhadap kebijakan dan prosedur manajemen , kode etik, dan praktik-praktik profesional.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (391, 18, 'Memastikan bahwa akuntabilitas didefinisikan melalui peran dan tanggung jawab.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (392, 18, 'Menyusun peran dan tanggung jawab untuk mengurangi kemungkinan adanya peran tunggal yang membahayakan proses penting.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (393, 18, 'Mengidentifikasi keterampilan dan kompetensi yang diperlukan untuk mencapai tujuan manajemen yang dipilih.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (394, 18, 'Menganalisis kesenjangan antara keterampilan dan kemampuan target untuk perusahaan dan keterampilan tenaga kerja saat ini', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (395, 18, 'Mengidentifikasi tujuan manajemen prioritas yang dapat dicapai dengan mengotomatisasi layanan, aplikasi, atau infrastruktur.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (396, 18, 'Pilih dan terapkan alat yang paling tepat dan komunikasikan kepada para pemangku kepentingan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (397, 18, 'Memberikan pelatihan tentang alat yang dipilih, sesuai kebutuhan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (398, 18, 'Memberikan pelatihan tentang alat yang dipilih, sesuai kebutuhan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (399, 18, 'Mengembangkan dan mempertahankan pemahaman tentang lingkungan eksternal perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (400, 18, 'Memahami kondisi saat ini, termasuk lingkungan operasional, arsitektur perusahaan, budaya, dan tantangan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (401, 18, 'Memahami arah dan strategi masa depan perusahaan serta ambisi digitalisasi, mulai dari efisiensi hingga inovasi model bisnis baru.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (402, 18, 'Membuat garis dasar kemampuan dan layanan bisnis serta TI, termasuk layanan eksternal, tata kelola I&T, dan kompetensi TI di seluruh perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (403, 18, 'Merangkum konteks dan arah perusahaan untuk menentukan fokus I&T, seperti digitalisasi proses, teknologi baru, model bisnis digital, dan pengembangan produk digital.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (404, 18, 'Tentukan tujuan dan sasaran I&T tingkat tinggi dan tentukan kontribusinya terhadap tujuan perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (405, 18, 'Evaluasi kebutuhan staf secara berkala atau saat terjadi perubahan besar.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (406, 18, 'Pastikan TI dan bisnis memiliki sumber daya yang cukup untuk mendukung tujuan perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (407, 18, 'Jaga proses rekrutmen dan retensi sesuai kebijakan perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (408, 18, 'Gunakan pengaturan sumber daya fleksibel seperti mutasi, kontraktor eksternal, atau layanan pihak ketiga untuk memenuhi kebutuhan bisnis yang berubah.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (409, 18, 'Sebagai tindakan keamanan, tetapkan pedoman cuti tahunan minimum bagi individu kunci.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (410, 18, 'Ambil tindakan yang tepat saat terjadi perubahan pekerjaan, terutama pemutusan hubungan kerja.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (411, 18, 'Gunakan dokumentasi, perencanaan suksesi, pelatihan silang, dan rotasi pekerjaan untuk mengurangi ketergantungan pada satu orang dalam fungsi kritis.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (412, 18, 'Identifikasi keterampilan yang tersedia dari sumber daya internal dan eksternal.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (413, 18, 'Analisis kesenjangan keterampilan dan buat rencana tindakan, seperti pelatihan, rekrutmen, penempatan ulang, atau strategi pengadaan baru.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (414, 18, 'Gunakan tujuan fungsional dan perusahaan sebagai konteks untuk menetapkan target individu.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (415, 18, 'Tetapkan tujuan individu yang selaras dengan tujuan TI dan perusahaan, berdasarkan prinsip SMART.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (416, 18, 'Berikan umpan balik secara tepat waktu terkait pencapaian target.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (417, 18, 'Ikuti aturan privasi data pribadi selama proses evaluasi karyawan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (418, 18, 'Buat dan pelihara inventaris sumber daya manusia di bidang bisnis dan TI.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (419, 18, 'Terapkan kebijakan dan prosedur untuk staf kontrak.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (420, 18, 'Pastikan kontraktor setuju mematuhi kebijakan pengendalian TI perusahaan (akses, kerahasiaan informasi, dsb).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (421, 18, 'Informasikan bahwa semua penggunaan sumber daya TI dapat dimonitor.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (422, 18, 'Sertakan penjelasan tanggung jawab dan standar dokumentasi dalam kontrak kerja.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (423, 18, 'Tinjau hasil kerja kontraktor dan jadikan dasar pembayaran.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (424, 18, 'Menetapkan standar, praktik, dan prosedur manajemen mutu yang sejalan dengan persyaratan kerangka kerja kontrol I&T dan kriteria dan kebijakan manajemen mutu perusahaan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (425, 18, 'Buatlah platform untuk berbagi praktik-praktik yang baik dan tangkap informasi tentang cacat dan kesalahan untuk memungkinkan pembelajaran dari hal tersebut.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (426, 18, 'Identifikasi pengguna pengetahuan potensial, termasuk pemilik informasi yang harus menyetujui atau memberikan kontribusi.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (427, 18, 'Pertimbangkan jenis konten (kebijakan, aturan, prosedur), artefak (dokumen, suara, video), serta informasi terstruktur dan tidak terstruktur (pakar, media sosial, email).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (428, 18, 'Tetapkan harapan manajemen tentang pentingnya berbagi pengetahuan terkait tata kelola dan manajemen TI.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (429, 18, 'Identifikasi pengguna pengetahuan berdasarkan klasifikasi informasi.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (430, 18, 'Kembangkan dan pelihara prosedur operasional untuk mendukung semua layanan TI.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (431, 18, 'Buat jadwal dan jalankan aktivitas operasional secara konsisten.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (432, 18, 'Catat kejadian/informasi penting. Tentukan tingkat detail informasi yang dicatat berdasarkan risiko dan kinerja.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (433, 18, 'Identifikasi bencana alam atau buatan manusia yang dapat memengaruhi lokasi fasilitas TI. Pastikan peralatan TI dilindungi dari ancaman lingkungan (termasuk peralatan mobile).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (434, 18, 'Terapkan kebijakan yang melarang makan, minum, merokok, serta menyimpan barang yang mudah terbakar di ruang komputer/server.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (435, 18, 'Jaga kebersihan dan keamanan ruang server setiap saat.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (436, 18, 'Identifikasi dan libatkan pemangku kepentingan (manajemen, pemilik proses, pengguna).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (437, 18, 'Komunikasikan tujuan dan kebutuhan monitoring secara konsisten dengan definisi umum (taksonomi, metadata).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (438, 18, 'Selaraskan pendekatan pemantauan dengan alat pelaporan seperti aplikasi business intelligence.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (439, 18, 'Sepakati jenis tujuan dan metrik (kepatuhan, kinerja, nilai, risiko), serta kebijakan penyimpanan data.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (440, 18, 'Alokasikan sumber daya secara efisien dan sesuai dengan kebutuhan monitoring.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (441, 18, 'Secara berkala tinjau kembali bersama para pemangku kepentingan untuk memastikan tidak ada item penting yang terlewat dan bahwa target serta toleransi yang ditetapkan masuk akal.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (442, 18, 'Pastikan tujuan bersifat SMART (Spesifik, Terukur, Dapat Dicapai, Relevan, dan Terikat Waktu).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (443, 18, 'Informasikan perubahan kepada pemangku kepentingan penting seperti bagian hukum, audit, SDM, etika, kepatuhan, dan keuangan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (444, 18, 'Kepada para pengguna informasi untuk memastikan transparansi dan pemahaman bersama.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (445, 18, 'Kumpulkan data dari proses yang sudah ditentukan (otomatis bila memungkinkan).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (446, 18, 'Validasi integritas data (akurasi dan kelengkapan).', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (447, 18, 'Gabungkan data untuk mengukur metrik yang telah disepakati.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (448, 18, 'Tinjau respons manajemen, opsi, dan rekomendasi yang diajukan untuk mengatasi masalah dan penyimpangan besar.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (449, 18, 'Pastikan penugasan tanggung jawab atas tindakan korektif tetap terjaga.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (450, 18, 'Pantau hasil dari setiap tindakan yang telah dilakukan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (451, 18, 'Laporkan hasilnya kepada para pemangku kepentingan.', '2025-08-03 12:22:49', '2025-08-03 12:22:49');
INSERT INTO `questions` VALUES (452, 19, 'Validasi prioritas tujuan manajemen sesuai praktik terbaik industri dan struktur tata kelola yang tepat.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (453, 19, 'Tentukan aturan komunikasi berdasarkan kebutuhan (top-down, bottom-up, horizontal).', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (454, 19, 'Sampaikan tujuan TI secara konsisten, didukung oleh manajemen eksekutif.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (455, 19, 'Pastikan informasi mencakup misi, tujuan layanan, kontrol, etika, kebijakan, dan peran, disesuaikan dengan audiens.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (456, 19, 'Analisis kesenjangan antara model proses yang diinginkan dan praktik saat ini.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (457, 19, 'Tentukan fungsi, peran, dan hak keputusan internal/eksternal, termasuk pihak ketiga.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (458, 19, 'Selaraskan struktur TI dengan arsitektur organisasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (459, 19, 'Bentuk komite pengarah TI untuk pantau proyek, atasi konflik, dan tingkatkan layanan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (460, 19, 'Buat pedoman struktur manajemen, termasuk tujuan, peserta, jadwal, pengawasan, dan hasil rapat.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (461, 19, 'Pastikan peran dijalankan dengan baik, wewenang memadai, dan kinerja dievaluasi sesuai tanggung jawab.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (462, 19, 'Pahami strategi bisnis, model operasional (terpusat, terdistribusi, hybrid), dan kebutuhan sumber daya TI.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (463, 19, 'Identifikasi dan prioritaskan opsi penempatan, model sourcing, dan operasional.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (464, 19, 'Tetapkan dan sepakati posisi fungsi TI dalam organisasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (465, 19, 'Buat panduan klasifikasi data.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (466, 19, 'Inventarisasi sistem dan data beserta pemiliknya.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (467, 19, 'Bedakan dan lindungi data kritis dan nonkritis.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (468, 19, 'Susun kebijakan TI terkait kualitas, keamanan, privasi, dan etika.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (469, 19, 'Terapkan secara konsisten ke seluruh staf.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (470, 19, 'Ukur kematangan digital dari aspek kepemimpinan, risiko teknologi, inovasi, budaya, dan kesiapan perubahan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (471, 19, 'Rinci layanan dan produk TI yang dibutuhkan untuk mencapai tujuan bisnis.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (472, 19, 'Tentukan metode dan pendekatan organisasi (misalnya Agile, Scrum, Waterfall) untuk mencapai tujuan TI.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (473, 19, 'Identifikasi celah dan perubahan untuk mencapai target.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (474, 19, 'Uraikan perubahan besar pada arsitektur perusahaan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (475, 19, 'Tinjau dampaknya terhadap operasional TI, R&D, dan investasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (476, 19, 'Tentukan inisiatif untuk menjembatani kondisi saat ini dan target.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (477, 19, 'Buat road map bertahap untuk mencapai tujuan I&T, termasuk pelatihan, adopsi teknologi baru, dan dukungan perubahan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (478, 19, 'Libatkan mitra eksternal dalam pelaksanaan road map.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (479, 19, 'Kelompokkan proyek dengan sasaran jelas, anggaran, risiko, dan jadwal.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (480, 19, 'Identifikasi ketergantungan, sinergi, dan prioritas antar proyek.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (481, 19, 'Finalisasi road map dengan jadwal dan keterkaitan antar proyek.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (482, 19, 'Tunjuk pemimpin transformasi digital (misal: CDO).', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (483, 19, 'Dapatkan persetujuan dari para pemangku kepentingan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (484, 19, 'Susun rencana komunikasi: isi pesan, audiens, kanal, dan jadwal.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (485, 19, 'Siapkan paket komunikasi yang efektif dengan media yang tersedia.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (486, 19, 'Bangun jaringan internal untuk mendukung dan menjalankan strategi I&T.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (487, 19, 'Lakukan pemeriksaan latar belakang pada staf IT sesuai tingkat risiko fungsinya.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (488, 19, 'Uji secara rutin rencana backup personel penting (siapa yang menggantikan bila staf kunci tidak tersedia).', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (489, 19, 'Tinjau dan sesuaikan materi pelatihan secara berkala sesuai kebutuhan bisnis.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (490, 19, 'Berikan akses ke repositori pengetahuan untuk mendukung pengembangan kompetensi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (491, 19, 'Selenggarakan pelatihan berbasis kebutuhan organisasi, termasuk kontrol internal, etika, dan keamanan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (492, 19, 'Kumpulkan hasil evaluasi kinerja 360 derajat.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (493, 19, 'Susun rencana pengembangan karier dan pelatihan berdasarkan hasil evaluasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (494, 19, 'Terapkan sistem penghargaan yang konsisten sesuai capaian dan kebijakan organisasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (495, 19, 'Jalankan proses disiplin yang jelas dan transparan bila diperlukan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (496, 19, 'Pahami kebutuhan SDM saat ini dan masa depan untuk mendukung tujuan I&T serta operasional harian dan portofolio investasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (497, 19, 'Identifikasi kekurangan tenaga kerja, evaluasi proses rekrutmen, dan buat perencanaan kebutuhan staf berdasarkan data aktual.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (498, 19, 'Pastikan kontrak formal dan jelas, serta mendefinisikan seluruh pekerjaan yang dilakukan oleh pihak eksternal.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (499, 19, 'Terapkan sistem manajemen mutu yang standar, formal, dan berkelanjutan sesuai kebutuhan perusahaan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (500, 19, 'Identifikasi kebutuhan dan kriteria mutu berdasarkan hukum dan pelanggan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (501, 19, 'Tetapkan peran, tugas, dan hak keputusan untuk manajemen mutu.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (502, 19, 'Tentukan kebutuhan pelanggan dan sesuaikan standar I&T. Jelaskan peran untuk penyelesaian konflik antara pelanggan dan IT.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (503, 19, 'Kelola kebutuhan bisnis dan kualitas layanan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (504, 19, 'Komunikasikan kebutuhan pelanggan ke seluruh organisasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (505, 19, 'Integrasikan praktik manajemen mutu ke dalam proses dan solusi utama organisasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (506, 19, 'Pertimbangkan manfaat dan biaya sertifikasi mutu.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (507, 19, 'Komunikasikan pendekatan manajemen mutu secara efektif, misalnya melalui pelatihan formal rutin.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (508, 19, 'Lakukan review kualitas secara rutin untuk proses dan solusi utama organisasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (509, 19, 'Identifikasi proses berkualitas tinggi yang bisa diterapkan ke layanan/proyek lain dan bagikan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (510, 19, 'Temukan penyebab cacat kualitas berulang, nilai dampaknya, dan sepakati tindakan perbaikan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (511, 19, 'Berikan pelatihan metode dan alat perbaikan berkelanjutan kepada karyawan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (512, 19, 'Pastikan rencana implementasi disetujui oleh pemangku kepentingan teknis dan bisnis, serta diaudit jika perlu.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (513, 19, 'Review risiko teknis dan bisnis, dan pastikan risiko utama ditangani dalam perencanaan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (514, 19, 'Buat rencana konversi data yang mencakup pengumpulan, konversi, verifikasi, dan penanganan kesalahan data.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (515, 19, 'Pertimbangkan risiko konversi, rencana kelangsungan bisnis, dan prosedur fallback sesuai kebutuhan risiko dan regulasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (516, 19, 'Tetapkan kriteria keberhasilan yang jelas untuk setiap fase pengujian bersama pemilik proses bisnis dan pemangku kepentingan IT. Tentukan prosedur perbaikan jika kriteria tidak terpenuhi, termasuk langkah lanjut seperti lanjutkan, hentikan, atau tunda implementasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (517, 19, 'Lindungi data dan hasil pengujian dari akses atau kebocoran, serta kelola penyimpanan dan pemusnahan sesuai aturan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (518, 19, 'Pastikan lingkungan pengujian mencerminkan kondisi operasional nyata, termasuk proses bisnis, beban kerja, perangkat lunak, dan infrastruktur.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (519, 19, 'Jaga keamanan lingkungan pengujian agar tidak terhubung dengan sistem produksi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (520, 19, 'Pastikan lingkungan pengujian aman dan tidak dapat berinteraksi dengan sistem produksi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (521, 19, 'Evaluasi hasil pengujian berdasarkan kriteria keberhasilan dan sampaikan secara jelas kepada pemilik proses bisnis dan IT.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (522, 19, 'Dapatkan persetujuan resmi (sign-off) dari pemilik bisnis, pihak ketiga (jika ada), dan pemangku kepentingan IT sebelum implementasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (523, 19, 'Pastikan pengujian dilakukan sesuai rencana oleh tim penguji yang independen dari tim pengembang, melibatkan pemilik proses dan pengguna akhir jika perlu.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (524, 19, 'Lakukan pengujian hanya di lingkungan uji, dengan hasil sesuai kriteria dalam rencana pengujian.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (525, 19, 'Gunakan skrip pengujian yang disetujui untuk memastikan pengujian memenuhi kriteria, termasuk keamanan dan privasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (526, 19, 'Seimbangkan antara pengujian otomatis dan interaktif oleh pengguna.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (527, 19, 'Uji keamanan sistem dan aplikasi, ukur kelemahan, dan evaluasi risiko berdasarkan kejadian terkini.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (528, 19, 'Uji performa sistem, termasuk waktu respon pengguna dan kinerja basis data.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (529, 19, 'Pastikan prosedur fallback dan rollback sudah diperhatikan saat pengujian.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (530, 19, 'Catat, klasifikasikan, dan laporkan semua kesalahan dengan audit trail yang lengkap; komunikasikan hasil ke pemangku kepentingan untuk perbaikan lebih lanjut.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (531, 19, 'Berikan sumber daya tambahan kepada pengguna dan tim dukungan hingga rilis sistem stabil.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (532, 19, 'Sediakan sumber daya sistem I&T tambahan sampai lingkungan operasi stabil.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (533, 19, 'Lakukan prosedur untuk menilai apakah kebutuhan perusahaan terpenuhi, manfaat tercapai, sistem dapat digunakan, ekspektasi pemangku kepentingan terpenuhi, risiko utama terkelola, dan proses perubahan serta instalasi berjalan efektif.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (534, 19, 'Pastikan semua data yang diharapkan diterima dan diproses secara lengkap, akurat, dan tepat waktu. Hasilkan output sesuai kebutuhan perusahaan, dukung proses restart dan pengolahan ulang, serta pastikan pengguna menerima output yang tepat dengan aman dan tepat waktu.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (535, 19, 'Pastikan bahwa kebutuhan perusahaan terkait keamanan proses informasi sesuai dengan kontrak dan SLA (Service Level Agreement) yang dibuat dengan pihak ketiga yang menjadi penyedia atau pengelola layanan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (536, 19, 'Pastikan bahwa kebutuhan operasional bisnis dan proses TI perusahaan serta prioritas dalam penyampaian layanan sesuai dengan kontrak dan SLA dengan pihak ketiga penyedia layanan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (537, 19, 'Integrasikan proses manajemen TI penting internal dengan penyedia layanan dialihdayakan, termasuk perencanaan kapasitas, manajemen perubahan, konfigurasi, insiden, masalah, keamanan, keberlangsungan bisnis, serta pemantauan dan pelaporan kinerja.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (538, 19, 'Kelola daftar aset infrastruktur yang dipantau berdasarkan kritikalitas layanan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (539, 19, 'Terapkan aturan untuk mencatat pelanggaran ambang batas tanpa membanjiri log dengan kejadian kecil.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (540, 19, 'Simpan log kejadian untuk investigasi.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (541, 19, 'Buat tiket insiden segera saat terjadi penyimpangan dari ambang batas.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (542, 19, 'Bangun fasilitas TI untuk mengurangi risiko lingkungan dan terapkan zona keamanan', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (543, 19, 'Cocokkan rencana dengan asuransi dan tangani ketidaksesuaian', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (544, 19, 'Tanggapi alarm, dokumentasi, dan latih staf.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (545, 19, 'Lakukan pemeliharaan TI sesuai jadwal oleh tenaga berwenang', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (546, 19, 'Analisis kebutuhan redundansi sistem.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (547, 19, 'Pastikan kepatuhan terhadap aturan kesehatan dan keselamatan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (548, 19, 'Secara berkala validasi pendekatan monitoring, serta identifikasi pemangku kepentingan, kebutuhan, dan sumber daya baru atau yang berubah.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (549, 19, 'Setujui proses manajemen siklus hidup dan kontrol perubahan untuk monitoring dan pelaporan, termasuk peluang perbaikan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (550, 19, 'Sesuaikan data yang dikumpulkan dengan pendekatan dan tujuan pelaporan perusahaan.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (551, 19, 'Buat laporan kinerja yang ringkas, mudah dipahami, dan sesuai kebutuhan manajemen. Dukung pengambilan keputusan yang cepat dan tepat dengan laporan seperti skor kartu atau indikator warna.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (552, 19, 'Sampaikan laporan kepada pemangku kepentingan terkait.', '2025-08-03 12:30:00', '2025-08-03 12:30:00');
INSERT INTO `questions` VALUES (553, 20, 'Susun peta jalan (road map) untuk menerapkan proses atau aktivitas yang belum tersedia. Gunakan metrik praktik untuk memantau keberhasilan implementasi.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (554, 20, 'Tentukan dan terapkan struktur organisasi. Tinjau secara berkala efektivitas dan kecocokannya.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (555, 20, 'Tetapkan dan komunikasikan kebijakan serta prosedur. Evaluasi dan perbarui setidaknya setiap tahun agar sesuai dengan perubahan lingkungan bisnis atau operasional.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (556, 20, 'Tinjau kinerja komponen kerangka kerja secara berkala dan ambil tindakan yang diperlukan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (557, 20, 'Identifikasi proses bisnis penting berdasarkan kinerja, kepatuhan, dan risiko. Nilai kapabilitas dan tentukan target peningkatan. Analisis kesenjangan serta cari opsi perbaikan atau perancangan ulang proses.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (558, 20, 'Pertimbangkan nilai dari perubahan yang mungkin dilakukan terhadap kapabilitas bisnis dan TI, layanan TI, serta arsitektur perusahaan, termasuk dampaknya jika tidak dilakukan perubahan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (559, 20, 'Perjelas definisi lingkungan target dan siapkan pernyataan nilai yang menjelaskan manfaat dari lingkungan tersebut.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (560, 20, 'Uraikan tujuan menjadi hasil yang terukur dengan metrik (apa) dan target (berapa banyak). Pastikan hasil tersebut mendukung manfaat bagi perusahaan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (561, 20, 'Kumpulkan umpan balik dan perbarui rencana komunikasi serta metode penyampaian sesuai kebutuhan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (562, 20, 'Lakukan peninjauan rutin untuk menilai perkembangan keterampilan dan kompetensi sumber daya internal dan eksternal, serta tinjau rencana suksesi.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (563, 20, 'Simpan data yang memadai mengenai waktu yang digunakan untuk berbagai tugas, layanan, atau proyek.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (564, 20, 'Lakukan peninjauan berkala untuk memastikan staf kontrak telah menandatangani semua perjanjian yang diperlukan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (565, 20, 'Lakukan peninjauan berkala untuk memastikan peran dan hak akses kontraktor sesuai dengan perjanjian.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (566, 20, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (567, 20, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (568, 20, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (569, 20, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (570, 20, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (571, 20, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (572, 20, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (573, 20, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (574, 20, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (575, 20, 'Kumpulkan, susun, dan validasi sumber informasi berdasarkan kriteria seperti keterpahaman, relevansi, integritas, akurasi, konsistensi, kerahasiaan, dan keandalan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (576, 20, 'Ukur penggunaan alat dan elemen pengetahuan serta evaluasi dampaknya pada proses tata kelola.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (577, 20, 'Nilai kegunaan dan relevansi elemen pengetahuan, perbarui informasi yang masih bernilai, dan arsipkan atau hapus informasi yang sudah tidak relevan sesuai kebijakan.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (578, 20, 'Manage the performance and throughput of the scheduled activities.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (579, 20, 'Rencanakan audit independen atas lingkungan operasional penyedia layanan outsourcing untuk memastikan kesesuaian dengan persyaratan yang disepakati.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (580, 20, 'Terapkan prosedur pemantauan log peristiwa dan lakukan tinjauan rutin.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (581, 20, 'Pantau dan rawat perangkat pendeteksi ancaman lingkungan (seperti kebakaran, air, asap, kelembapan) secara berkala.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (582, 20, 'Catat, pantau, dan tangani insiden fasilitas sesuai proses manajemen insiden TIK, serta laporkan insiden sesuai kewajiban hukum.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (583, 20, 'Tinjau perubahan fisik pada lokasi TI untuk menilai ulang risiko lingkungan dan laporkan ke manajemen kontinuitas bisnis dan fasilitas.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (584, 20, 'Gunakan alat dan sistem yang sesuai untuk memproses dan menganalisis data.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (585, 20, 'Analisis penyebab penyimpangan dari target, lakukan tindakan perbaikan, tetapkan tanggung jawab, dan tindak lanjuti. Tinjau penyimpangan secara berkala dan cari akar masalah jika perlu. Dokumentasikan hasil untuk panduan jika masalah terulang.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (586, 20, 'Jika memungkinkan, kaitkan kinerja dan kepatuhan dengan tujuan individu dan sistem penghargaan organisasi.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (587, 20, 'Bandingkan kinerja dengan target internal, tolok ukur internal, dan eksternal (misalnya industri atau pesaing utama).', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (588, 20, 'Analisis tren kinerja dan kepatuhan, lalu ambil tindakan yang tepat.', '2025-08-03 12:34:04', '2025-08-03 12:34:04');
INSERT INTO `questions` VALUES (589, 21, 'Prioritaskan inisiatif perbaikan berdasarkan manfaat dan biaya potensial. Terapkan perbaikan, jadikan sebagai praktik bisnis rutin, dan tetapkan tujuan serta metrik kinerja untuk pemantauan.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (590, 21, 'Tingkatkan efisiensi dan efektivitas melalui pelatihan, dokumentasi, standarisasi, atau otomatisasi proses.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (591, 21, 'Terapkan praktik manajemen mutu untuk memperbarui proses.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (592, 21, 'Hapus komponen tata kelola yang sudah usang (seperti proses, dokumen informasi, kebijakan, dll.).', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (593, 21, 'Tanggapi temuan hasil tinjauan untuk terus meningkatkan sistem manajemen mutu.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (594, 21, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (595, 21, 'Perbaiki informasi dan pengetahuan dalam proses tata kelola yang masih memiliki celah pengetahuan.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (596, 21, 'Pantau insiden dan masalah operasional, ambil tindakan untuk meningkatkan keandalan tugas operasional.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (597, 21, 'Rekomendasikan perubahan pada tujuan dan metrik bila diperlukan.', '2025-08-03 12:34:44', '2025-08-03 12:34:44');
INSERT INTO `questions` VALUES (598, 22, 'Tinjau opsi penyediaan sumber daya TIK (teknologi, keuangan, SDM) sesuai strategi saat ini dan masa depan, serta siapkan kemampuan untuk memenuhi kebutuhan tersebut.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (599, 22, 'Tetapkan prinsip utama alokasi dan pengelolaan sumber daya agar sesuai dengan prioritas dan batas anggaran', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (600, 22, 'Tinjau dan setujui rencana sumber daya serta strategi arsitektur perusahaan untuk memberikan nilai dan mengurangi risiko.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (601, 22, 'Pahami kebutuhan integrasi pengelolaan sumber daya TIK dengan perencanaan keuangan dan SDM perusahaan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (602, 22, 'Tetapkan tanggung jawab dalam pelaksanaan pengelolaan sumber daya.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (603, 22, 'Tetapkan prinsip untuk melindungi dan menjaga sumber daya.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (604, 22, 'Meninjau opsi penyediaan sumber daya TI (teknologi, keuangan, dan SDM) berdasarkan strategi saat ini dan masa depan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (605, 22, 'Menentukan prinsip utama alokasi dan pengelolaan sumber daya sesuai prioritas dan batas anggaran yang disepakati.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (606, 22, 'Meninjau dan menyetujui rencana sumber daya dan strategi arsitektur perusahaan untuk memberikan nilai dan memitigasi risiko.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (607, 22, 'Menyediakan sumber daya yang cukup dan terampil untuk mendukung proses komunikasi', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (608, 22, 'Mengembangkan model proses target tata kelola TI yang spesifik untuk organisasi, berdasarkan pemilihan tujuan manajemen prioritas (output dari kaskade tujuan dan latihan faktor desain).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (609, 22, 'Mengidentifikasi keputusan yang diperlukan untuk pencapaian hasil perusahaan dan strategi TI serta untuk pengelolaan dan pelaksanaan layanan TI.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (610, 22, 'Melibatkan pemangku kepentingan yang sangat penting dalam pengambilan keputusan (akuntabel, bertanggung jawab, dikonsultasikan atau diberi informasi)', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (611, 22, 'Tentukan ruang lingkup, fokus, mandat, dan tanggung jawab setiap fungsi dalam organisasi yang terkait dengan TI, sesuai dengan arahan tata kelola.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (612, 22, 'Menetapkan, menyepakati, dan mengkomunikasikan peran dan tanggung jawab terkait TI untuk semua personel di perusahaan, sesuai dengan kebutuhan dan tujuan bisnis. Menggambarkan dengan jelas tanggung jawab dan akuntabilitas, terutama untuk pengambilan keputusan dan persetujuan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (613, 22, 'Pertimbangkan persyaratan dari perusahaan dan kesinambungan layanan TI saat mendefinisikan peran, termasuk cadangan staf dan persyaratan pelatihan silang.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (614, 22, 'Memberikan masukan pada proses kesinambungan layanan TI dengan menjaga informasi kontak dan deskripsi peran terkini di perusahaan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (615, 22, 'Sertakan persyaratan khusus dalam deskripsi peran dan tanggung jawab mengenai kepatuhan terhadap kebijakan dan prosedur manajemen , kode etik, dan praktik-praktik profesional.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (616, 22, 'Memastikan bahwa akuntabilitas didefinisikan melalui peran dan tanggung jawab.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (617, 22, 'Menyusun peran dan tanggung jawab untuk mengurangi kemungkinan adanya peran tunggal yang membahayakan proses penting.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (618, 22, 'Mengidentifikasi keterampilan dan kompetensi yang diperlukan untuk mencapai tujuan manajemen yang dipilih.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (619, 22, 'Menganalisis kesenjangan antara keterampilan dan kemampuan target untuk perusahaan dan keterampilan tenaga kerja saat ini', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (620, 22, 'Mengidentifikasi tujuan manajemen prioritas yang dapat dicapai dengan mengotomatisasi layanan, aplikasi, atau infrastruktur.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (621, 22, 'Pilih dan terapkan alat yang paling tepat dan komunikasikan kepada para pemangku kepentingan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (622, 22, 'Memberikan pelatihan tentang alat yang dipilih, sesuai kebutuhan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (623, 22, 'Menilai layanan TI saat ini dan tingkat layanan untuk mengidentifikasi kesenjangan antara layanan yang ada dan aktivitas bisnis yang didukung.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (624, 22, 'Menganalisis dan memperkirakan permintaan masa depan serta mengonfirmasi kapasitas layanan TI yang ada.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (625, 22, 'Mempublikasikan dalam katalog layanan TI aktif, paket layanan, dan opsi tingkat layanan dari portofolio', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (626, 22, 'Menganalisis kebutuhan untuk perjanjian layanan baru atau yang berubah dari manajemen hubungan bisnis agar dapat disesuaikan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (627, 22, 'Menyusun draf perjanjian layanan pelanggan berdasarkan layanan, paket layanan, dan opsi tingkat layanan dalam katalog.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (628, 22, 'Finalisasi perjanjian layanan pelanggan bersama manajemen hubungan bisnis.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (629, 22, 'Tinjau semua RFI dan RFP untuk memastikan persyaratan telah didefinisikan dengan jelas, termasuk keamanan informasi, kebutuhan operasional, dan prioritas layanan, serta mencantumkan prosedur klarifikasi, waktu penyusunan proposal, kriteria penilaian, dan proses keputusan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (630, 22, 'Mengevaluasi RFI dan RFP sesuai proses dan kriteria evaluasi yang telah disetujui serta mendokumentasikan bukti evaluasi.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (631, 22, 'Memilih vendor terbaik sesuai RFP, mendokumentasikan dan mengomunikasikan keputusan, serta menandatangani kontrak.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (632, 22, 'Tetapkan standar dan prosedur manajemen mutu sesuai dengan kerangka kerja I&T dan kebijakan mutu perusahaan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (633, 22, 'Buat platform berbagi praktik baik dan informasi kesalahan untuk pembelajaran.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (634, 22, 'Pertimbangkan kebutuhan pelanggan, prioritas bisnis, tujuan, dampak anggaran, penggunaan sumber daya, kemampuan TI, dan tren industri.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (635, 22, 'Identifikasi layanan/solusi kritis dalam proses manajemen ketersediaan dan kapasitas.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (636, 22, 'Sediakan laporan kapasitas untuk proses penganggaran.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (637, 22, 'Gunakan permintaan perubahan formal melalui proses manajemen perubahan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (638, 22, 'Kategorikan perubahan berdasarkan jenis dan item konfigurasi yang terdampak.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (639, 22, 'Prioritaskan berdasarkan kebutuhan bisnis, teknis, dan kepatuhan hukum.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (640, 22, 'Dapatkan persetujuan formal dari pihak terkait; tetapkan perubahan standar untuk kasus yang umum dan berisiko rendah.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (641, 22, 'Rencanakan dan jadwalkan perubahan yang disetujui.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (642, 22, 'Tentukan kriteria perubahan darurat.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (643, 22, 'Pastikan ada prosedur terdokumentasi untuk menyatakan, menilai, menyetujui awal, mengotorisasi, dan mencatat perubahan darurat.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (644, 22, 'Pastikan perubahan dicatat dalam dokumentasi manajemen, seperti prosedur operasional bisnis dan TI, dokumentasi pemulihan bencana, konfigurasi, aplikasi, bantuan, dan materi pelatihan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (645, 22, 'Kembangkan dan pelihara prosedur operasional untuk mendukung semua layanan TI.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (646, 22, 'Buat jadwal dan jalankan aktivitas operasional secara konsisten.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (647, 22, 'Catat kejadian/informasi penting. Tentukan tingkat detail informasi yang dicatat berdasarkan risiko dan kinerja.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (648, 22, 'Identifikasi bencana alam atau buatan manusia yang dapat memengaruhi lokasi fasilitas TI. Pastikan peralatan TI dilindungi dari ancaman lingkungan (termasuk peralatan mobile).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (649, 22, 'Terapkan kebijakan yang melarang makan, minum, merokok, serta menyimpan barang yang mudah terbakar di ruang komputer/server.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (650, 22, 'Jaga kebersihan dan keamanan ruang server setiap saat.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (651, 22, 'Tinjau kebutuhan perlindungan fasilitas TI terhadap fluktuasi dan pemadaman listrik, serta sesuaikan dengan rencana kesinambungan bisnis. Sediakan peralatan catu daya tak terputus yang sesuai (misalnya baterai, generator)', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (652, 22, 'Uji secara rutin mekanisme UPS dan pastikan perpindahan daya tidak mengganggu operasional bisnis.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (653, 22, 'Pastikan fasilitas TI memiliki lebih dari satu sumber utilitas penting (listrik, telekomunikasi, air, gas) dengan jalur masuk fisik yang terpisah.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (654, 22, 'Pastikan kabel di luar lokasi TI berada di bawah tanah atau memiliki perlindungan lain yang memadai. Di dalam lokasi, kabel harus berada dalam saluran aman dan hanya dapat diakses oleh personel berwenang', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (655, 22, 'Susun dan dokumentasikan kabel serta sambungan fisik (data dan telepon) secara terstruktur.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (656, 22, 'Berikan pelatihan rutin kepada personel tentang hukum, regulasi, dan pedoman keselamatan kerja, termasuk latihan evakuasi kebakaran.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (657, 22, 'Catat semua permintaan layanan dan insiden beserta informasi relevan untuk penanganan yang efektif dan pencatatan historis.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (658, 22, 'Klasifikasikan permintaan layanan dan insiden berdasarkan tipe dan kategori guna analisis tren.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (659, 22, 'Prioritaskan permintaan layanan dan insiden berdasarkan dampak bisnis dan urgensi sesuai definisi SLA.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (660, 22, 'Verifikasi hak atas permintaan layanan menggunakan alur proses dan perubahan standar yang telah ditentukan, jika memungkinkan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (661, 22, 'Dapatkan persetujuan finansial dan fungsional (atau persetujuan yang telah ditentukan) untuk perubahan standar yang disepakati, jika diperlukan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (662, 22, 'Identifikasi dan jelaskan gejala yang relevan untuk menentukan kemungkinan penyebab insiden. Gunakan sumber pengetahuan yang tersedia (termasuk error dan masalah yang telah diketahui) untuk menemukan solusi sementara atau permanen.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (663, 22, 'Jika tidak ada masalah atau error terkait, dan insiden memenuhi kriteria yang telah disepakati, catat sebagai masalah baru.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (664, 22, 'Alihkan insiden ke tim spesialis jika diperlukan keahlian lebih dalam, serta libatkan manajemen sesuai kebutuhan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (665, 22, 'Pilih dan terapkan solusi insiden yang paling sesuai (solusi sementara dan/atau permanen).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (666, 22, 'Catat jika solusi sementara (workaround) digunakan dalam penyelesaian insiden.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (667, 22, 'Lakukan tindakan pemulihan jika diperlukan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (668, 22, 'Dokumentasikan penyelesaian insiden dan evaluasi apakah dapat dijadikan referensi di masa depan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (669, 22, 'Verifikasi dengan pengguna terkait bahwa permintaan layanan telah dipenuhi atau insiden telah diselesaikan dengan memuaskan dan dalam waktu yang disepakati/dapat diterima.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (670, 22, 'Tutup permintaan layanan dan insiden.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (671, 22, 'Pantau dan lacak eskalasi insiden, penyelesaiannya, serta proses penanganan permintaan untuk memastikan progres menuju penyelesaian.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (672, 22, 'Identifikasi masalah dengan mengkorelasikan laporan insiden, log error, dan sumber lainnya.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (673, 22, 'Tangani semua masalah secara formal dengan akses ke data relevan, termasuk data dari sistem manajemen perubahan, konfigurasi, aset, dan insiden TI.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (674, 22, 'Tentukan grup pendukung yang sesuai (misalnya hardware, jaringan, software, aplikasi) untuk membantu identifikasi masalah, analisis akar penyebab, dan penentuan solusi.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (675, 22, 'Tetapkan prioritas masalah bersama bisnis berdasarkan dampak dan urgensi, sesuai SLA yang disepakati.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (676, 22, 'Laporkan status masalah yang teridentifikasi ke service desk agar pengguna dan manajemen TI tetap terinformasi.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (677, 22, 'Simpan katalog manajemen masalah tunggal untuk pencatatan, pelaporan, dan audit, termasuk status tiap masalah (terbuka, dibuka ulang, dalam proses, atau ditutup).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (678, 22, 'Segera setelah akar penyebab masalah ditemukan, buat catatan error yang diketahui dan kembangkan solusi sementara yang sesuai.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (679, 22, 'Tutup catatan masalah setelah konfirmasi penghapusan error yang diketahui atau setelah kesepakatan dengan bisnis tentang penanganan alternatif.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (680, 22, 'Informasikan ke service desk jadwal penutupan masalah (misalnya jadwal perbaikan error, solusi sementara, atau penanganan hingga perubahan diterapkan) dan dampak yang timbul. Beri tahu pengguna dan pelanggan yang terdampak sesuai kebutuhan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (681, 22, 'Identifikasi dan libatkan pemangku kepentingan (manajemen, pemilik proses, pengguna).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (682, 22, 'Komunikasikan tujuan dan kebutuhan monitoring secara konsisten dengan definisi umum (taksonomi, metadata).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (683, 22, 'Selaraskan pendekatan pemantauan dengan alat pelaporan seperti aplikasi business intelligence.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (684, 22, 'Sepakati jenis tujuan dan metrik (kepatuhan, kinerja, nilai, risiko), serta kebijakan penyimpanan data.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (685, 22, 'Alokasikan sumber daya secara efisien dan sesuai dengan kebutuhan monitoring.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (686, 22, 'Secara berkala tinjau kembali bersama para pemangku kepentingan untuk memastikan tidak ada item penting yang terlewat dan bahwa target serta toleransi yang ditetapkan masuk akal.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (687, 22, 'Pastikan tujuan bersifat SMART (Spesifik, Terukur, Dapat Dicapai, Relevan, dan Terikat Waktu).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (688, 22, 'Informasikan perubahan kepada pemangku kepentingan penting seperti bagian hukum, audit, SDM, etika, kepatuhan, dan keuangan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (689, 22, 'kepada para pengguna informasi untuk memastikan transparansi dan pemahaman bersama.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (690, 22, 'Kumpulkan data dari proses yang sudah ditentukan (otomatis bila memungkinkan).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (691, 22, 'Validasi integritas data (akurasi dan kelengkapan).', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (692, 22, 'Gabungkan data untuk mengukur metrik yang telah disepakati.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (693, 22, 'Tinjau respons manajemen, opsi, dan rekomendasi yang diajukan untuk mengatasi masalah dan penyimpangan besar.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (694, 22, 'Pastikan penugasan tanggung jawab atas tindakan korektif tetap terjaga.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (695, 22, 'Pantau hasil dari setiap tindakan yang telah dilakukan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (696, 22, 'Laporkan hasilnya kepada para pemangku kepentingan.', '2025-08-03 12:44:20', '2025-08-03 12:44:20');
INSERT INTO `questions` VALUES (697, 23, 'Menetapkan prinsip-prinsip untuk pengelolaan dan pengendalian arsitektur perusahaan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (698, 23, 'Mengkomunikasikan dan mendorong penerapan strategi manajemen sumber daya, prinsip-prinsip, dan rencana sumber daya yang telah disepakati serta strategi arsitektur perusahaan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (699, 23, 'Menyelaraskan manajemen sumber daya dengan perencanaan keuangan dan SDM perusahaan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (700, 23, 'Validasi prioritas tujuan manajemen sesuai praktik terbaik industri dan struktur tata kelola yang tepat.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (701, 23, 'Tentukan aturan komunikasi berdasarkan kebutuhan (top-down, bottom-up, horizontal).', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (702, 23, 'Sampaikan tujuan TI secara konsisten, didukung oleh manajemen eksekutif.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (703, 23, 'Pastikan informasi mencakup misi, tujuan layanan, kontrol, etika, kebijakan, dan peran, disesuaikan dengan audiens.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (704, 23, 'Analisis kesenjangan antara model proses yang diinginkan dan praktik saat ini.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (705, 23, 'Tentukan fungsi, peran, dan hak keputusan internal/eksternal, termasuk pihak ketiga.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (706, 23, 'Selaraskan struktur TI dengan arsitektur organisasi.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (707, 23, 'Bentuk komite pengarah TI untuk pantau proyek, atasi konflik, dan tingkatkan layanan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (708, 23, 'Buat pedoman struktur manajemen, termasuk tujuan, peserta, jadwal, pengawasan, dan hasil rapat.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (709, 23, 'Pastikan peran dijalankan dengan baik, wewenang memadai, dan kinerja dievaluasi sesuai tanggung jawab.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (710, 23, 'Pahami strategi bisnis, model operasional (terpusat, terdistribusi, hybrid), dan kebutuhan sumber daya TI.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (711, 23, 'Identifikasi dan prioritaskan opsi penempatan, model sourcing, dan operasional.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (712, 23, 'Tetapkan dan sepakati posisi fungsi TI dalam organisasi.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (713, 23, 'Buat panduan klasifikasi data.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (714, 23, 'Inventarisasi sistem dan data beserta pemiliknya.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (715, 23, 'Bedakan dan lindungi data kritis dan nonkritis.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (716, 23, 'Susun kebijakan TI terkait kualitas, keamanan, privasi, dan etika.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (717, 23, 'Terapkan secara konsisten ke seluruh staf.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (718, 23, 'Menganalisis aktivitas proses bisnis untuk mengidentifikasi kebutuhan akan layanan TI yang baru atau yang didesain ulang.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (719, 23, 'Bandingkan kebutuhan yang teridentifikasi dengan komponen layanan yang sudah ada dalam portofolio.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (720, 23, 'Tinjau portofolio layanan I&T secara teratur dengan manajemen portofolio dan manajemen hubungan bisnis', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (721, 23, 'Terus memastikan bahwa komponen layanan dalam portofolio dan katalog layanan terkait sudah lengkap dan terkini.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (722, 23, 'Menginformasikan kepada manajemen hubungan bisnis mengenai setiap pembaruan pada katalog layanan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (723, 23, 'Menentukan, menyetujui, dan mendokumentasikan perjanjian operasional internal untuk mendukung perjanjian layanan pelanggan, jika berlaku.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (724, 23, 'Berhubungan dengan manajemen pemasok untuk memastikan bahwa kontrak komersial yang sesuai dengan penyedia layanan eksternal', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (725, 23, 'Tinjau perjanjian layanan secara teratur sesuai dengan persyaratan yang telah disepakati untuk memastikan bahwa perjanjian tersebut efektif dan terkini', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (726, 23, 'Terus memindai lanskap perusahaan untuk mencari mitra dan vendor baru yang dapat memberikan kemampuan yang saling melengkapi dan mendukung realisasi strategi TI, peta jalan, dan tujuan perusahaan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (727, 23, 'Menetapkan dan mempertahankan kriteria yang berkaitan dengan jenis, signifikansi, dan kekritisan vendor dan kontrak vendor, sehingga memungkinkan fokus pada vendor yang disukai dan penting.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (728, 23, 'Mengidentifikasi, mencatat, dan mengkategorikan vendor dan kontrak yang ada sesuai dengan kriteria yang ditetapkan untuk mempertahankan daftar vendor pilihan yang perlu dikelola', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (729, 23, 'Dalam kasus khusus akuisisi perangkat lunak, cantumkan dan tegakkan hak dan kewajiban semua pihak dalam persyaratan kontrak', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (730, 23, 'Dalam kasus khusus akuisisi sumber daya pengembangan, cantumkan dan tegakkan hak dan kewajiban semua pihak dalam persyaratan kontrak', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (731, 23, 'Mendapatkan nasihat hukum tentang perjanjian akuisisi pengembangan sumber daya terkait kepemilikan dan perizinan KI.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (732, 23, 'Dalam kasus khusus akuisisi infrastruktur, fasilitas, dan layanan terkait, sertakan dan tegakkan hak dan kewajiban semua pihak dalam persyaratan kontrak', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (733, 23, 'Menetapkan pemilik hubungan untuk semua vendor dan membuat mereka bertanggung jawab atas kualitas layanan yang diberikan', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (734, 23, 'Menyetujui, mengelola, memelihara, dan memperbarui kontrak formal dengan vendor. Memastikan bahwa kontrak sesuai dengan standar perusahaan dan persyaratan hukum dan peraturan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (735, 23, 'Mencantumkan ketentuan dalam kontrak dengan vendor layanan utama untuk peninjauan lokasi vendor serta praktik dan kontrol internal oleh manajemen atau pihak ketiga yang independen', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (736, 23, 'Menyetujui audit independen dan kontrol jaminan atas lingkungan operasional vendor yang menyediakan layanan alih daya untuk mengonfirmasi bahwa persyaratan yang disepakati telah ditangani secara memadai.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (737, 23, 'Gunakan prosedur yang telah ditetapkan untuk menangani perselisihan kontrak', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (738, 23, 'Tentukan dan rumuskan peran dan tanggung jawab untuk setiap vendor layanan', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (739, 23, 'Saat menyiapkan kontrak, sediakan potensi risiko layanan dengan mendefinisikan persyaratan layanan secara jelas, termasuk perjanjian escrow perangkat lunak, vendor alternatif, atau perjanjian siaga untuk memitigasi kemungkinan kegagalan vendor', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (740, 23, 'Meminta tinjauan independen atas praktik dan kontrol internal vendor, jika perlu.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (741, 23, 'Terapkan sistem manajemen mutu yang standar, formal, dan berkelanjutan sesuai kebutuhan perusahaan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (742, 23, 'Identifikasi kebutuhan dan kriteria mutu berdasarkan hukum dan pelanggan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (743, 23, 'Tetapkan peran, tugas, dan hak keputusan untuk manajemen mutu.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (744, 23, 'Tentukan kebutuhan pelanggan dan sesuaikan standar I&T. Jelaskan peran untuk penyelesaian konflik antara pelanggan dan IT.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (745, 23, 'Kelola kebutuhan bisnis dan kualitas layanan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (746, 23, 'Komunikasikan kebutuhan pelanggan ke seluruh organisasi.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (747, 23, 'Integrasikan praktik manajemen mutu ke dalam proses dan solusi utama organisasi.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (748, 23, 'Pertimbangkan manfaat dan biaya sertifikasi mutu.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (749, 23, 'Komunikasikan pendekatan manajemen mutu secara efektif, misalnya melalui pelatihan formal rutin.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (750, 23, 'Lakukan review kualitas secara rutin untuk proses dan solusi utama organisasi.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (751, 23, 'Identifikasi proses berkualitas tinggi yang bisa diterapkan ke layanan/proyek lain dan bagikan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (752, 23, 'Temukan penyebab cacat kualitas berulang, nilai dampaknya, dan sepakati tindakan perbaikan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (753, 23, 'Berikan pelatihan metode dan alat perbaikan berkelanjutan kepada karyawan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (754, 23, 'Mengidentifikasi dan menindaklanjuti semua insiden yang disebabkan oleh kinerja atau kapasitas yang tidak memadai.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (755, 23, 'Memetakan solusi atau layanan yang dipilih ke aplikasi dan infrastruktur (TI dan fasilitas) yang menjadi sandarannya agar dapat fokus pada sumber daya penting untuk perencanaan ketersediaan.', '2025-08-03 12:52:51', '2025-08-03 12:52:51');
INSERT INTO `questions` VALUES (756, 23, 'Mengidentifikasi implikasi ketersediaan dan kapasitas dari perubahan kebutuhan bisnis dan peluang peningkatan. Gunakan teknik pemodelan untuk memvalidasi rencana ketersediaan, kinerja, dan kapasitas.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (757, 23, 'Menetapkan proses pengumpulan data untuk memberikan informasi pemantauan dan pelaporan kepada manajemen mengenai ketersediaan, kinerja, dan beban kerja kapasitas semua sumber daya yang terkait dengan TI.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (758, 23, 'Dapatkan panduan dari manual produk vendor untuk memastikan tingkat ketersediaan kinerja yang sesuai untuk pemrosesan puncak dan beban kerja.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (759, 23, 'Menetapkan prosedur eskalasi untuk penyelesaian cepat jika terjadi masalah kapasitas dan kinerja darurat.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (760, 23, 'Nilai dan rencanakan perubahan secara terstruktur dengan analisis dampak pada bisnis, sistem, dan penyedia layanan. Pertimbangkan risiko, keamanan, hukum, dan keterkaitan perubahan. Libatkan pemilik proses bisnis bila perlu.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (761, 23, 'Perhatikan juga dampak pada layanan kontrak dan integrasikan dengan manajemen perubahan penyedia.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (762, 23, 'Pastikan akses darurat untuk perubahan sudah diotorisasi, tercatat, dan dicabut setelah selesai.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (763, 23, 'Tentukan periode retensi yang tepat untuk dokumentasi perubahan dan dokumentasi sistem dan pengguna sebelum dan sesudah perubahan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (764, 23, 'Lakukan review dokumen dengan tingkat yang sama seperti perubahan itu sendiri.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (765, 23, 'Pastikan semua data yang diharapkan diterima dan diproses secara lengkap, akurat, dan tepat waktu. Hasilkan output sesuai kebutuhan perusahaan, dukung proses restart dan pengolahan ulang, serta pastikan pengguna menerima output yang tepat dengan aman dan tepat waktu.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (766, 23, 'Pastikan bahwa kebutuhan perusahaan terkait keamanan proses informasi sesuai dengan kontrak dan SLA (Service Level Agreement) yang dibuat dengan pihak ketiga yang menjadi penyedia atau pengelola layanan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (767, 23, 'Pastikan bahwa kebutuhan operasional bisnis dan proses TI perusahaan serta prioritas dalam penyampaian layanan sesuai dengan kontrak dan SLA dengan pihak ketiga penyedia layanan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (768, 23, 'Integrasikan proses manajemen TI penting internal dengan penyedia layanan dialihdayakan, termasuk perencanaan kapasitas, manajemen perubahan, konfigurasi, insiden, masalah, keamanan, keberlangsungan bisnis, serta pemantauan dan pelaporan kinerja.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (769, 23, 'Kelola daftar aset infrastruktur yang dipantau berdasarkan kritikalitas layanan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (770, 23, 'Terapkan aturan untuk mencatat pelanggaran ambang batas tanpa membanjiri log dengan kejadian kecil.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (771, 23, 'Simpan log kejadian untuk investigasi.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (772, 23, 'Buat tiket insiden segera saat terjadi penyimpangan dari ambang batas.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (773, 23, 'Bangun fasilitas TI untuk mengurangi risiko lingkungan dan terapkan zona keamanan', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (774, 23, 'Cocokkan rencana dengan asuransi dan tangani ketidaksesuaian', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (775, 23, 'Tanggapi alarm, dokumentasi, dan latih staf.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (776, 23, 'Lakukan pemeliharaan TI sesuai jadwal oleh tenaga berwenang', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (777, 23, 'Analisis kebutuhan redundansi sistem.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (778, 23, 'Pastikan kepatuhan terhadap aturan kesehatan dan keselamatan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (779, 23, 'Tentukan skema klasifikasi dan prioritas insiden serta permintaan layanan, serta kriteria pendaftaran masalah, untuk memastikan penanganan konsisten, pemberitahuan ke pengguna, dan analisis tren.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (780, 23, 'Tentukan model insiden untuk error yang diketahui agar penyelesaian lebih cepat dan efektif.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (781, 23, 'Tentukan model permintaan layanan berdasarkan jenisnya untuk mendukung layanan mandiri dan efisiensi layanan standar.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (782, 23, 'Tentukan aturan dan prosedur eskalasi insiden, khususnya untuk insiden besar dan insiden keamanan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (783, 23, 'Tentukan sumber pengetahuan terkait insiden dan permintaan serta cara penggunaannya.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (784, 23, 'Penuhi permintaan dengan menjalankan prosedur yang dipilih. Jika memungkinkan, gunakan menu otomatis mandiri dan model permintaan yang telah ditentukan untuk item yang sering diminta.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (785, 23, 'Identifikasi pemangku kepentingan informasi beserta kebutuhan data atau laporan mereka. Tentukan frekuensi dan media pelaporan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (786, 23, 'Identifikasi masalah sebagai error dikenal dengan membandingkan data insiden dan database error.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (787, 23, 'Hubungkan item konfigurasi yang terdampak dengan error dikenal.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (788, 23, 'Laporkan kemajuan penyelesaian dan pantau dampak masalah selama siklus hidupnya.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (789, 23, 'Evaluasi dan prioritaskan solusi error dikenal melalui manajemen perubahan TI berdasarkan biaya-manfaat, dampak, dan urgensi.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (790, 23, 'Dapatkan laporan rutin dari manajemen perubahan TI tentang progres penyelesaian masalah dan error.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (791, 23, 'Kumpulkan info masalah terkait perubahan dan insiden TI, komunikasikan ke pemangku kepentingan lewat laporan dan rapat berkala antar pemilik proses.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (792, 23, 'Pastikan pemilik dan manajer proses insiden, masalah, perubahan, dan konfigurasi rutin bertemu untuk bahas masalah dan rencana perubahan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (793, 23, 'Identifikasi dan mulai solusi permanen atas akar masalah, ajukan permintaan perubahan lewat proses manajemen perubahan.', '2025-08-03 12:52:52', '2025-08-03 12:52:52');
INSERT INTO `questions` VALUES (794, 24, 'Secara berkala validasi pendekatan monitoring, serta identifikasi pemangku kepentingan, kebutuhan, dan sumber daya baru atau yang berubah.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (795, 24, 'Setujui proses manajemen siklus hidup dan kontrol perubahan untuk monitoring dan pelaporan, termasuk peluang perbaikan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (796, 24, 'Sesuaikan data yang dikumpulkan dengan pendekatan dan tujuan pelaporan perusahaan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (797, 24, 'Buat laporan kinerja yang ringkas, mudah dipahami, dan sesuai kebutuhan manajemen. Dukung pengambilan keputusan yang cepat dan tepat dengan laporan seperti skor kartu atau indikator warna.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (798, 24, 'Sampaikan laporan kepada pemangku kepentingan terkait.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (799, 24, 'Identifikasi proses bisnis penting berdasarkan kinerja, kepatuhan, dan risiko. Nilai kapabilitas dan tentukan target peningkatan. Analisis kesenjangan serta cari opsi perbaikan atau perancangan ulang proses.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (800, 24, 'Jika memungkinkan, sesuaikan permintaan dengan paket layanan dan ciptakan layanan standar untuk mendapatkan efisiensi secara keseluruhan', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (801, 24, 'Menetapkan dan memelihara langkah-langkah untuk memantau dan mengumpulkan data tingkat layanan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (802, 24, 'Mengevaluasi kinerja dan memberikan pelaporan rutin dan formal mengenai kinerja perjanjian layanan, termasuk penyimpangan dari nilai yang telah disepakati.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (803, 24, 'Melakukan tinjauan rutin untuk memperkirakan dan mengidentifikasi tren kinerja tingkat layanan', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (804, 24, 'Menyediakan informasi manajemen yang sesuai untuk membantu manajemen kinerja.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (805, 24, 'Menyetujui rencana tindakan dan remediasi untuk setiap masalah kinerja atau tren negatif', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (806, 24, 'Jika diperlukan, revisi perjanjian layanan yang ada dengan penyedia layanan. Menyetujui dan memperbarui perjanjian operasional internal.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (807, 24, 'Establish and maintain vendor and contract evaluation criteria to enable overall review and comparison of vendor performance in a consistent way.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (808, 24, 'Mengevaluasi efektivitas hubungan dan mengidentifikasi perbaikan yang diperlukan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (809, 24, 'Mengidentifikasi, memantau dan, jika perlu, mengelola risiko yang berkaitan dengan kemampuan vendor untuk memberikan layanan secara efisien, efektif, aman, rahasia, andal, dan berkelanjutan', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (810, 24, 'Menilai ekosistem yang lebih besar dari vendor dan mengidentifikasi, memantau, dan, jika perlu, mengelola risiko yang terkait dengan subkontraktor dan vendor hulu yang memengaruhi kemampuan vendor untuk memberikan layanan secara efisien, efektif, aman, andal, dan berkelanjutan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (811, 24, 'Tentukan dan dokumentasikan kriteria untuk memantau kinerja vendor yang selaras dengan perjanjian tingkat layanan', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (812, 24, 'Memantau dan meninjau pemberian layanan untuk memastikan bahwa vendor memberikan kualitas layanan yang dapat diterima, memenuhi persyaratan, dan mematuhi ketentuan kontrak.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (813, 24, 'Tinjau kinerja vendor dan nilai uang. Memastikan bahwa vendor dapat diandalkan dan kompetitif, dibandingkan dengan vendor alternatif dan kondisi pasar.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (814, 24, 'Memantau dan mengevaluasi informasi yang tersedia secara eksternal tentang vendor dan rantai pasokan vendor.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (815, 24, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (816, 24, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (817, 24, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (818, 24, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (819, 24, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (820, 24, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (821, 24, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (822, 24, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (823, 24, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (824, 24, 'Memantau kinerja aktual dan penggunaan kapasitas terhadap ambang batas yang ditentukan, didukung, jika perlu, dengan perangkat lunak otomatis.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (825, 24, 'Secara teratur mengevaluasi tingkat kinerja saat ini untuk semua tingkat pemrosesan (permintaan bisnis, kapasitas layanan, dan kapasitas sumber daya) dengan membandingkannya dengan tren dan SLA. Mempertimbangkan perubahan lingkungan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (826, 24, 'Gunakan alat pemodelan yang membantu memprediksi kegagalan berdasarkan tren penggunaan di masa lalu dan ekspektasi manajemen terhadap lingkungan atau kondisi pengguna yang baru.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (827, 24, 'Berdasarkan data yang terkumpul, buat skenario yang menggambarkan situasi ketersediaan di masa depan untuk menggambarkan berbagai tingkat kapasitas potensial yang diperlukan untuk mencapai tujuan kinerja ketersediaan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (828, 24, 'Berdasarkan skenario, tentukan kemungkinan bahwa tujuan kinerja ketersediaan tidak akan tercapai', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (829, 24, 'Tentukan dampak dari skenario pada ukuran kinerja bisnis (misalnya, pendapatan, laba, layanan pelanggan). Libatkan pimpinan lini bisnis, fungsional (terutama keuangan) dan regional untuk memahami evaluasi dampaknya.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (830, 24, 'Pastikan bahwa pemilik proses bisnis sepenuhnya memahami dan menyetujui hasil analisis ini. Dari pemilik bisnis, dapatkan daftar skenario risiko yang tidak dapat diterima yang memerlukan tanggapan untuk mengurangi risiko ke tingkat yang dapat diterima.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (831, 24, 'Tinjau ketersediaan dan implikasi kapasitas dari analisis tren layanan', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (832, 24, 'Pastikan bahwa manajemen melakukan perbandingan antara permintaan aktual terhadap sumber daya dengan perkiraan pasokan dan permintaan untuk mengevaluasi teknik peramalan saat ini dan melakukan perbaikan jika memungkinkan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (833, 24, 'Menyediakan pelaporan hasil secara teratur dalam bentuk yang sesuai untuk ditinjau oleh manajemen TI dan bisnis serta komunikasi kepada manajemen perusahaan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (834, 24, 'Mengintegrasikan kegiatan pemantauan dan pelaporan dalam kegiatan manajemen kapasitas yang berulang (pemantauan, analisis, penyetelan, dan implementasi).', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (835, 24, 'Pantau semua perubahan darurat dan lakukan tinjauan pasca-implementasi bersama pihak terkait. Tinjauan harus mengidentifikasi dan memperbaiki akar masalah seperti proses bisnis, pengembangan aplikasi, lingkungan pengujian, dokumentasi, dan integritas data.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (836, 24, 'Kategorikan permintaan perubahan (ditolak, disetujui namun belum dimulai, sedang diproses, dan selesai).', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (837, 24, 'Buat laporan status perubahan dengan metrik kinerja untuk mendukung evaluasi dan pemantauan manajemen. Pastikan laporan ini membentuk jejak audit lengkap dari awal hingga selesai.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (838, 24, 'Pantau perubahan yang masih terbuka agar setiap perubahan diselesaikan tepat waktu sesuai prioritas.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (839, 24, 'Jaga sistem pelacakan dan pelaporan untuk seluruh permintaan perubahan.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (840, 24, 'Manage the performance and throughput of the scheduled activities.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (841, 24, 'Rencanakan audit independen atas lingkungan operasional penyedia layanan outsourcing untuk memastikan kesesuaian dengan persyaratan yang disepakati.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (842, 24, 'Terapkan prosedur pemantauan log peristiwa dan lakukan tinjauan rutin.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (843, 24, 'Pantau dan rawat perangkat pendeteksi ancaman lingkungan (seperti kebakaran, air, asap, kelembapan) secara berkala.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (844, 24, 'Catat, pantau, dan tangani insiden fasilitas sesuai proses manajemen insiden TIK, serta laporkan insiden sesuai kewajiban hukum.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (845, 24, 'Tinjau perubahan fisik pada lokasi TI untuk menilai ulang risiko lingkungan dan laporkan ke manajemen kontinuitas bisnis dan fasilitas.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (846, 24, 'Menghasilkan dan mendistribusikan laporan yang tepat waktu atau menyediakan akses terkontrol ke data online.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (847, 24, 'Menganalisis insiden dan permintaan layanan berdasarkan kategori dan jenisnya. Menetapkan tren dan mengidentifikasi pola masalah yang berulang, pelanggaran SLA, atau inefisiensi.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (848, 24, 'Memantau dampak berkelanjutan dari masalah dan kesalahan yang diketahui pada layanan', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (849, 24, 'Tinjau dan konfirmasikan keberhasilan penyelesaian masalah utama.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (850, 24, 'Memungkinkan perusahaan untuk memantau total biaya masalah, menangkap upaya perubahan yang dihasilkan dari aktivitas proses manajemen masalah (misalnya, perbaikan masalah dan kesalahan yang diketahui) dan melaporkannya.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (851, 24, 'Menghasilkan laporan untuk memantau penyelesaian masalah terhadap persyaratan bisnis dan SLA', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (852, 24, 'Untuk mengoptimalkan penggunaan sumber daya dan mengurangi solusi, lacak tren masalah.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (853, 24, 'Gunakan alat dan sistem yang sesuai untuk memproses dan menganalisis data.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (854, 24, 'Analisis penyebab penyimpangan dari target, lakukan tindakan perbaikan, tetapkan tanggung jawab, dan tindak lanjuti. Tinjau penyimpangan secara berkala dan cari akar masalah jika perlu. Dokumentasikan hasil untuk panduan jika masalah terulang.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (855, 24, 'Jika memungkinkan, kaitkan kinerja dan kepatuhan dengan tujuan individu dan sistem penghargaan organisasi.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (856, 24, 'Bandingkan kinerja dengan target internal, tolok ukur internal, dan eksternal (misalnya industri atau pesaing utama).', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (857, 24, 'Analisis tren kinerja dan kepatuhan, lalu ambil tindakan yang tepat.', '2025-08-03 12:57:34', '2025-08-03 12:57:34');
INSERT INTO `questions` VALUES (858, 25, 'Prioritaskan inisiatif perbaikan berdasarkan manfaat dan biaya potensial. Terapkan perbaikan, jadikan sebagai praktik bisnis rutin, dan tetapkan tujuan serta metrik kinerja untuk pemantauan.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (859, 25, 'Tingkatkan efisiensi dan efektivitas melalui pelatihan, dokumentasi, standarisasi, atau otomatisasi proses.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (860, 25, 'Terapkan praktik manajemen mutu untuk memperbarui proses.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (861, 25, 'Hapus komponen tata kelola yang sudah usang (seperti proses, dokumen informasi, kebijakan, dll.).', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (862, 25, 'Mendefinisikan, mengomunikasikan, dan menyepakati cara-cara untuk mengimplementasikan peningkatan yang diperlukan pada hubungan tersebut.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (863, 25, 'Mencatat dan menilai hasil tinjauan secara berkala dan mendiskusikannya dengan vendor untuk mengidentifikasi kebutuhan dan peluang perbaikan.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (864, 25, 'Mencatat dan menilai hasil tinjauan secara berkala dan mendiskusikannya dengan vendor untuk mengidentifikasi kebutuhan dan peluang perbaikan.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (865, 25, 'Tanggapi temuan hasil tinjauan untuk terus meningkatkan sistem manajemen mutu.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (866, 25, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (867, 25, 'Memprioritaskan peningkatan yang diperlukan dan membuat rencana ketersediaan dan kapasitas yang dapat dipertanggungjawabkan secara biaya.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (868, 25, 'Sesuaikan rencana kinerja dan kapasitas serta SLA berdasarkan proses bisnis yang realistis, baru, yang diusulkan dan/atau diproyeksikan, serta layanan pendukung, aplikasi, dan perubahan infrastruktur.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (869, 25, 'Tentukan tindakan korektif (misalnya, mengalihkan beban kerja, memprioritaskan tugas, atau menambah sumber daya ketika masalah kinerja dan kapasitas teridentifikasi).', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (870, 25, 'Mengintegrasikan tindakan perbaikan yang diperlukan ke dalam proses perencanaan dan manajemen perubahan yang sesuai.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (871, 25, 'Pantau insiden dan masalah operasional, ambil tindakan untuk meningkatkan keandalan tugas operasional.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (872, 25, 'Gunakan informasi tersebut sebagai masukan untuk perencanaan peningkatan berkelanjutan.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (873, 25, 'Pastikan pengetahuan yang diperoleh dari tinjauan tersebut dimasukkan ke dalam rapat tinjauan layanan dengan pelanggan bisnis.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (874, 25, 'Rekomendasikan perubahan pada tujuan dan metrik bila diperlukan.', '2025-08-03 12:58:55', '2025-08-03 12:58:55');
INSERT INTO `questions` VALUES (875, 26, 'Pahami konteks organisasi terkait risiko TI.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (876, 26, 'Tentukan seberapa besar risiko TI yang bisa diterima (risk appetite) dalam mencapai tujuan organisasi.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (877, 26, 'Tentukan batas toleransi risiko, yaitu penyimpangan yang masih bisa diterima dari risk appetite.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (878, 26, 'Pastikan strategi risiko TI selaras dengan strategi risiko organisasi, dan risk appetite tidak melebihi kapasitas risiko organisasi.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (879, 26, 'Arahkan penerjemahan dan integrasi strategi risiko TI ke dalam praktik manajemen risiko dan aktivitas operasional.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (880, 26, 'Arahkan pembuatan rencana komunikasi risiko untuk seluruh tingkatan organisasi.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (881, 26, 'Arahkan penerapan mekanisme yang tepat untuk merespons perubahan risiko secara cepat dan melaporkannya sesuai prinsip eskalasi yang disepakati (apa, kapan, ke mana, dan bagaimana melaporkannya).', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (882, 26, 'Arahkan agar siapa pun bisa melaporkan risiko, peluang, isu, dan kekhawatiran ke pihak yang tepat kapan saja. Risiko harus dikelola sesuai kebijakan dan prosedur yang berlaku, serta dieskalasi ke pengambil keputusan yang relevan.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (883, 26, 'Laporkan setiap isu terkait manajemen risiko ke dewan direksi atau komite eksekutif.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (884, 26, 'Tinjau opsi penyediaan sumber daya TIK (teknologi, keuangan, SDM) sesuai strategi saat ini dan masa depan, serta siapkan kemampuan untuk memenuhi kebutuhan tersebut.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (885, 26, 'Tetapkan prinsip utama alokasi dan pengelolaan sumber daya agar sesuai dengan prioritas dan batas anggaran', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (886, 26, 'Tinjau dan setujui rencana sumber daya serta strategi arsitektur perusahaan untuk memberikan nilai dan mengurangi risiko.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (887, 26, 'Pahami kebutuhan integrasi pengelolaan sumber daya TIK dengan perencanaan keuangan dan SDM perusahaan.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (888, 26, 'Tetapkan tanggung jawab dalam pelaksanaan pengelolaan sumber daya.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (889, 26, 'Tetapkan prinsip untuk melindungi dan menjaga sumber daya.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (890, 26, 'Meninjau opsi penyediaan sumber daya TI (teknologi, keuangan, dan SDM) berdasarkan strategi saat ini dan masa depan.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (891, 26, 'Menentukan prinsip utama alokasi dan pengelolaan sumber daya sesuai prioritas dan batas anggaran yang disepakati.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (892, 26, 'Meninjau dan menyetujui rencana sumber daya dan strategi arsitektur perusahaan untuk memberikan nilai dan memitigasi risiko.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (893, 26, 'Mengidentifikasi masalah melalui korelasi laporan insiden, log kesalahan, dan sumber daya identifikasi masalah lainnya.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (894, 26, 'Menangani semua masalah secara formal dengan akses ke semua data yang relevan. Menyertakan informasi dari sistem manajemen perubahan TI dan konfigurasi/aset TI serta rincian insiden.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (895, 26, 'Tentukan kelompok dukungan yang tepat untuk membantu identifikasi masalah, analisis akar masalah, dan penentuan solusi untuk mendukung manajemen masalah', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (896, 26, 'Tentukan tingkat prioritas melalui konsultasi dengan bisnis untuk memastikan bahwa identifikasi masalah dan analisis akar masalah ditangani secara tepat waktu sesuai dengan SLA yang telah disepakati', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (897, 26, 'Melaporkan status masalah yang teridentifikasi kepada service desk sehingga pelanggan dan manajemen TI dapat terus mendapatkan informasi.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (898, 26, 'Memelihara satu katalog manajemen masalah untuk mendaftarkan dan melaporkan masalah yang teridentifikasi.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (899, 26, 'Setelah akar penyebab masalah diidentifikasi, buat catatan kesalahan yang diketahui dan kembangkan solusi yang sesuai', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (900, 26, 'Tutup catatan masalah baik setelah konfirmasi untuk menghilangkan kesalahan yang diketahui dengan sukses atau setelah kesepakatan dengan bisnis tentang cara alternatif penanganan masalah.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (901, 26, 'Menginformasikan kepada meja layanan tentang jadwal penutupan masalah (misalnya, jadwal untuk memperbaiki kesalahan yang diketahui, solusi yang mungkin dilakukan, atau fakta bahwa masalah akan tetap ada hingga perubahan diterapkan) dan konsekuensi dari pendekatan yang diambil.', '2025-08-03 13:02:08', '2025-08-03 13:02:08');
INSERT INTO `questions` VALUES (902, 27, 'Secara proaktif mengevaluasi faktor risiko I&T sebelum keputusan strategis perusahaan yang tertunda dan memastikan bahwa pertimbangan risiko merupakan bagian dari proses keputusan strategis perusahaan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (903, 27, 'Evaluasi aktivitas manajemen risiko agar selaras dengan kapasitas organisasi dalam menanggung kerugian TI dan toleransi pimpinan terhadapnya.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (904, 27, 'Pastikan ketersediaan dan pemeliharaan tenaga ahli yang dibutuhkan untuk manajemen risiko TI.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (905, 27, 'Tentukan tujuan utama dan metrik untuk mengukur tata kelola dan manajemen risiko, serta setujui metode, teknik, dan proses pelaporan hasil pengukuran.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (906, 27, 'Pantau sejauh mana profil risiko dikelola dalam batas appetite dan toleransi risiko organisasi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (907, 27, 'Tentukan prinsip-prinsip untuk mengelola dan mengendalikan arsitektur TI organisasi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (908, 27, 'Mengkomunikasikan dan mendorong penerapan strategi manajemen sumber daya, prinsip-prinsip, dan rencana sumber daya yang telah disepakati serta strategi arsitektur perusahaan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (909, 27, 'Menyelaraskan manajemen sumber daya dengan perencanaan keuangan dan SDM perusahaan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (910, 27, 'Terapkan sistem manajemen mutu yang standar, formal, dan berkelanjutan sesuai kebutuhan perusahaan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (911, 27, 'Identifikasi kebutuhan dan kriteria mutu berdasarkan hukum dan pelanggan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (912, 27, 'Tetapkan peran, tugas, dan hak keputusan untuk manajemen mutu.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (913, 27, 'Tentukan kebutuhan pelanggan dan sesuaikan standar I&T. Jelaskan peran untuk penyelesaian konflik antara pelanggan dan IT.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (914, 27, 'Kelola kebutuhan bisnis dan kualitas layanan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (915, 27, 'Komunikasikan kebutuhan pelanggan ke seluruh organisasi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (916, 27, 'Integrasikan praktik manajemen mutu ke dalam proses dan solusi utama organisasi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (917, 27, 'Pertimbangkan manfaat dan biaya sertifikasi mutu.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (918, 27, 'Komunikasikan pendekatan manajemen mutu secara efektif, misalnya melalui pelatihan formal rutin.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (919, 27, 'Lakukan review kualitas secara rutin untuk proses dan solusi utama organisasi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (920, 27, 'Identifikasi proses berkualitas tinggi yang bisa diterapkan ke layanan/proyek lain dan bagikan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (921, 27, 'Temukan penyebab cacat kualitas berulang, nilai dampaknya, dan sepakati tindakan perbaikan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (922, 27, 'Berikan pelatihan metode dan alat perbaikan berkelanjutan kepada karyawan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (923, 27, 'Identifikasi masalah yang kemungkinan merupakan error yang sudah dikenal dengan membandingkan data insiden dengan database error (termasuk dari vendor). Klasifikasikan sebagai error yang dikenal.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (924, 27, 'Hubungkan item konfigurasi yang terdampak dengan error tersebut.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (925, 27, 'Buat laporan progres penyelesaian dan dampak masalah yang belum terselesaikan. Pantau proses penanganan masalah sepanjang siklusnya, termasuk masukan dari manajemen perubahan dan konfigurasi TI.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (926, 27, 'Identifikasi, evaluasi, prioritaskan, dan proses solusi untuk error yang dikenal melalui manajemen perubahan TI, berdasarkan analisis biaya/manfaat, dampak bisnis, dan urgensi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (927, 27, 'Selama proses penyelesaian, pantau progres secara rutin melalui laporan dari manajemen perubahan TI.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (928, 27, 'Kumpulkan informasi masalah terkait perubahan dan insiden TI, lalu sampaikan ke pihak terkait melalui laporan dan pertemuan rutin antar pemilik proses insiden, masalah, perubahan, dan konfigurasi.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (929, 27, 'Pastikan pertemuan rutin antar pemilik dan manajer proses tersebut dilakukan untuk membahas masalah yang ada dan perubahan yang direncanakan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (930, 27, 'Identifikasi dan ajukan solusi permanen atas akar penyebab masalah melalui proses manajemen perubahan yang telah ditetapkan.', '2025-08-03 13:04:12', '2025-08-03 13:04:12');
INSERT INTO `questions` VALUES (931, 28, 'Pantau tujuan dan metrik utama tata kelola dan manajemen risiko terhadap targetnya, analisis penyebab penyimpangan, dan lakukan tindakan perbaikan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (932, 28, 'Libatkan pemangku kepentingan untuk meninjau progres pencapaian tujuan organisasi.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (933, 28, 'Menetapkan tujuan, ukuran, dan metrik utama untuk manajemen sumber daya.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (934, 28, 'Memantau alokasi dan optimalisasi sumber daya sesuai dengan tujuan dan prioritas perusahaan dengan menggunakan sasaran dan metrik yang telah disepakati.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (935, 28, 'Memantau strategi sumber daya terkait TI, strategi arsitektur perusahaan, serta kemampuan dan sumber daya terkait bisnis dan TI untuk memastikan bahwa kebutuhan dan tujuan perusahaan saat ini dan di masa depan dapat terpenuhi.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (936, 28, 'Memantau kinerja sumber daya terhadap target, menganalisis penyebab penyimpangan, dan memulai tindakan perbaikan untuk mengatasi penyebab yang mendasarinya.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (937, 28, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (938, 28, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (939, 28, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (940, 28, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (941, 28, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (942, 28, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (943, 28, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (944, 28, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (945, 28, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (946, 28, 'Pantau dampak berkelanjutan dari masalah dan error yang dikenal terhadap layanan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (947, 28, 'Tinjau dan pastikan solusi atas masalah besar berhasil.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (948, 28, 'Catat upaya perubahan akibat aktivitas manajemen masalah (seperti perbaikan masalah/error) untuk memantau total biaya, dan laporkan.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (949, 28, 'Buat laporan untuk memantau penyelesaian masalah terhadap kebutuhan bisnis dan SLA.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (950, 28, 'Lacak tren masalah untuk mengoptimalkan sumber daya dan mengurangi solusi sementara.', '2025-08-03 13:05:28', '2025-08-03 13:05:28');
INSERT INTO `questions` VALUES (951, 29, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-08-03 13:05:44', '2025-08-03 13:05:44');
INSERT INTO `questions` VALUES (952, 29, 'Pastikan pengetahuan yang diperoleh dari hasil review disampaikan dan dibahas dalam pertemuan evaluasi layanan bersama pelanggan bisnis.', '2025-08-03 13:05:44', '2025-08-03 13:05:44');
INSERT INTO `questions` VALUES (953, 30, 'Tetapkan standar dan prosedur manajemen mutu sesuai dengan kerangka kerja I&T dan kebijakan mutu perusahaan.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (954, 30, 'Buat platform berbagi praktik baik dan informasi kesalahan untuk pembelajaran.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (955, 30, 'Mengidentifikasi masalah melalui korelasi laporan insiden, log kesalahan, dan sumber daya identifikasi masalah lainnya.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (956, 30, 'Menangani semua masalah secara formal dengan akses ke semua data yang relevan. Menyertakan informasi dari sistem manajemen perubahan TI dan konfigurasi/aset TI serta rincian insiden.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (957, 30, 'Tentukan kelompok dukungan yang tepat untuk membantu identifikasi masalah, analisis akar masalah, dan penentuan solusi untuk mendukung manajemen masalah', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (958, 30, 'Tentukan tingkat prioritas melalui konsultasi dengan bisnis untuk memastikan bahwa identifikasi masalah dan analisis akar masalah ditangani secara tepat waktu sesuai dengan SLA yang telah disepakati', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (959, 30, 'Melaporkan status masalah yang teridentifikasi kepada service desk sehingga pelanggan dan manajemen TI dapat terus mendapatkan informasi.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (960, 30, 'Memelihara satu katalog manajemen masalah untuk mendaftarkan dan melaporkan masalah yang teridentifikasi.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (961, 30, 'Setelah akar penyebab masalah diidentifikasi, buat catatan kesalahan yang diketahui dan kembangkan solusi yang sesuai', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (962, 30, 'Tutup catatan masalah baik setelah konfirmasi untuk menghilangkan kesalahan yang diketahui dengan sukses atau setelah kesepakatan dengan bisnis tentang cara alternatif penanganan masalah.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (963, 30, 'Menginformasikan kepada meja layanan tentang jadwal penutupan masalah (misalnya, jadwal untuk memperbaiki kesalahan yang diketahui, solusi yang mungkin dilakukan, atau fakta bahwa masalah akan tetap ada hingga perubahan diterapkan) dan konsekuensi dari pendekatan yang diambil.', '2025-08-03 13:09:09', '2025-08-03 13:09:09');
INSERT INTO `questions` VALUES (964, 31, 'Terapkan sistem manajemen mutu yang standar, formal, dan berkelanjutan sesuai kebutuhan perusahaan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (965, 31, 'Identifikasi kebutuhan dan kriteria mutu berdasarkan hukum dan pelanggan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (966, 31, 'Tetapkan peran, tugas, dan hak keputusan untuk manajemen mutu.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (967, 31, 'Tentukan kebutuhan pelanggan dan sesuaikan standar I&T. Jelaskan peran untuk penyelesaian konflik antara pelanggan dan IT.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (968, 31, 'Kelola kebutuhan bisnis dan kualitas layanan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (969, 31, 'Komunikasikan kebutuhan pelanggan ke seluruh organisasi.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (970, 31, 'Integrasikan praktik manajemen mutu ke dalam proses dan solusi utama organisasi.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (971, 31, 'Pertimbangkan manfaat dan biaya sertifikasi mutu.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (972, 31, 'Komunikasikan pendekatan manajemen mutu secara efektif, misalnya melalui pelatihan formal rutin.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (973, 31, 'Lakukan review kualitas secara rutin untuk proses dan solusi utama organisasi.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (974, 31, 'Identifikasi proses berkualitas tinggi yang bisa diterapkan ke layanan/proyek lain dan bagikan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (975, 31, 'Temukan penyebab cacat kualitas berulang, nilai dampaknya, dan sepakati tindakan perbaikan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (976, 31, 'Berikan pelatihan metode dan alat perbaikan berkelanjutan kepada karyawan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (977, 31, 'Identifikasi masalah yang kemungkinan merupakan error yang sudah dikenal dengan membandingkan data insiden dengan database error (termasuk dari vendor). Klasifikasikan sebagai error yang dikenal.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (978, 31, 'Hubungkan item konfigurasi yang terdampak dengan error tersebut.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (979, 31, 'Buat laporan progres penyelesaian dan dampak masalah yang belum terselesaikan. Pantau proses penanganan masalah sepanjang siklusnya, termasuk masukan dari manajemen perubahan dan konfigurasi TI.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (980, 31, 'Identifikasi, evaluasi, prioritaskan, dan proses solusi untuk error yang dikenal melalui manajemen perubahan TI, berdasarkan analisis biaya/manfaat, dampak bisnis, dan urgensi.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (981, 31, 'Selama proses penyelesaian, pantau progres secara rutin melalui laporan dari manajemen perubahan TI.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (982, 31, 'Kumpulkan informasi masalah terkait perubahan dan insiden TI, lalu sampaikan ke pihak terkait melalui laporan dan pertemuan rutin antar pemilik proses insiden, masalah, perubahan, dan konfigurasi.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (983, 31, 'Pastikan pertemuan rutin antar pemilik dan manajer proses tersebut dilakukan untuk membahas masalah yang ada dan perubahan yang direncanakan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (984, 31, 'Identifikasi dan ajukan solusi permanen atas akar penyebab masalah melalui proses manajemen perubahan yang telah ditetapkan.', '2025-08-03 13:10:59', '2025-08-03 13:10:59');
INSERT INTO `questions` VALUES (985, 32, 'Regularly assess performance of framework components and take appropriate action', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (986, 32, 'Identify business-critical processes based on performance and conformance drivers and related risk. Assess capability and identify improvement targets. Analyze gaps in capability and control. Identify options for improving or redesigning the process.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (987, 32, 'Pantau dan tinjau QMS secara rutin berdasarkan kriteria penerimaan yang telah disepakati. Libatkan umpan balik dari pelanggan, pengguna, dan manajemen.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (988, 32, 'Secara berkala kumpulkan pandangan pelanggan tentang proses bisnis, layanan, dan solusi TI. Nilai dampaknya terhadap standar dan praktik TI serta pastikan ekspektasi pelanggan dipenuhi dan ditindaklanjuti.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (989, 32, 'Tentukan kriteria penerimaan mutu untuk dicantumkan dalam SLA (Service Level Agreement).', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (990, 32, 'Catat dan pantau data mutu. Gunakan praktik terbaik industri sebagai acuan untuk peningkatan dan penyesuaian praktik mutu perusahaan.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (991, 32, 'Tinjau secara berkala relevansi, efisiensi, dan efektivitas proses manajemen mutu. Pantau pencapaian tujuan mutu.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (992, 32, 'Pantau metrik mutu berbasis tujuan untuk proses dan solusi penting organisasi yang selaras dengan sasaran mutu.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (993, 32, 'Pastikan manajemen dan pemilik proses meninjau kinerja mutu secara berkala sesuai metrik yang telah ditetapkan.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (994, 32, 'Analisis hasil kinerja manajemen mutu secara keseluruhan.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (995, 32, 'Bandingkan hasil tinjauan mutu dengan data historis internal, panduan industri, standar, dan data dari perusahaan sejenis untuk mendorong perbaikan berkelanjutan.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (996, 32, 'Pantau dampak berkelanjutan dari masalah dan error yang dikenal terhadap layanan.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (997, 32, 'Tinjau dan pastikan solusi atas masalah besar berhasil.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (998, 32, 'Catat upaya perubahan akibat aktivitas manajemen masalah (seperti perbaikan masalah/error) untuk memantau total biaya, dan laporkan.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (999, 32, 'Buat laporan untuk memantau penyelesaian masalah terhadap kebutuhan bisnis dan SLA.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (1000, 32, 'Lacak tren masalah untuk mengoptimalkan sumber daya dan mengurangi solusi sementara.', '2025-08-03 13:12:06', '2025-08-03 13:12:06');
INSERT INTO `questions` VALUES (1001, 33, 'Laporkan hasil tinjauan kinerja mutu dan lakukan perbaikan bila diperlukan.', '2025-08-03 13:12:24', '2025-08-03 13:12:24');
INSERT INTO `questions` VALUES (1002, 33, 'Pastikan pengetahuan yang diperoleh dari hasil review disampaikan dan dibahas dalam pertemuan evaluasi layanan bersama pelanggan bisnis.', '2025-08-03 13:12:24', '2025-08-03 13:12:24');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@gmail.com', NULL, '$2y$10$pnerTCihQlJCEJkj6/g5B.Cmb5hHE3tZLUbswiShY1hA/ZVYahzsG', '1', NULL, '2025-06-11 07:08:52', '2025-06-11 07:08:52');
INSERT INTO `users` VALUES (4, 'auditor', 'auditor@gmail.com', NULL, '$2y$10$W85Ae1u1eaneJvqRY98P9uikLbbia6Lw9riEbZ7DLBALkrAwDypai', '2', NULL, '2025-07-19 15:35:00', '2025-07-19 15:35:00');

SET FOREIGN_KEY_CHECKS = 1;
