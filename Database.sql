-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 20 2021 г., 17:44
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `auction`
--
CREATE DATABASE IF NOT EXISTS `auction` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `auction`;

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_cost` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_bet` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `max_bet_login` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `image` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`id`, `title`, `final_cost`, `expires`, `max_bet`, `max_bet_login`, `image`, `status`) VALUES
(1, 'Гранта Спорт', '7500000', '1632234420', '0', '0', '243bf78bb6e07e5a929d677d8b00429e.jpeg', 'active'),
(2, 'Куртка с Алиэкспресс', '7523', '1632213060', '0', '0', '99180433fa44155a2b2db5d825ebeb04.jpeg', 'active'),
(3, 'Пиво светлое', '150', '1632306420', '0', '0', 'd266e6ed599a8f9ffe9252c9cb9a686c.jpeg', 'active'),
(4, 'Ягуар тёмный', '80', '1632220140', '0', '0', '91fa31750449f029d5ded0e23fb18df7.jpeg', 'active'),
(5, 'Новогодний костюм', '12000', '1632226680', '0', '0', 'ccd9da43494a0a445b545a7061126665.jpeg', 'active'),
(6, 'Спортивный костюм', '6500', '1632246240', '0', '0', '152fba0a13b68ba28dd6fc96b1933524.jpeg', 'active'),
(7, 'VR-очки для кота', '45000', '1632229020', '0', '0', 'ea5c018ce04336c892418ef3295385da.jpeg', 'active'),
(8, 'Конь', '25000', '1632303600', '0', '0', 'bae9219cf9b099e27286bd0b3e386328.gif', 'active'),
(9, 'Спортивный костюм на мальчика 13 лет адидас оригинальный', '3500', '1632294960', '0', '0', '9743ece8307bfdfe05563f8ce2fc8a77.jpeg', 'active'),
(10, 'Супер крутой кампутер Ryazan Mad Nidivia 8 FeGorce 8006000 2 ядра 2 гига', '78000', '1632391080', '0', '0', 'a4cf0136fd67ace0bb9ec27b56644cd5.jpeg', 'active'),
(11, 'Модная футболка с принтом Лада 2108', '700', '1632388140', '0', '0', '5dbff14f582e237315907dfe98f336c7.jpeg', 'active'),
(12, 'Старый монитор с грустной мордочкой', '4500', '1632282480', '0', '0', '62973295d80df54d328e8f3a93c8d73d.jpeg', 'active');

-- --------------------------------------------------------

