-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 24 2024 г., 16:03
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Travel', '2024-02-07 16:11:44', '2024-02-07 16:11:44', NULL),
(2, 'Business', '2024-02-07 16:46:20', '2024-02-09 13:59:59', NULL),
(3, 'test', '2024-02-09 14:22:10', '2024-02-09 14:24:20', '2024-02-09 14:24:20'),
(4, 'testhi', '2024-02-09 14:26:06', '2024-02-09 14:26:35', '2024-02-09 14:26:35');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `created_at`, `updated_at`) VALUES
(2, 1, 5, 'Fist comment', '2024-02-18 12:00:43', '2024-02-18 12:36:27'),
(3, 1, 5, 'Працює!', '2024-02-18 12:19:05', '2024-02-18 12:19:05'),
(4, 1, 2, 'hi', '2024-03-07 16:19:06', '2024-03-07 16:19:06');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_01_31_112204_create_categories_table', 2),
(7, '2024_01_31_112205_create_posts_table', 2),
(8, '2024_01_31_112226_create_tags_table', 2),
(9, '2024_01_31_112411_create_post_tags_table', 2),
(11, '2024_02_09_171037_add_column_soft_deletes_to_categories_table', 3),
(13, '2024_02_10_182523_add_soft_delete_to_tags_table', 4),
(15, '2024_02_10_192537_add_columns_for_images_to_posts_table', 5),
(17, '2024_02_12_132115_add_soft_deletes_to_posts_table', 6),
(19, '2024_02_12_143637_add_soft_deletes_to_users_table', 7),
(22, '2024_02_12_145325_add_column_role_to_users_table', 8),
(23, '2024_02_17_181202_create_jobs_table', 9),
(25, '2024_02_17_194048_create_post_user_likes_table', 10),
(29, '2024_02_18_105641_create_comments_table', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `previewImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `category_id`, `created_at`, `updated_at`, `previewImage`, `mainImage`, `deleted_at`) VALUES
(1, 'fgh', '<span style=\"background-color: rgb(255, 156, 0);\">hi</span>', 1, '2024-02-10 16:56:28', '2024-02-18 10:08:31', 'images/a52HGliz5JgcrNVO9cGvbeS0JlcwW7snMrNLycH2.jpg', 'images/ZJvsMlZV5ud74YNE39WzKRc7bSScOn0yVOVJB4SV.png', NULL),
(2, 'Розробка CRM', '<span style=\"font-weight: bolder;\">Дивіться ютуб :)</span>', 2, '2024-02-12 09:15:15', '2024-02-18 10:08:43', 'images/5rvyhhUWWEGU3NT7ehLt7Owx5h5NoILnPmH9PnIe.jpg', 'images/Q1IetgynHekD0OpL9A87TPVFD0XIEeaVSHMTZ5VQ.png', NULL),
(3, 'fh', 'qw', 1, '2024-02-12 10:09:14', '2024-02-12 10:23:11', 'images/Lw55AMZufdkpxu0OWPr2q76cibj63JzFq9kRadn6.png', 'images/jArjQAKoQxu9KApmjg72ceUVayH1DPnbp17MgbUJ.png', '2024-02-12 10:23:11'),
(4, 'hfghfgh', 'dfhg', 1, '2024-02-12 10:23:21', '2024-02-12 10:24:11', 'images/uBnL7MHVLeC5xjuzlAlr3pgnB2hGwEzsZEkEbN1J.png', 'images/PxKqDSOAkL3DKONoX3X8g6pnTpJdihSBp4J6buXZ.png', '2024-02-12 10:24:11'),
(5, 'hi', 'C++ test. <font color=\"#000000\" style=\"background-color: rgb(107, 165, 74);\">Success</font>', 2, '2024-02-12 10:46:37', '2024-02-18 10:08:51', 'images/Rr6MeVhLKaXocHA45QRcVdF8QmO1lYBdIxsF1lhK.jpg', 'images/0cXkqvmmxT3tn0Q1q6wPuXY6mkxgc214DrL0JVke.png', NULL),
(6, 'тест', 'вапвап', 2, '2024-02-18 09:17:46', '2024-02-18 10:52:44', 'images/DCeHLGorTEZ6q5O3FeP93IGoC0aeoVcWbOexws8f.jpg', 'images/GypIml8ruTnUmZYlh0QemU6nyZsaX5jyuFTNUGTU.jpg', NULL),
(7, 'fh', 'hi', 1, '2024-02-18 09:30:54', '2024-02-18 10:09:20', 'images/flTiwQ30g1XCz7ejT5sBRQiWUpGF5u9q3nc0LDjD.jpg', 'images/riaCZdGS1y8iW9dlHImICDFzJ7zLFVAts6Og5mC6.jpg', NULL),
(8, 'Tsdfgfg', 'fgh', 2, '2024-02-18 09:56:18', '2024-02-18 10:52:20', 'images/5BHoOZHlpFBgRByLmz6soXljQZbnIPJQRh3dLTvk.jpg', 'images/qrOsHPbtjMY1AHM3nW2n1O6aT9rRGWMBDns0X7D8.png', NULL),
(9, 'rthhtyhn', 'fghfgh', 2, '2024-02-18 09:56:31', '2024-02-18 10:53:01', 'images/pJwEI7h2u4zoO8E9kH2GfWnKCrgDD4T6InEpob43.jpg', 'images/p8Ltu038WdBosUWED8GdcM6LZ51M7zYY60mJ4Qih.png', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tags`
--

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 2, 6, NULL, NULL),
(3, 3, 5, NULL, NULL),
(4, 4, 5, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `post_user_likes`
--

CREATE TABLE `post_user_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_user_likes`
--

INSERT INTO `post_user_likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, NULL, NULL),
(6, 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tutorial', '2024-02-10 15:22:45', '2024-02-10 15:22:45', NULL),
(4, 'hihi', '2024-02-10 15:29:19', '2024-02-10 15:29:21', '2024-02-10 15:29:21'),
(5, 'C++', '2024-02-11 13:19:56', '2024-02-11 13:19:56', NULL),
(6, 'PHP', '2024-02-11 13:20:06', '2024-02-11 13:20:06', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role` smallint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `role`) VALUES
(1, 'Mitter', '57758gfk@gmail.com', '2024-02-14 13:02:46', '$2y$12$fZWAKMHBBLKXApXdaoa6p.BzofqnL5BOY/wamr1cJ5Azkgest6hEm', NULL, '2024-02-12 11:32:00', '2024-02-12 13:08:17', NULL, 1),
(2, 'Kenny', 'tolstojkola7@gmail.com', NULL, '$2y$12$uJtpGoe1gqoOWqCMq.CP9OY70UQtLwkyBRTjkAr9Ej9wI3zLR3qF.', NULL, '2024-02-12 11:49:28', '2024-02-12 12:19:13', NULL, NULL),
(3, 'Ronald', 'zizulabogdan@gmail.com', NULL, '$2y$12$igLhtdm6kAp47g5dDA0aw.oaQFO53DIOi775wYxa4WqBx/aD7G.Kq', NULL, '2024-02-14 10:29:24', '2024-02-14 10:29:24', NULL, NULL),
(6, 'Michael', 'test@gmail.com', '2024-02-14 10:51:42', '$2y$12$ujsXD8Eqyd81cYvAT6XbROr.4YrfarAJV.JJMHfCh.W5RGqF34jay', NULL, '2024-02-14 10:45:37', '2024-02-14 10:51:42', NULL, NULL),
(7, 'Богдан', 'morenplayah@gmail.com', NULL, '$2y$12$jgEE0elMTnRNR4pFcIpPN.C1jlQuKuVZ.uRcECURWg2KOvkybIxDe', NULL, '2024-02-14 11:03:37', '2024-02-14 11:03:37', NULL, 0),
(8, 'Vasyl', 'vasylzhizhula@gmail.com', '2024-02-16 21:00:00', '$2y$12$96MK2u.y2ZxPJpxKdz827e4Ez6EsBvEV1/aelR1FGnYdWNosP7wdS', NULL, '2024-02-17 15:11:28', '2024-02-17 15:11:28', NULL, 1),
(10, 'Zhizhula Vasyl', 'vasyl@gmail.com', '2024-02-17 17:27:17', '$2y$12$kyw5KKDwoK4hFa5s3q3.yO242w5LKNdEfLLe4SIxBbD.p5RCYjaTS', NULL, '2024-02-17 15:20:33', '2024-02-17 15:20:33', NULL, NULL),
(11, 'Валерія', 'va@gmail.com', '2024-02-17 15:27:10', '$2y$12$GBKJ5OvgJWKkDRfy1INy0OlN98XUXgB3BXutldU/tmqLIxZQGra1S', NULL, '2024-02-17 15:26:26', '2024-02-17 15:27:10', NULL, NULL),
(12, 'Kenny', 'dfedorinin@gmail.com', '2024-02-17 15:28:32', '$2y$12$Fq7g/ljjoLepuCEGnlYYle52JLh2p84v8fZHwZOFtB018dx7hHGQe', NULL, '2024-02-17 15:28:14', '2024-02-17 15:28:32', NULL, NULL),
(13, 'fgjh', 'dfghd@gmail.com', NULL, '$2y$12$Eq1H9CdmuR9qH7x2EAhJWOsXIP7oGQ2vFaENXWl7c4LcAGCwjmESO', NULL, '2024-02-17 15:39:55', '2024-02-17 15:39:55', NULL, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_idx` (`post_id`),
  ADD KEY `comments_user_idx` (`user_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_category_idx` (`category_id`);

--
-- Индексы таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_idx` (`post_id`),
  ADD KEY `post_tag_tag_idx` (`tag_id`);

--
-- Индексы таблицы `post_user_likes`
--
ALTER TABLE `post_user_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pul_post_idx` (`post_id`),
  ADD KEY `pul_user_idx` (`user_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `post_user_likes`
--
ALTER TABLE `post_user_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `post_category_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tag_post_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tag_tag_fk` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_user_likes`
--
ALTER TABLE `post_user_likes`
  ADD CONSTRAINT `pul_post_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `pul_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
