/*
 Navicat Premium Data Transfer

 Source Server         : db_bagus
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : audit

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 12/07/2025 22:15:22
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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit_answers
-- ----------------------------
INSERT INTO `audit_answers` VALUES (17, 6, 3, 3, 5, 1, NULL, '2025-07-12 14:38:07', '2025-07-12 14:38:07');
INSERT INTO `audit_answers` VALUES (18, 6, 3, 3, 6, 0, NULL, '2025-07-12 14:38:07', '2025-07-12 14:38:07');
INSERT INTO `audit_answers` VALUES (19, 7, 2, 1, 1, 0, NULL, '2025-07-12 14:45:20', '2025-07-12 15:13:50');
INSERT INTO `audit_answers` VALUES (20, 7, 2, 1, 2, 1, NULL, '2025-07-12 14:45:20', '2025-07-12 14:45:20');
INSERT INTO `audit_answers` VALUES (21, 7, 2, 2, 3, 1, NULL, '2025-07-12 14:45:28', '2025-07-12 14:45:28');
INSERT INTO `audit_answers` VALUES (22, 7, 2, 2, 4, 1, NULL, '2025-07-12 14:45:28', '2025-07-12 14:45:28');
INSERT INTO `audit_answers` VALUES (23, 7, 3, 3, 5, 1, NULL, '2025-07-12 14:45:37', '2025-07-12 14:45:37');
INSERT INTO `audit_answers` VALUES (24, 7, 3, 3, 6, 1, NULL, '2025-07-12 14:45:37', '2025-07-12 14:45:37');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of klausuls
-- ----------------------------
INSERT INTO `klausuls` VALUES (2, 'K4', 'KLAUSUL 4', '123', '2025-07-12 11:17:27', '2025-07-12 11:17:27');
INSERT INTO `klausuls` VALUES (3, 'K.5', 'KLAUSUL 5', NULL, '2025-07-12 12:42:03', '2025-07-12 12:42:03');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES (1, 2, 2, '2025-07-12 11:19:16', '2025-07-12 11:59:43', '4.2 Memahami kebutuhan dan harapan dari pihak-pihak yang berkepentingan\r\n4.3 Menentukan ruang lingkup sistem manajemen mutu\r\n4.3 Menentukan ruang lingkup sistem manajemen mutu\r\n4.4 Sistem manajemen mutu dan proses-prosesnya\r\n4.4.2 Informasi terdokumentasi\r\n4.4.1 Menetapkan proses dan interaksinya\"');
INSERT INTO `levels` VALUES (2, 2, 3, '2025-07-12 11:55:17', '2025-07-12 11:55:17', '4.1 Memahami organisasi dan konteksnya\r\n4.2 Memahami kebutuhan dan harapan dari pihak-pihak yang berkepentingan\r\n4.3 Menentukan ruang lingkup sistem manajemen mutu\r\n4.4 Sistem manajemen mutu dan proses-prosesnya\r\n4.4.1 Menetapkan proses dan interaksinya\r\n4.4.2 Informasi terdokumentasi');
INSERT INTO `levels` VALUES (3, 3, 2, '2025-07-12 12:42:39', '2025-07-12 12:42:39', '5.1.1 Umum \r\n5.2.2 Mengkomunikasikan Kebijakan Mutu\r\n5.3 Aturan Organisasi, Tanggungjawab dan Wewenang');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (6, 'project3', 'bagus', '2025-07-12 14:37:45', '2025-07-12 14:37:45');
INSERT INTO `projects` VALUES (7, 'project4', 'bagus', '2025-07-12 14:45:05', '2025-07-12 14:45:05');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 1, 'pertanyaan 1', '2025-07-12 11:37:05', '2025-07-12 11:37:05');
INSERT INTO `questions` VALUES (2, 1, 'pertanyaan 2', '2025-07-12 11:37:05', '2025-07-12 11:37:05');
INSERT INTO `questions` VALUES (3, 2, 'Memvalidasi prioritas yang dipilih untuk implementasi tujuan manajemen dengan praktik-praktik yang baik dan industri yang spesifik (misalnya, peraturan khusus industri) dan dengan struktur tata kelola yang sesuai.', '2025-07-12 12:20:22', '2025-07-12 12:20:22');
INSERT INTO `questions` VALUES (4, 2, 'Tentukan kebutuhan komunikasi dan terapkan rencana yang mencakup komunikasi top-down, bottom-up, dan horizontal.', '2025-07-12 12:20:22', '2025-07-12 12:20:22');
INSERT INTO `questions` VALUES (5, 3, 'Memperoleh pemahaman tentang visi, arah, dan strategi perusahaan serta konteks dan tantangan perusahaan saat ini.', '2025-07-12 12:43:10', '2025-07-12 12:43:10');
INSERT INTO `questions` VALUES (6, 3, 'Pertimbangkan lingkungan internal perusahaan, termasuk budaya dan filosofi manajemen, toleransi risiko, kebijakan keamanan dan privasi, nilai-nilai etika, kode etik, akuntabilitas, dan persyaratan integritas manajemen.', '2025-07-12 12:43:10', '2025-07-12 12:43:10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@gmail.com', NULL, '$2y$10$pnerTCihQlJCEJkj6/g5B.Cmb5hHE3tZLUbswiShY1hA/ZVYahzsG', '1', NULL, '2025-06-11 07:08:52', '2025-06-11 07:08:52');

SET FOREIGN_KEY_CHECKS = 1;
