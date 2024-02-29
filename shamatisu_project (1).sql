-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 29 fév. 2024 à 21:39
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shamatisu_project`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `label`, `price`, `image`, `created_at`, `updated_at`) VALUES
(2, 'test', 12.00, '', NULL, NULL),
(3, 'test', 12.00, '', NULL, NULL),
(4, 'test', 12.00, '', NULL, NULL),
(6, 'test', 1.00, '1708631588.jpeg', '2024-02-22 18:53:08', '2024-02-22 18:53:08'),
(7, 'test', 11.00, '1708631631.jpeg', '2024-02-22 18:53:51', '2024-02-22 18:53:51'),
(8, 'test', 12345.00, '1708682045.png', '2024-02-23 08:54:05', '2024-02-23 08:54:05');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2024_02_03_113611_create_articles_table', 1),
(10, '2024_02_03_113818_create_orders_table', 1),
(11, '2024_02_03_124419_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int NOT NULL,
  `status` int NOT NULL,
  `id_article` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id_article_foreign` (`id_article`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('wolf.tania@example.net', '$2y$04$j5p6zUlX7FO5FPmaNFqxfuLtnos9PYshHtx7f4PwOaFBAxG/viAYK', '2024-02-14 10:18:58'),
('marcella63@example.org', '$2y$04$cQ8p4M58s0kd/mTfyxpp6./4086.Gmu91pw.mN.bE4/H9RR8DyGEq', '2024-02-14 10:18:58'),
('malak.mawfik@gmail.com', '$2y$12$9GebnvfRpRoc7zndcjFSd.RIht2qoTUk2DNaCwpLfepnz9Alb2QEy', '2024-02-23 08:31:08');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('kWDOwKAKcf3U29WjN79UKF0zbMRn7ZOzu0cTojyY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamZDbW9WbEloZDQwdFh3a1hNdUFqamp3T3JLTDJYTHVybnZtaU0wYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nZW5lcmF0ZS1wZGYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1708629790),
('dp8shVefBshKy4DKOM6d7d0k0IebSQ9e5OUXHCEg', 39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiR1NxMEhiTmplcUljQVJOTnZwSzhhMXVldWdMU1N5UkhNOFBZNEJkOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcnRpY2xlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozOTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiQvQ1VvOWRTeVlMeXN2U0thY0l2WDhPckZReXNEeFJkSi5KWkU3LmFPOUpMcGFMY3ROTUt6UyI7fQ==', 1708547398),
('b8KorbY1V60VPyZSglhh8Bgq1TXLgoMIXo3Vwxl0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVBzbzFxaW5hdnBqVjhtMHZ0dURCWlFzd1pId3A0cmtKRmNSWHU4eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcnRpY2xlcy9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1708625121);

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 4, 'Barrett Hahn IV\'s Team', 1, '2024-02-14 10:18:53', '2024-02-14 10:18:53'),
(2, 4, 'Test Team', 0, '2024-02-14 10:18:53', '2024-02-14 10:18:53'),
(3, 7, 'Jazmin Berge\'s Team', 1, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(5, 10, 'Myah Marks\'s Team', 1, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(6, 11, 'Graciela Stehr\'s Team', 1, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(7, 12, 'Rodger Eichmann\'s Team', 1, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(8, 13, 'Tracy Hoeger PhD\'s Team', 1, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(9, 15, 'Jude Ward\'s Team', 1, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(10, 16, 'Dr. Maverick Quitzon MD\'s Team', 1, '2024-02-14 10:18:57', '2024-02-14 10:18:57'),
(11, 24, 'Beaulah Wilderman\'s Team', 1, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(12, 26, 'Ms. Judy Heaney\'s Team', 1, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(13, 34, 'Johnathan Bayer\'s Team', 1, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(14, 36, 'Ms. Tabitha Toy MD\'s Team', 1, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(15, 38, 'Test Team', 1, '2024-02-14 10:19:03', '2024-02-14 10:19:03');

-- --------------------------------------------------------

--
-- Structure de la table `team_invitations`
--

DROP TABLE IF EXISTS `team_invitations`;
CREATE TABLE IF NOT EXISTS `team_invitations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `team_invitations`
--

INSERT INTO `team_invitations` (`id`, `team_id`, `email`, `role`, `created_at`, `updated_at`) VALUES
(1, 6, 'test@example.com', 'admin', '2024-02-14 10:18:56', '2024-02-14 10:18:56');

-- --------------------------------------------------------

--
-- Structure de la table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
CREATE TABLE IF NOT EXISTS `team_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `team_user`
--

INSERT INTO `team_user` (`id`, `team_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(4, 12, 27, 'admin', '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(5, 13, 35, 'editor', '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(6, 14, 37, 'admin', '2024-02-14 10:19:03', '2024-02-14 10:19:03');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Clifford Kassulke', 'marguerite.stark@example.com', '2024-02-14 10:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mglTTuWPUT', NULL, NULL, '2024-02-14 10:18:52', '2024-02-14 10:18:52'),
(2, 'Alayna Jakubowski', 'maeve04@example.com', '2024-02-14 10:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '9eu2D83VXs', NULL, NULL, '2024-02-14 10:18:52', '2024-02-14 10:18:52'),
(3, 'Darlene O\'Keefe', 'samanta09@example.net', '2024-02-14 10:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'H0jlq0iT8Q', NULL, NULL, '2024-02-14 10:18:52', '2024-02-14 10:18:52'),
(4, 'Barrett Hahn IV', 'holly10@example.org', '2024-02-14 10:18:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'wUN5aa9Hk2', 2, NULL, '2024-02-14 10:18:53', '2024-02-14 10:18:53'),
(6, 'Ramon Breitenberg', 'dixie.mertz@example.org', '2024-02-14 10:18:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'QlUbx8167T', NULL, NULL, '2024-02-14 10:18:54', '2024-02-14 10:18:54'),
(7, 'Jazmin Berge', 'harber.lloyd@example.com', '2024-02-14 10:18:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '9ET6NlgwyD', NULL, NULL, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(8, 'Mr. Joey Smitham', 'terrance.huel@example.net', '2024-02-14 10:18:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'gBcQVgGRVR', NULL, NULL, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(9, 'Porter Huel IV', 'ypacocha@example.com', '2024-02-14 10:18:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ZcR2m8zfNQ', NULL, NULL, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(10, 'Myah Marks', 'erna58@example.com', '2024-02-14 10:18:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'YU2wccHqkj', 5, NULL, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(11, 'Graciela Stehr', 'bogan.jarvis@example.net', '2024-02-14 10:18:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '3zcAqiaGg3', 6, NULL, '2024-02-14 10:18:55', '2024-02-14 10:18:55'),
(12, 'Rodger Eichmann', 'gpouros@example.com', '2024-02-14 10:18:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bR9dyhHAlc', 7, NULL, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(13, 'Tracy Hoeger PhD', 'corrine.koelpin@example.net', '2024-02-14 10:18:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '9qpbXKTYVE', 8, NULL, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(14, 'Marge Mann', 'marian51@example.net', '2024-02-14 10:18:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'gPitMZHCli', NULL, NULL, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(15, 'Jude Ward', 'bsmith@example.com', '2024-02-14 10:18:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'vdr9tzYirX', 9, NULL, '2024-02-14 10:18:56', '2024-02-14 10:18:56'),
(16, 'Dr. Maverick Quitzon MD', 'buckridge.reba@example.net', '2024-02-14 10:18:57', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'AuS2cUDM4k', NULL, NULL, '2024-02-14 10:18:57', '2024-02-14 10:18:57'),
(17, 'Colleen Sawayn', 'dkonopelski@example.net', '2024-02-14 10:18:57', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'jmvFQ0T8oI', NULL, NULL, '2024-02-14 10:18:57', '2024-02-14 10:18:57'),
(18, 'Thaddeus Hoppe', 'corwin.tristian@example.net', '2024-02-14 10:18:57', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'laJ65fWXPk', NULL, NULL, '2024-02-14 10:18:57', '2024-02-14 10:18:57'),
(19, 'Mr. Reed Boyle', 'wolf.tania@example.net', '2024-02-14 10:18:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '88wyTNFCkH', NULL, NULL, '2024-02-14 10:18:58', '2024-02-14 10:18:58'),
(20, 'Prof. Devin Gulgowski', 'marcella63@example.org', '2024-02-14 10:18:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NI5PzUUa80', NULL, NULL, '2024-02-14 10:18:58', '2024-02-14 10:18:58'),
(21, 'Brady Metz', 'qkling@example.org', '2024-02-14 10:18:58', '$2y$04$RuDB7xDWZtY6q5h1iB5PSOe78Et90oiYDyi8q557qTmZ45R2uA0OW', NULL, NULL, NULL, 'aOx24AWgmcupeFMRvuo4OLfXbaSSbPR6P0kQfI6j5AELSptbdGBN5vpeHntv', NULL, NULL, '2024-02-14 10:18:58', '2024-02-14 10:18:58'),
(22, 'Virgie Trantow', 'glenda50@example.com', '2024-02-14 10:18:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '03UbEWl9sM', NULL, NULL, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(23, 'Test Name', 'test@example.com', '2024-02-14 10:18:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '8SM4mh61gb', NULL, NULL, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(24, 'Beaulah Wilderman', 'johnpaul10@example.com', '2024-02-14 10:18:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'HYIi0fYifk', 11, NULL, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(25, 'Braeden Armstrong', 'emmy33@example.org', '2024-02-14 10:18:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'C6ClrqOMg3', NULL, NULL, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(26, 'Ms. Judy Heaney', 'kreiger.derrick@example.org', '2024-02-14 10:18:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'xSP5LpsVYs', 12, NULL, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(27, 'Dr. Austin Carroll', 'johnson.emery@example.com', '2024-02-14 10:18:59', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2lM1uhEc0a', NULL, NULL, '2024-02-14 10:18:59', '2024-02-14 10:18:59'),
(28, 'Mrs. Avis Rutherford', 'melvin39@example.net', '2024-02-14 10:19:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eyJpdiI6IlNsMDF0N2lraDIrUFVtSUVHOVcyWGc9PSIsInZhbHVlIjoiNEJHQnMyK2lkZDJnYkhYTU1nUVNlSFJ5aWU1ZktCWHJWek1xUWxPWHh5MD0iLCJtYWMiOiJlYTQ2NjhjNWUwNTViYzQ2ZDk0ZjM2M2ZmMjY4NDdhNmMyMDc4NGU2NDhjY2ZlYjUyNDk3MjNhYTg1ZjAyZDE2IiwidGFnIjoiIn0=', 'eyJpdiI6IlRVWm1QRlVNMjE4eWFZUzV3RmdJU1E9PSIsInZhbHVlIjoiWlhHR1VvRmdPMVRpT1F2MEdwNW1sM1p0RmpaVjd6SUNnZVdDU0Z0TzlNTkZmSk0wSEN6SGJxSWdwNTJuQ2V4ditHZUF3WkJBVWxDczN6SzJ5SjlSYmQ5Y1V1bDhMTWMxZTVqcWVRczRRNUNsa3E4TTFJbXJHNkpFcjZqejU1V2ZBQ1BuZVR0Mmw0aWtRcS9IN1AvVU5acGN6V1NQc20zK3JWV3g1L01CdHFZYWRqZUlEcGxkaHZLRUY2QzRWa29yek92RWlrMEFTYXlNU1U1UnI3NVFieUhITndKbjd5a2o0SllYNHEveG5LOHFmczdSc3diMmdzUHhUbFhHQkVUcUZKYUpvTjJrQ2JOUERiNzhscjNhbWc9PSIsIm1hYyI6ImIzMWNjNDYzMmY2NWM4Yzc2NDIyNDUwMDBlODllNzQ2Yzk1Y2VkMDU4MDI3N2IxNzMwN2ExMjdkMTA1OTdkNjUiLCJ0YWciOiIifQ==', NULL, 'VvGuSm6uGm', NULL, NULL, '2024-02-14 10:19:00', '2024-02-14 10:19:00'),
(29, 'Orlo Cummings', 'ledner.paxton@example.com', '2024-02-14 10:19:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eyJpdiI6InhleFhlcER2cTVxRXB1VUZSSDZidmc9PSIsInZhbHVlIjoiaW51SzJFanp0U1YrQzhITGJlZU1HZ3pBRWloY05JSytOb3czL2JNcEh0ST0iLCJtYWMiOiI2OWQ5OThlMDk3ZTA3ODdjNGMwY2Q1MTdkNTM2NDI3OGYwNDBkNmU0OWJmZmEzNDhhNDI5MGMzN2RjZjQ3Y2E3IiwidGFnIjoiIn0=', 'eyJpdiI6ImVnd0RYZTM1UGxJM3hJT3BNaXJubXc9PSIsInZhbHVlIjoiRTVwSEZKVU5TeHlvdzFRWXBML1lJb09IUXBGN0VOUVdRZTRaMHgvU1BvUDRRU3J0aUJCZUNhZU55alRjUnNwdlh6RXlLMnBDWWJqZXFxNDdzMzVzUGF0SUM3TVBIa0RYVkJKYlQrT250K0EyTmtNb2NkSzNNQU4wTENkOE5sNWFVZVJJTXp6d3RNSVFyRndzM3JtQ2YyRzgybTU2Wmk5cW1vVkszMFllaXJ5Z1JlTVJ1MFlwV2E1VGhyaTdKL1RZZ29JNVYzYWJBazFkSkkzTDBkOWZXeWFRQXBIYU44MUF3QkZkNFVrcU91K3J4K0ExRlpvbmkyaVp5UW9mU0t5UWFDRy9hMTV1V3lOVnFGOXgyR29TZWc9PSIsIm1hYyI6ImMyZGQ5OTVkZTAwYzZhNzMxMTE4MjBlYzJlNmI4ZGI5ZjM5NTlmMDA5ZGQ4NDM2M2NmODY3MzI5NTZjOGI4OWMiLCJ0YWciOiIifQ==', NULL, 'U19uld9wrE', NULL, NULL, '2024-02-14 10:19:01', '2024-02-14 10:19:01'),
(30, 'Haleigh Kovacek', 'larson.ardith@example.org', '2024-02-14 10:19:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '23YMpk6wX2', NULL, NULL, '2024-02-14 10:19:01', '2024-02-14 10:19:01'),
(31, 'Prof. Tiana McClure', 'horace.luettgen@example.com', '2024-02-14 10:19:01', '$2y$04$Kp.B7qD86pGZH91SNwSKru1iL1SzjOKW7l7ZVGG.MgZ/quPnOlW8W', NULL, NULL, NULL, 'n8nEIxhc6p', NULL, NULL, '2024-02-14 10:19:01', '2024-02-14 10:19:02'),
(32, 'Prof. Devyn Dickens', 'albina.collins@example.org', '2024-02-14 10:19:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'l3MPcukepb', NULL, NULL, '2024-02-14 10:19:02', '2024-02-14 10:19:02'),
(33, 'Lonny Reichel', 'rswift@example.org', '2024-02-14 10:19:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'JppeTAs87Z', NULL, NULL, '2024-02-14 10:19:02', '2024-02-14 10:19:02'),
(34, 'Johnathan Bayer', 'cummings.jude@example.net', '2024-02-14 10:19:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ej3eRxncSj', 13, NULL, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(35, 'Alfredo Batz', 'ezekiel07@example.net', '2024-02-14 10:19:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '0vC4MLXELi', NULL, NULL, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(36, 'Ms. Tabitha Toy MD', 'shamill@example.net', '2024-02-14 10:19:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'sy49s74XTu', 14, NULL, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(37, 'Archibald McLaughlin', 'rogahn.christelle@example.net', '2024-02-14 10:19:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NV8LiXMuyf', NULL, NULL, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(38, 'Lucious Sauer DDS', 'yrice@example.com', '2024-02-14 10:19:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'jIBEX5Ytgx', 15, NULL, '2024-02-14 10:19:03', '2024-02-14 10:19:03'),
(39, 'malak', 'malak.mawfik@gmail.com', NULL, '$2y$12$/CUo9dSyYLysvSKacIvX8OrFQysDxRdJ.JZE7.aO9JLpaLctNMKzS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-21 19:03:14', '2024-02-21 19:03:14'),
(40, 'Malak', 'malak@malak.ma', NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'malak', 'malak@ensi.ma', NULL, '$2y$12$Oreeqbwx5fwyr6rMtB9eN.sPo8pMckr7vVhzRJOqiCWpj2Q9ErYla', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-22 19:13:03', '2024-02-22 19:13:03'),
(42, 'Malak', 'malak@malak.net', NULL, '$2y$12$kQuhWVgNyuwMTWM5kFWzPefKvU9pNqvZNSIWJTjHyvWym/HCBMxau', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-23 08:50:07', '2024-02-23 08:50:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