--
-- Структура таблицы `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `id_lot` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bet` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `login`, `password`, `telephone`, `admin`) VALUES
(1, 'test@test.com', 'admin', 'admin', '+7(123) 456-7890', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- База данных: `internet traffic accounting`
--
CREATE DATABASE IF NOT EXISTS `internet traffic accounting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `internet traffic accounting`;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- База данных: `music_site`
--
CREATE DATABASE IF NOT EXISTS `music_site` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `music_site`;

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя',
  `position` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Роль',
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Дополнительный список участников в релизе';

--
-- Дамп данных таблицы `credits`
--

INSERT INTO `credits` (`id`, `name`, `position`, `link`, `icon`) VALUES
(1, 'Ariimaw', 'Cover Artist', 'https://instagram.com/ariimaw', 'data:image/png;base64,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'),
(2, 'Panda Eyes', 'Collaborating Artist', 'https://soundcloud.com/officialpandaeyes', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAAEy0lEQVR4nO2d34sWVRjHP0pGm7C1rleFigtqtYXWgoIoW2GX+id4s1mX0VVtEv68CC+8URSzkBIU/ReCLNcINCSwtsIKXE0hSbBwd71ZuzgzOLzMOfPj/Jp55/nAc/P+mOec85153jPPc+a8IAiCIAiCIAiC0B6eBA4Bd4BbwGlgG7A4ZqO6xCHgUY7NAAeANfGa1g3ukC9A1n4A3gOWRWpjX1M0+FmbA84D24EnYjS2H6kiQNZuAZ8gIcqaugLkhajhwG3vC1wIICHKAt1gHgBuGN4vshngIBKiCtENIKh7gS3ACeA/w2clRFlgEiDLIDABTAELhu+Z7AHqRu9Nb71pIWUFyLIG+xB1FdjhtivtpI4AKYtRaYvTqLO7jhBnUFdXZ7ERIMsgsBP4iuoh6hrwnE0n2owrAbKsBD4A/jAcv9d+BJZa+m0lPgRIqRqivnTkt1X4FCDLIPAucN3g8xHwhgffjSaUAClPAccNfr/36LuRhBYg5VOD7/UB/DeGWAI8jf4+Yl/Vg0n5rjqzwFHNe1tCNiQ2uisgxEk1qvE9E8B3Y9AJcAP/NeEBje9Zjz4bR9HcfAGVgJvAT8og1m9QY6iSMkizmS6XrYgANc1VTVgEcGA2y1ZEAIdWpyYsAmjMtuBSdhYlAmgM3NeE80KUCKCxXmwKLqYQJQJozISLmnAaokQAjZXBVYgSAXKsKi5ClAiAmwGoUxMWAXA/ADYhqjOEGoBB4G3Kraz7x4P/xhLjDExnUTMa34c9+28UMUNAdtnKvcQOox4crMQit+0Kim6wW9UnqQlHRgSIjAgQGREgMiJAZESAyIgAkREBIiMCRCbUU+EjqAcYxoAXgRWoOuszyfv3UbfzN1GP/EwBl4C/A7WvLxkC3gemqZ9bv5Yc49mc43c+HaxjBPiM+o9/5tkD4CSwOuNHBOhhCbAftYLA1cD32hywN/ElAmRYCVzB38D32mXDe53jNcptHxbKWoVt7vxl4BvK7SbyC/AtanbzM6p8l5bwhhMbBbYC48ALNdvUqnqADcuAPzGfjfPAKWBjjeNvTL47X+Cj1VeADecwD8TXwFoHftYCFwp8dU6At9APwALwIW5DwSJgknILpzrBJfSDP+HR7y6KReh7NqDv/JEA/o8Z/HdCgP3kd/wmaj8F3wygnvPqCwHqZEM3a14/iZqx+GYO+DyAn8byF/ln3qsB2zCmaUPrroA66ObleRlLXwxp2tA6AeqEoCZ3snVbBdQR4J7m9RGbhlRE5+t2wDY4oY4A05rXt9s0pCK6fTt/C9iGaOxDPw0dCOB/AP1EYDKA/+i8gv4HULeRkUtMN2Iuck+tYAp9KmKXR7/vaPymyb/OsA1zMm6S8Mm4cYf+WsFZzDmZC8A6B37WUZyO7uTGqUPA75gHZh74AthU4/ibku8WFWSuE/Ym0Cm2YWIUVZJcXuKzvwIXUb8f08BdHpcklyc2ino8dJxyV89d4HX0U+NOsAF1A2Q6S33YbTq2UaqJFZiXiri2y4lPIcMSYA8qH+Nr4GeBj5F/OjKyCrWa4SHuBv4hqgawKmA/Ws/zwG7sFuf+BHxEH/9LRahFTKtRs5Ux4CVU/B7m8Yaq/6JmROny9IvAd6hZjiAIgiAIgiAIQl/xP4n0wh8gfJT6AAAAAElFTkSuQmCC'),
(3, 'Canonblade', 'Collaborating Artist', 'https://www.youtube.com/canonblade', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAAEy0lEQVR4nO2d34sWVRjHP0pGm7C1rleFigtqtYXWgoIoW2GX+id4s1mX0VVtEv68CC+8URSzkBIU/ReCLNcINCSwtsIKXE0hSbBwd71ZuzgzOLzMOfPj/Jp55/nAc/P+mOec85153jPPc+a8IAiCIAiCIAiC0B6eBA4Bd4BbwGlgG7A4ZqO6xCHgUY7NAAeANfGa1g3ukC9A1n4A3gOWRWpjX1M0+FmbA84D24EnYjS2H6kiQNZuAZ8gIcqaugLkhajhwG3vC1wIICHKAt1gHgBuGN4vshngIBKiCtENIKh7gS3ACeA/w2clRFlgEiDLIDABTAELhu+Z7AHqRu9Nb71pIWUFyLIG+xB1FdjhtivtpI4AKYtRaYvTqLO7jhBnUFdXZ7ERIMsgsBP4iuoh6hrwnE0n2owrAbKsBD4A/jAcv9d+BJZa+m0lPgRIqRqivnTkt1X4FCDLIPAucN3g8xHwhgffjSaUAClPAccNfr/36LuRhBYg5VOD7/UB/DeGWAI8jf4+Yl/Vg0n5rjqzwFHNe1tCNiQ2uisgxEk1qvE9E8B3Y9AJcAP/NeEBje9Zjz4bR9HcfAGVgJvAT8og1m9QY6iSMkizmS6XrYgANc1VTVgEcGA2y1ZEAIdWpyYsAmjMtuBSdhYlAmgM3NeE80KUCKCxXmwKLqYQJQJozISLmnAaokQAjZXBVYgSAXKsKi5ClAiAmwGoUxMWAXA/ADYhqjOEGoBB4G3Kraz7x4P/xhLjDExnUTMa34c9+28UMUNAdtnKvcQOox4crMQit+0Kim6wW9UnqQlHRgSIjAgQGREgMiJAZESAyIgAkREBIiMCRCbUU+EjqAcYxoAXgRWoOuszyfv3UbfzN1GP/EwBl4C/A7WvLxkC3gemqZ9bv5Yc49mc43c+HaxjBPiM+o9/5tkD4CSwOuNHBOhhCbAftYLA1cD32hywN/ElAmRYCVzB38D32mXDe53jNcptHxbKWoVt7vxl4BvK7SbyC/AtanbzM6p8l5bwhhMbBbYC48ALNdvUqnqADcuAPzGfjfPAKWBjjeNvTL47X+Cj1VeADecwD8TXwFoHftYCFwp8dU6At9APwALwIW5DwSJgknILpzrBJfSDP+HR7y6KReh7NqDv/JEA/o8Z/HdCgP3kd/wmaj8F3wygnvPqCwHqZEM3a14/iZqx+GYO+DyAn8byF/ln3qsB2zCmaUPrroA66ObleRlLXwxp2tA6AeqEoCZ3snVbBdQR4J7m9RGbhlRE5+t2wDY4oY4A05rXt9s0pCK6fTt/C9iGaOxDPw0dCOB/AP1EYDKA/+i8gv4HULeRkUtMN2Iuck+tYAp9KmKXR7/vaPymyb/OsA1zMm6S8Mm4cYf+WsFZzDmZC8A6B37WUZyO7uTGqUPA75gHZh74AthU4/ibku8WFWSuE/Ym0Cm2YWIUVZJcXuKzvwIXUb8f08BdHpcklyc2ino8dJxyV89d4HX0U+NOsAF1A2Q6S33YbTq2UaqJFZiXiri2y4lPIcMSYA8qH+Nr4GeBj5F/OjKyCrWa4SHuBv4hqgawKmA/Ws/zwG7sFuf+BHxEH/9LRahFTKtRs5Ux4CVU/B7m8Yaq/6JmROny9IvAd6hZjiAIgiAIgiAIQl/xP4n0wh8gfJT6AAAAAElFTkSuQmCC'),
(4, 'raspurrry', 'Cover Artist', 'https://www.instagram.com/raspurrry/', 'data:image/png;base64,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'),
(5, 'Umairih', 'Vocalist', 'https://instagram.com/umairih', 'data:image/png;base64,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'),
(8, 'NULL', 'NULL', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Структура таблицы `releases`
--

CREATE TABLE `releases` (
  `id` int(11) NOT NULL COMMENT 'id',
  `artist` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Артист',
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название трека',
  `cover` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название обложки',
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Сингл, альбом...',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание',
  `artist_1` int(11) NOT NULL COMMENT 'Collab artist 1',
  `artist_2` int(11) NOT NULL COMMENT 'Collab artist 2',
  `demo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `download` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ссылка на скачивание',
  `btn_color` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Цвет кнопки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `releases`
--

INSERT INTO `releases` (`id`, `artist`, `title`, `cover`, `type`, `description`, `artist_1`, `artist_2`, `demo`, `download`, `btn_color`) VALUES
(1, 'Panda Eyes & Geoxor', 'Lucid Dream', 'luciddream', 'Single', 'Panda Eyes contacted me one day and asked me to make a tune together, 1 week~ later he sent me this melody, I worked on the vocal chops and the initial drop, which then in the end he edited once more and we finally released it, one of my proudest collabs yet.', 1, 2, './audio/demo/Panda Eyes, Geoxor - Lucid Dream.mp3', './audio/Panda Eyes, Geoxor - Lucid Dream.mp3', 'background: radial-gradient(circle at left top, rgb(253, 193, 246), rgb(254, 152, 223));'),
(2, 'Geoxor', 'Virtual', 'virtual', 'Single', 'Virtual is a tune about a girl lost in an unknown dimension. She asks a virtual entity she found where she is and if she\'s in reality or in a dream. As she explores the dimension, her surroundings change based on her emotions.', 1, 5, './audio/demo/Geoxor - Virtual.mp3', './audio/Geoxor - Virtual.mp3', 'background: radial-gradient(circle at left top, rgb(247, 154, 251), rgb(165, 208, 251));'),
(3, 'Geoxor', 'Euphoria', 'euphoria', 'Single', 'The original idea behind Euphoria was to have a very saturated bass with vocal chops, which started with the intro climax, the vocal chops, and the bass. Everything else was designed after them, and this song soon became one of my favorite ones that I\'ve produced.', 1, 8, './audio/demo/Geoxor - Euphoria.mp3', './audio/Geoxor - Euphoria.mp3', 'background: radial-gradient(circle at left top, rgb(185, 220, 248), rgb(255, 186, 221));'),
(4, 'Geoxor', 'Faerie', 'faerie', 'Single', 'Lately I\'ve been running into a lot of issues with my computer blue screening, power outages, and file corruptions, I lost the project file for this tune alongside many others, but since everyone wanted it to be out, I decided to release it, hope you enjoy!', 1, 8, './audio/demo/Geoxor - Faerie.mp3', './audio/Geoxor - Faerie.mp3', 'background: radial-gradient(circle at left top, rgb(255, 165, 203), rgb(254, 243, 214));'),
(5, 'Geoxor', 'Shaii', 'shaii', 'Single', 'One night I woke up at 3AM with the idea of singing like a flute with my voice and distorting the shit out of the sound, it just so happened that I had Ariimaw\'s Shaii oc as my wallpaper on my desktop, and that inspired me to create this tune overnight.', 1, 8, './audio/demo/Geoxor - Shaii.mp3', './audio/Geoxor - Shaii.mp3', 'background: radial-gradient(circle at left top, rgb(254, 4, 168), rgb(45, 201, 236));'),
(6, 'Geoxor', 'Twilight', 'twilight', 'Single', 'This tune went better than I anticipated, when I introduced the violins the whole wip changed around for me, and I got inspired to add a euphoria style bass again with vocal chops but this time a lot faster at 174BPM.', 1, 4, './audio/demo/Geoxor - Twilight.mp3', './audio/Geoxor - Twilight.mp3', 'background: radial-gradient(circle at left top, rgb(252, 105, 219), rgb(168, 116, 224));'),
(7, 'Geoxor', 'Irreversible', 'irreversible', 'EP', 'Geoxor - Move, Geoxor - Poi, Geoxor - Woosh, Geoxor - Abandoned, Geoxor - Gloom', 1, 8, './audio/demo/Geoxor - Irreversible EP.mp3', './audio/Geoxor - Irreversible EP.zip', 'background: radial-gradient(circle at left top, rgb(58, 57, 58), rgb(255, 0, 141));'),
(8, 'Geoxor', 'Moneko', 'moneko', 'Single', 'Inspired by Tisoki, this tune aims to be like future bass but in a more modern, melodic and heavy way than most traditional future bass.', 1, 8, './audio/demo/Geoxor - Moneko.mp3', './audio/Geoxor - Moneko.mp3', 'background: radial-gradient(circle at left top, rgb(57, 2, 208), rgb(191, 2, 204));'),
(11, 'Geoxor & Canonblade', 'Sakura', 'sakura', 'Single', 'Coindently the day of release happened to be my birthday haha!, anyway hope you guys enjoy this collab with canon, was pretty fun to make.', 1, 3, './audio/demo/Geoxor, Canonblade - Sakura.mp3', './audio/Geoxor, Canonblade - Sakura.mp3', 'background: radial-gradient(circle at left top, rgb(253, 193, 227), rgb(194, 210, 251));'),
(12, 'Geoxor', 'Nana', 'nana', 'Single', 'This tune was one of my biggest bangers, Knife Party played it on Ultra 2019, it was the first time one of my songs has been played live, always loved combining angry basses and vocal chops.', 1, 8, './audio/demo/Geoxor - Nana.mp3', './audio/Geoxor - Nana.mp3', 'background: radial-gradient(circle at left top, rgb(190, 90, 99), rgb(49, 6, 40));'),
(13, 'Geoxor', 'Stardust', 'stardust', 'Album', 'Geoxor - Only Now, \r\nGeoxor - Stardust, \r\nGeoxor - Take Me Home, \r\nGeoxor - Shaii, \r\nGeoxor - Euphoria, \r\nGeoxor - Nana, \r\nGeoxor - Restart, \r\nGeoxor - Cheese, \r\nGeoxor - Lollipop, ', 1, 8, './audio/demo/Geoxor - Stardust (Album).mp3', './audio/Geoxor - Stardust (Album).zip', 'background: radial-gradient(circle at left top, rgb(70, 61, 160), rgb(173, 46, 170));'),
(14, 'Geoxor', 'Galaxy', 'galaxy', 'Single', 'Thought i\'d make something like bad computer again haha, here you go.', 1, 8, './audio/demo/Geoxor - Galaxy.mp3', './audio/Geoxor - Galaxy.mp3', 'background: radial-gradient(circle at left top, rgb(233, 122, 239), rgb(0, 224, 251));'),
(15, 'Geoxor', 'Aether', 'aether', 'Single', 'This tune unfortunally got corrupted back then when the USB corruption happened, I had lost the project so I couldn\'t entirely recreate how it was but I still decided to release it for yall ^^', 1, 8, './audio/demo/Geoxor - Aether.mp3', './audio/Geoxor - Aether.mp3', 'background: radial-gradient(circle at left top, rgb(129, 244, 215), rgb(238, 1, 168));');

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_week` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_place` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_tickets` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`id`, `title`, `place`, `day`, `month`, `day_of_week`, `link_place`, `link_tickets`) VALUES
(2, 'World of Sound', 'Greece, Athens', '21', 'Jun', 'Mone', 'https://www.google.com/maps/d/u/0/viewer?mid=1JAKkxTNAitrWoJfBbmXQSYmCCRw&hl=ru&ll=37.99164036555748%2C23.736049437602198&z=12', 'https://www.avito.ru'),
(3, 'Energy Booming', 'Italy, Rome', '3', 'Jul', 'Sat', 'https://www.google.com/maps/d/u/0/viewer?hl=ru&mid=1nENpCV7Cy_e_5VJAULYmqeu1TIU&ll=41.68011651132058%2C12.573592000000016&z=10', 'https://www.avito.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `releases`
--
ALTER TABLE `releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credits` (`artist_1`),
  ADD KEY `collab_artist` (`artist_2`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `releases`
--
ALTER TABLE `releases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `releases`
--
ALTER TABLE `releases`
  ADD CONSTRAINT `releases_ibfk_1` FOREIGN KEY (`artist_1`) REFERENCES `credits` (`id`),
  ADD CONSTRAINT `releases_ibfk_2` FOREIGN KEY (`artist_2`) REFERENCES `credits` (`id`);
--
-- База данных: `schema_name`
--
CREATE DATABASE IF NOT EXISTS `schema_name` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `schema_name`;
--
-- База данных: `shisen`
--
CREATE DATABASE IF NOT EXISTS `shisen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `shisen`;

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя',
  `position` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Роль',
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Дополнительный список участников в релизе';

--
-- Дамп данных таблицы `credits`
--

INSERT INTO `credits` (`id`, `name`, `position`, `link`, `icon`) VALUES
(1, 'Ariimaw', 'Cover Artist', 'https://instagram.com/ariimaw', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAAG+UlEQVR4nO2cW6hVRRjHf9s4nqOmCZpZB4tSsR40K0wLkcjyUlmnC2ZZCl0ohSh6CBTMoAtZWVAZPVRaoFARJSkRRYZamZIVRmmSZKndPOalPMc4x9PDdzZst2u+WZdZe7vWmh/M017rm2/9/3vPmpk9M+DxeDweTz45F/gIOAh8DUyqbzrFYjSwF+iqKJ3A7HomVRSCxPcm1AhNfG9CyoQRv9KEWfVJM59EEb9cOvAmOCGO+N4ERyQR35uQEBfiexNi4lJ8b0JE0hDfmxCSNMX3JliohfjeBAO1FN+bUEU9xPcmdFNP8QtvwokgfmFNOJHEL5wJFwL7SCbWXmAu0AJ8ljBWtQkz03v0+mMTvwOZy/9FueZPYGRFzP7AP8r13oRuwoh/e/e1MwzXVItfZqcS15sAXA4cIJz4ZW4BtnV/3g58AAwNiN2ixPUmABOBf4kmfiX9gQbDZ0OA/UrswptgE78LWJwg/mJL7EKbEEb8LqANmByzjq9CxC+kCWHFT2rC9xHqKIwJUcVPYsI7EeK3I72oXJsQ5oXbrnwe1YQpSqxy2dadV/lFfibwSoj7tGe4NUKONSNsb2cyIrQrE15UYm0GBhrue1m5L3Mm2MRvR/rrZVyaUALmAL9W3H8QeA7oo9x3KnBUySEzJoQR/6qA+1z/EkrAOcB5QGPIe3Yo9WfChAno8zBHgGnK/ZOAw5b7r0kpd4C/lLqjmKANJFNjJLp4pm9+Na5/CWEZrdQZx4SJKeSo8paSUFjxy9TahN7ARqW+OGWTw/xC8YUhkQ6iiV+mVib0BtYo9cQt+xzkFomnlWTitttpm3ASsEqJn6SsTpBXLAYBrYZkfkbvAmqkacI9StwkZS8wPGZOibhbSWp+grhpmfCdEjOJ+KNj5OKEHsA3hsT2IXP5cXFtQn8lVibFLzMVc4KPJYzt0oQhSpzMil/mU4KT3A+cnDC2KxMakYFd7sQHGId5XuVeB/HDmBBmo/ZqJUZmxS+zkuCEtziK78KEccg4JXfig6x8MCV+vqM6XJgwF9nGmivxQWYjTX8RPuSwHhcmTAK+VWIEiX+Bw2dIjfkEP8Anjutx9U4YDqxQ4mRKfDDPMLYhYwaXuDBhNnpzlCnxQZoh0wq45hTqS2KCTfxWMiY+QE/gN4If6OyU6oxjwixyKP5gYB3mhxqQYt1RTMil+GOBXZgfytVYQCOMCc+SQ/HvQF/r47obqmEzQSuZE78BWIL9wdYTfpWCC+KYkDnxTwPWYn+w94C+dcgvigmtyOaRzDCGYxdBBZVOYCHSLa0Xk7E3jZkTfyb6UpQuZFXa9fVKsIIZ6BNvfyNfpkzQALyA/ef8A3KeZxRKSPt7LSLaZcDpCfO9Dr23c4AMffMHInM5NvFXAv0ixG0CHsa8I/InZH3nRRHznYLe/h8GrogYs26MxL5+8ijwCNHa+75E29+7FrgB+3xSGPGvjJBnXWkBDqELcwD5uUehBLxrias1cab6ciN+CViAfen2VqK39yDNThzxK8s6jm3DcyN+H+Bt7AKsAk6JEX8a8f6NCiodyDviRnIi/lnIKeS2B1+ELPGLygj0Pb0bkD1fP4bIIWzJjPiXAH+gP0wb8dfB90Pf0bgemcouMxSYhz7Blxvxb8Y+bN+DzHjGoYRMSZhi70KmsoNoQAZ/2y35ZVb8+dhftptI9m/WQiV2O7JUxEYDcB/mxcCZE78H4WYyVwC9EtRje+neGTHeIOANJV4mxG/AvhKgE/l1JJlMs710X0oQeyqwuyreITIgPsBS7C/b6Qnr6IcMmkx1rOPYl24cBiCbRJYSfy9CzXkQXfxWYHzCOnoA7yt1aC/dXDMM+A+zMDuIN7KtZpFSRztwsYM6MslyzMJsRP7lSsptSh1dwF0O6sgkQzD3Rjbgpg0diz6eWOKgjswyh2BRDgJnOIjfjAzWTOKvwXzsWCEwjUSfrLquEelZ7EG6eU9g7630QgZr2rvFdGJJYdhCsDjV/zY9E3CNts+rhD6mOETwMZOFw3QoRfUoN2hCbqcS17QcvTyYazHfWiyCRqRHOb5djmLAdPRphgVOnyDjbCVYpGFV1wU1QY8GxBuP3uN5k/quCTrh+Jhgoe6vuq4ReAp5Ce8CHuf4l/AI9JPPNyMHYngqmEewWDuR5SFhGYQsFzGJ/ztyKJ6nilGYRVsWMkYv4HMlThvyz5rHgLZ54lX0X0IzMmLWejw3pZV4XpiAWcByc/QAsnOwJ9KOj0Em12zn89dq/X/mWYYuZJzyfE2fIOM0oTclUcty3G8/zT2DgS9JLv5rFHyCLQlNwOvEE/4Ix48fPDG5lPAnCHYiR1VWj549BqJMBYwCrkYOH21GNkgcQeaGtgMfImft7Haco8fjyS3/A/XZ/Hc365TyAAAAAElFTkSuQmCC'),
(2, 'Panda Eyes', 'Collaborating Artist', 'https://soundcloud.com/officialpandaeyes', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAAEy0lEQVR4nO2d34sWVRjHP0pGm7C1rleFigtqtYXWgoIoW2GX+id4s1mX0VVtEv68CC+8URSzkBIU/ReCLNcINCSwtsIKXE0hSbBwd71ZuzgzOLzMOfPj/Jp55/nAc/P+mOec85153jPPc+a8IAiCIAiCIAiC0B6eBA4Bd4BbwGlgG7A4ZqO6xCHgUY7NAAeANfGa1g3ukC9A1n4A3gOWRWpjX1M0+FmbA84D24EnYjS2H6kiQNZuAZ8gIcqaugLkhajhwG3vC1wIICHKAt1gHgBuGN4vshngIBKiCtENIKh7gS3ACeA/w2clRFlgEiDLIDABTAELhu+Z7AHqRu9Nb71pIWUFyLIG+xB1FdjhtivtpI4AKYtRaYvTqLO7jhBnUFdXZ7ERIMsgsBP4iuoh6hrwnE0n2owrAbKsBD4A/jAcv9d+BJZa+m0lPgRIqRqivnTkt1X4FCDLIPAucN3g8xHwhgffjSaUAClPAccNfr/36LuRhBYg5VOD7/UB/DeGWAI8jf4+Yl/Vg0n5rjqzwFHNe1tCNiQ2uisgxEk1qvE9E8B3Y9AJcAP/NeEBje9Zjz4bR9HcfAGVgJvAT8og1m9QY6iSMkizmS6XrYgANc1VTVgEcGA2y1ZEAIdWpyYsAmjMtuBSdhYlAmgM3NeE80KUCKCxXmwKLqYQJQJozISLmnAaokQAjZXBVYgSAXKsKi5ClAiAmwGoUxMWAXA/ADYhqjOEGoBB4G3Kraz7x4P/xhLjDExnUTMa34c9+28UMUNAdtnKvcQOox4crMQit+0Kim6wW9UnqQlHRgSIjAgQGREgMiJAZESAyIgAkREBIiMCRCbUU+EjqAcYxoAXgRWoOuszyfv3UbfzN1GP/EwBl4C/A7WvLxkC3gemqZ9bv5Yc49mc43c+HaxjBPiM+o9/5tkD4CSwOuNHBOhhCbAftYLA1cD32hywN/ElAmRYCVzB38D32mXDe53jNcptHxbKWoVt7vxl4BvK7SbyC/AtanbzM6p8l5bwhhMbBbYC48ALNdvUqnqADcuAPzGfjfPAKWBjjeNvTL47X+Cj1VeADecwD8TXwFoHftYCFwp8dU6At9APwALwIW5DwSJgknILpzrBJfSDP+HR7y6KReh7NqDv/JEA/o8Z/HdCgP3kd/wmaj8F3wygnvPqCwHqZEM3a14/iZqx+GYO+DyAn8byF/ln3qsB2zCmaUPrroA66ObleRlLXwxp2tA6AeqEoCZ3snVbBdQR4J7m9RGbhlRE5+t2wDY4oY4A05rXt9s0pCK6fTt/C9iGaOxDPw0dCOB/AP1EYDKA/+i8gv4HULeRkUtMN2Iuck+tYAp9KmKXR7/vaPymyb/OsA1zMm6S8Mm4cYf+WsFZzDmZC8A6B37WUZyO7uTGqUPA75gHZh74AthU4/ibku8WFWSuE/Ym0Cm2YWIUVZJcXuKzvwIXUb8f08BdHpcklyc2ino8dJxyV89d4HX0U+NOsAF1A2Q6S33YbTq2UaqJFZiXiri2y4lPIcMSYA8qH+Nr4GeBj5F/OjKyCrWa4SHuBv4hqgawKmA/Ws/zwG7sFuf+BHxEH/9LRahFTKtRs5Ux4CVU/B7m8Yaq/6JmROny9IvAd6hZjiAIgiAIgiAIQl/xP4n0wh8gfJT6AAAAAElFTkSuQmCC'),
(3, 'Canonblade', 'Collaborating Artist', 'https://www.youtube.com/canonblade', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAAEy0lEQVR4nO2d34sWVRjHP0pGm7C1rleFigtqtYXWgoIoW2GX+id4s1mX0VVtEv68CC+8URSzkBIU/ReCLNcINCSwtsIKXE0hSbBwd71ZuzgzOLzMOfPj/Jp55/nAc/P+mOec85153jPPc+a8IAiCIAiCIAiC0B6eBA4Bd4BbwGlgG7A4ZqO6xCHgUY7NAAeANfGa1g3ukC9A1n4A3gOWRWpjX1M0+FmbA84D24EnYjS2H6kiQNZuAZ8gIcqaugLkhajhwG3vC1wIICHKAt1gHgBuGN4vshngIBKiCtENIKh7gS3ACeA/w2clRFlgEiDLIDABTAELhu+Z7AHqRu9Nb71pIWUFyLIG+xB1FdjhtivtpI4AKYtRaYvTqLO7jhBnUFdXZ7ERIMsgsBP4iuoh6hrwnE0n2owrAbKsBD4A/jAcv9d+BJZa+m0lPgRIqRqivnTkt1X4FCDLIPAucN3g8xHwhgffjSaUAClPAccNfr/36LuRhBYg5VOD7/UB/DeGWAI8jf4+Yl/Vg0n5rjqzwFHNe1tCNiQ2uisgxEk1qvE9E8B3Y9AJcAP/NeEBje9Zjz4bR9HcfAGVgJvAT8og1m9QY6iSMkizmS6XrYgANc1VTVgEcGA2y1ZEAIdWpyYsAmjMtuBSdhYlAmgM3NeE80KUCKCxXmwKLqYQJQJozISLmnAaokQAjZXBVYgSAXKsKi5ClAiAmwGoUxMWAXA/ADYhqjOEGoBB4G3Kraz7x4P/xhLjDExnUTMa34c9+28UMUNAdtnKvcQOox4crMQit+0Kim6wW9UnqQlHRgSIjAgQGREgMiJAZESAyIgAkREBIiMCRCbUU+EjqAcYxoAXgRWoOuszyfv3UbfzN1GP/EwBl4C/A7WvLxkC3gemqZ9bv5Yc49mc43c+HaxjBPiM+o9/5tkD4CSwOuNHBOhhCbAftYLA1cD32hywN/ElAmRYCVzB38D32mXDe53jNcptHxbKWoVt7vxl4BvK7SbyC/AtanbzM6p8l5bwhhMbBbYC48ALNdvUqnqADcuAPzGfjfPAKWBjjeNvTL47X+Cj1VeADecwD8TXwFoHftYCFwp8dU6At9APwALwIW5DwSJgknILpzrBJfSDP+HR7y6KReh7NqDv/JEA/o8Z/HdCgP3kd/wmaj8F3wygnvPqCwHqZEM3a14/iZqx+GYO+DyAn8byF/ln3qsB2zCmaUPrroA66ObleRlLXwxp2tA6AeqEoCZ3snVbBdQR4J7m9RGbhlRE5+t2wDY4oY4A05rXt9s0pCK6fTt/C9iGaOxDPw0dCOB/AP1EYDKA/+i8gv4HULeRkUtMN2Iuck+tYAp9KmKXR7/vaPymyb/OsA1zMm6S8Mm4cYf+WsFZzDmZC8A6B37WUZyO7uTGqUPA75gHZh74AthU4/ibku8WFWSuE/Ym0Cm2YWIUVZJcXuKzvwIXUb8f08BdHpcklyc2ino8dJxyV89d4HX0U+NOsAF1A2Q6S33YbTq2UaqJFZiXiri2y4lPIcMSYA8qH+Nr4GeBj5F/OjKyCrWa4SHuBv4hqgawKmA/Ws/zwG7sFuf+BHxEH/9LRahFTKtRs5Ux4CVU/B7m8Yaq/6JmROny9IvAd6hZjiAIgiAIgiAIQl/xP4n0wh8gfJT6AAAAAElFTkSuQmCC'),
(4, 'raspurrry', 'Cover Artist', 'https://www.instagram.com/raspurrry/', 'data:image/png;base64,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'),
(5, 'Umairih', 'Vocalist', 'https://instagram.com/umairih', 'data:image/png;base64,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'),
(8, 'NULL', 'NULL', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Структура таблицы `releases`
--

CREATE TABLE `releases` (
  `id` int(11) NOT NULL COMMENT 'id',
  `artist` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Артист',
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название трека',
  `cover` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название обложки',
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Сингл, альбом...',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание',
  `artist_1` int(11) NOT NULL COMMENT 'Collab artist 1',
  `artist_2` int(11) NOT NULL COMMENT 'Collab artist 2',
  `demo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `download` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ссылка на скачивание',
  `btn_color` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Цвет кнопки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `releases`
--

INSERT INTO `releases` (`id`, `artist`, `title`, `cover`, `type`, `description`, `artist_1`, `artist_2`, `demo`, `download`, `btn_color`) VALUES
(1, 'SHISEN', 'bleakness', 'bleakness.jpg', 'Single', 'Stuff about dark side', 8, 8, './audio/SHISEN - bleakness.mp3', './audio/SHISEN - bleakness.mp3', 'background-image: linear-gradient(111deg, rgb(183 2 145), rgb(1 156 200));'),
(2, 'SHISEN', 'La-La-La Love Song', 'La-La-La Love Song.jpg', 'Single', 'Song ', 8, 8, './audio/SHISEN - La-La-La Love Song.mp3', './audio/SHISEN - La-La-La Love Song.mp3', 'background-image: linear-gradient( 111deg , rgb(151 19 152), rgb(27 3 117));');

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_week` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_place` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_tickets` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`id`, `title`, `place`, `day`, `month`, `day_of_week`, `link_place`, `link_tickets`) VALUES
(1, 'World of Sound', 'Greece, Athens', '21', 'Jun', 'Mon', 'https://www.google.com/maps/d/u/0/viewer?mid=1JAKkxTNAitrWoJfBbmXQSYmCCRw&hl=ru&ll=37.99164036555748%2C23.736049437602198&z=12', 'https://www.avito.ru'),
(2, 'Energy Booming', 'Italy, Rome', '03', 'Jul', 'Sat', 'https://www.google.com/maps/d/u/0/viewer?hl=ru&mid=1nENpCV7Cy_e_5VJAULYmqeu1TIU&ll=41.68011651132058%2C12.573592000000016&z=10', 'https://www.avito.ru'),
(4, 'World of Sound', 'Greece, Athens', '21', 'Jun', 'Mon', 'https://www.google.com/maps/d/u/0/viewer?mid=1JAKkxTNAitrWoJfBbmXQSYmCCRw&hl=ru&ll=37.99164036555748%2C23.736049437602198&z=12', 'https://www.avito.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `releases`
--
ALTER TABLE `releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credits` (`artist_1`),
  ADD KEY `collab_artist` (`artist_2`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `releases`
--
ALTER TABLE `releases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `releases`
--
ALTER TABLE `releases`
  ADD CONSTRAINT `releases_ibfk_1` FOREIGN KEY (`artist_1`) REFERENCES `credits` (`id`),
  ADD CONSTRAINT `releases_ibfk_2` FOREIGN KEY (`artist_2`) REFERENCES `credits` (`id`);
--
-- База данных: `users`
--
CREATE DATABASE IF NOT EXISTS `users` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `users`;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `login` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
