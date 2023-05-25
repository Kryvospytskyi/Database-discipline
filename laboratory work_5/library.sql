-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Трв 25 2023 р., 08:40
-- Версія сервера: 10.4.27-MariaDB
-- Версія PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `library`
--

-- --------------------------------------------------------

--
-- Структура таблиці `books2`
--

CREATE TABLE `books2` (
  `num` int(20) NOT NULL,
  `code` int(10) NOT NULL DEFAULT 0,
  `is_new` varchar(3) NOT NULL DEFAULT 'No',
  `name` varchar(50) NOT NULL DEFAULT ' ',
  `price` float(5,2) NOT NULL,
  `publisher` smallint(2) NOT NULL DEFAULT 0,
  `pages` int(11) DEFAULT NULL,
  `format` smallint(2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `tirage` int(11) DEFAULT NULL,
  `topic` smallint(3) DEFAULT NULL,
  `category` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `books2`
--

INSERT INTO `books2` (`num`, `code`, `is_new`, `name`, `price`, `publisher`, `pages`, `format`, `date`, `tirage`, `topic`, `category`) VALUES
(2, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 9, 400, 2, '2000-07-24', 5000, 1, 2),
(8, 4985, 'No', 'Засвой самостійно модернізацію та ремонт ПК за 24 ', 18.90, 2, 288, 2, '2000-07-07', 5000, 1, 2),
(9, 5141, 'No', 'Структури даних та алгоритми', 37.80, 2, 384, 2, '2000-09-29', 5000, 1, 2),
(20, 5127, 'Yes', 'Автоматизація інженерно-графічних робіт', 11.58, 3, 256, 2, '2000-06-15', 5000, 1, 2),
(31, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 9, 400, 2, '2000-07-24', 5000, 1, 3),
(46, 5199, 'No', 'Залізо IBM 2001', 30.07, 4, 368, 2, '2000-02-12', 5000, 1, 3),
(50, 3851, 'Yes', 'Захист інформації та безпека комп`ютерних систем', 26.00, 5, 480, 3, NULL, 5000, 1, 4),
(58, 3932, 'No', 'Як перетворити персональний комп`ютер на вимірювал', 7.65, 6, 144, 4, '1999-09-06', 5000, 1, 5),
(59, 4713, 'No', 'Plug-ins. Додаткові програми для музичних програм', 11.41, 6, 144, 2, '2000-02-22', 5000, 1, 5),
(175, 5217, 'No', 'Windows МЕ. Найновіші версії програм', 16.57, 7, 320, 2, '2000-08-25', 5000, 2, 6),
(176, 4829, 'No', 'Windows 2000 Professional крок за кроком з CD', 27.25, 8, 320, 2, '2000-04-28', 5000, 2, 6),
(188, 5170, 'No', 'Linux версії', 24.43, 6, 346, 2, '2000-09-29', 5000, 2, 7),
(191, 860, 'No', 'Операційна система UNIX', 3.50, 9, 395, 5, '1997-05-05', 5000, 2, 8),
(203, 44, 'No', 'Відповіді на актуальні запитання щодо OS/2 Warp', 5.00, 5, 352, 4, '1996-03-20', 5000, 2, 9),
(206, 5176, 'No', 'Windows Ме. Супутник користувача', 12.79, 9, 306, 1, '2000-10-10', 5000, 2, 9),
(209, 5462, 'No', 'Мова програмування С++. Лекції та вправи', 29.00, 5, 656, 3, '2000-12-12', 5000, 3, 10),
(210, 4982, 'No', 'Мова програмування С. Лекції та вправи', 29.00, 5, 432, 3, '2000-12-07', 5000, 3, 10),
(220, 4687, 'No', 'Ефективне використання C++ .50 рекомендацій щодо п', 17.60, 6, 240, 2, '2000-03-02', 5000, 3, 10),
(222, 235, 'No', 'Інформаційні системи і структури даних', 0.00, 10, 418, 6, NULL, 100, 1, 11),
(225, 8746, 'YES', 'Бази даних в інформаційних системах', 0.00, 11, 418, 7, '2018-07-25', 500, 3, 5),
(226, 2154, 'Yes', 'Сервер на основі операційної системи FreeBSD 6.1', 0.00, 11, 216, 7, '2015-11-03', 500, 3, 11),
(245, 2662, 'No', 'Організація баз даних та знань', 0.00, 12, 208, 6, '2001-10-10', 1000, 3, 11),
(247, 5641, 'Yes', 'Організація баз даних та знань', 0.00, 9, 384, 2, '2021-12-15', 5000, 3, 11);

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id_category` smallint(3) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`) VALUES
(10, 'C&C++'),
(7, 'Linux'),
(1, 'n/m'),
(11, 'SQL'),
(8, 'Unix'),
(6, 'Windows 2000'),
(5, 'Інші книги'),
(9, 'Інші операційні системи'),
(3, 'Апаратні засоби ПК'),
(4, 'Захист і безпека ПК'),
(2, 'Підручники');

-- --------------------------------------------------------

--
-- Структура таблиці `formats`
--

CREATE TABLE `formats` (
  `id_format` smallint(2) NOT NULL,
  `format_name` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `formats`
--

INSERT INTO `formats` (`id_format`, `format_name`) VALUES
(7, '60x84/16'),
(6, '60x9016'),
(4, '60х88/16'),
(2, '70х100/16'),
(5, '84x100/16'),
(3, '84х108/16'),
(1, 'n/m');

-- --------------------------------------------------------

--
-- Структура таблиці `publishers`
--

CREATE TABLE `publishers` (
  `id_publisher` smallint(2) NOT NULL,
  `publisher_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `publishers`
--

INSERT INTO `publishers` (`id_publisher`, `publisher_name`) VALUES
(5, 'DiaSoft'),
(1, 'n/m'),
(12, 'Вінниця: ВДТУ'),
(9, 'Видавнича група BHV'),
(2, 'Вильямс'),
(6, 'ДМК'),
(10, 'Києво-Могилянська ак'),
(4, 'МикроАрт'),
(3, 'Питер'),
(7, 'Триумф'),
(11, 'Університет `Україна'),
(8, 'Эком');

-- --------------------------------------------------------

--
-- Структура таблиці `topics`
--

CREATE TABLE `topics` (
  `id_topic` smallint(3) NOT NULL,
  `topic_name` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `topics`
--

INSERT INTO `topics` (`id_topic`, `topic_name`) VALUES
(1, 'Використання ПК в цілому'),
(2, 'Операційні системи'),
(3, 'Програмування');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `books2`
--
ALTER TABLE `books2`
  ADD PRIMARY KEY (`num`),
  ADD KEY `idx_title` (`name`),
  ADD KEY `publisher` (`publisher`),
  ADD KEY `format` (`format`),
  ADD KEY `topic` (`topic`),
  ADD KEY `category` (`category`);

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Індекси таблиці `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`id_format`),
  ADD UNIQUE KEY `format_name` (`format_name`);

--
-- Індекси таблиці `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id_publisher`),
  ADD UNIQUE KEY `publisher_name` (`publisher_name`);

--
-- Індекси таблиці `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id_topic`),
  ADD UNIQUE KEY `topic_name` (`topic_name`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `formats`
--
ALTER TABLE `formats`
  MODIFY `id_format` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id_publisher` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `topics`
--
ALTER TABLE `topics`
  MODIFY `id_topic` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `books2`
--
ALTER TABLE `books2`
  ADD CONSTRAINT `books2_ibfk_1` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id_publisher`),
  ADD CONSTRAINT `books2_ibfk_2` FOREIGN KEY (`format`) REFERENCES `formats` (`id_format`),
  ADD CONSTRAINT `books2_ibfk_3` FOREIGN KEY (`topic`) REFERENCES `topics` (`id_topic`),
  ADD CONSTRAINT `books2_ibfk_4` FOREIGN KEY (`category`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
