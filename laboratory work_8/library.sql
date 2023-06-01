-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Чрв 01 2023 р., 14:32
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

DELIMITER $$
--
-- Процедури
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc1` ()   SELECT books2.name_book AS 'Назва книги', books2.price AS 'Ціна', books2.publisher AS 'Видавництво', books2.format AS 'Формат' 
	FROM books2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc10_` ()   SELECT publishers.publisher_name AS 'Видавництво' 
	FROM books2, publishers WHERE books2.pages>=400$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc11` (IN `num_books` INT)   SELECT categories.id_category AS 'ID', categories.category_name AS 'Категорія' 
	FROM categories 
	WHERE(
	SELECT COUNT(*) FROM books2 WHERE books2.category = categories.id_category) > num_books$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc12` (IN `name_publisher` VARCHAR(200))   SELECT books2.id_book AS 'ID', books2.code_book AS 'Код', books2.new_book AS 'Новинка', books2.name_book AS 'Назва книги', books2.price AS 'Ціна', books2.pages AS 'Кількість сторінок' 
	FROM books2 
	WHERE EXISTS(
	SELECT publishers.id_publisher,publishers.publisher_name FROM publishers WHERE publishers.publisher_name = name_publisher AND publishers.id_publisher = books2.publisher)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc13` (IN `name_publisher` VARCHAR(200))   SELECT books2.id_book AS 'ID', books2.code_book AS 'Код', books2.new_book AS 'Новинка', books2.name_book AS 'Назва книги', books2.price AS 'Ціна', books2.pages AS 'Кількість сторінок' 
	FROM books2 WHERE NOT EXISTS(
	SELECT publishers.id_publisher,publishers.publisher_name FROM publishers WHERE publishers.publisher_name = name_publisher AND publishers.id_publisher = books2.publisher)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc14` ()   ((SELECT topics.topic_name FROM topics) 
	UNION(
	SELECT categories.category_name FROM categories)) 
	ORDER BY topic_name ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc15` ()   SELECT DISTINCT name_book 
	FROM ((SELECT REGEXP_SUBSTR(TRIM(books2.name_book),'^[^\\s]+') AS name_book FROM books2) 
	UNION ALL(SELECT REGEXP_SUBSTR(TRIM(categories.category_name),'^[^\\s]+') AS 'Перше слово назви книги і категорій що не повторюються' FROM categories)) books2,categories 
	ORDER BY name_book DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc1_` ()   SELECT books2.name_book AS 'Назва книги', books2.price AS 'Ціна', publishers.publisher_name AS 'Видавництво', formats.format_name AS 'Формат' 
	FROM books2 JOIN publishers ON books2.publisher=publishers.id_publisher JOIN formats ON books2.format=formats.id_format$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc2` ()   SELECT books2.topic AS 'Тема книги', books2.category AS 'Категорія', books2.name_book AS 'Назва книги', books2.publisher AS 'Видавництво' FROM books2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc2_` ()   SELECT topics.topic_name AS 'Тема книги', categories.category_name AS 'Категорія', books2.name_book AS 'Назва книги', publishers.publisher_name AS 'Видавництво' 
	FROM books2 JOIN topics ON books2.topic=topics.id_topic JOIN categories ON books2.category=categories.id_category JOIN publishers ON books2.publisher=publishers.id_publisher$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc3` (IN `pub` TEXT(100), IN `YEAR` INT)   SELECT books2.code_book AS 'Код книги',books2.name_book AS 'Назва книги', publishers.publisher_name AS 'Видавництво', books2.release_date AS 'Рік видання', books2.price AS 'Ціна' 
	FROM books2 JOIN publishers ON books2.publisher=publishers.id_publisher
	WHERE YEAR(books2.release_date)>2000 AND publishers.publisher_name LIKE pub
	ORDER BY books2.code_book ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc4__` ()   SELECT books2.name_book AS 'Назва книги', SUM(books2.pages) AS 'Загальна кількість сторінок', books2.category AS 'Категорія' 
	FROM books2 JOIN categories ON books2.category=categories.id_category 
	GROUP BY books2.category 
	ORDER BY books2.pages ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc5` (IN `topic` INT, IN `categori` INT, OUT `avg_price` INT)   SET avg_price=(SELECT AVG(books2.price) 
	FROM books2 WHERE books2.topic LIKE topic AND books2.category LIKE categori)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc6` ()   SELECT * FROM books2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc6_` ()   SELECT books2.id_book 'ID', books2.code_book 'Код книги', books2.new_book 'Новинка', books2.name_book 'Назва книги', books2.price 'Ціна',publishers.publisher_name 'Видавництво', books2.pages 'Сторінки', formats.format_name 'Формат', books2.release_date, books2.tirage,topics.topic_name,categories.category_name 
	FROM books2 JOIN publishers ON books2.publisher=publishers.id_publisher JOIN topics ON books2.topic=topics.id_topic JOIN categories ON books2.category=categories.id_category JOIN formats ON books2.format=formats.id_format$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc7` ()   SELECT DISTINCT book_A.name_book AS 'Книга 1',book_B.name_book AS 'Книга 2' 
	FROM books2 book_A JOIN books2 book_B ON book_A.pages=book_B.pages AND book_A.id_book!=book_B.id_book$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc8` ()   SELECT DISTINCT book_A.name_book AS 'Книга 1',book_B.name_book AS 'Книга 2', book_C.name_book AS 'Книга 3' FROM books2 book_A JOIN books2 book_B ON book_A.price=book_B.price AND book_A.id_book!=book_B.id_book JOIN books2 book_C ON book_B.price=book_C.price AND book_B.id_book!=book_C.id_book$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc9_` (IN `categori` VARCHAR(200))   SELECT books2.name_book AS 'Назва Книги', books2.price AS 'Ціна', books2.pages AS 'Кількість сторінок', books2.format AS 'Формат', books2.release_date AS 'Дата видавництва', publishers.publisher_name AS 'Видавництво', topics.topic_name AS 'Тема', categories.category_name AS 'Категорія' 
	FROM books2 JOIN publishers ON books2.publisher=publishers.id_publisher JOIN topics ON books2.topic=topics.id_topic JOIN categories ON books2.category=categories.id_category 
	WHERE categories.category_name=categori$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `books2`
--

CREATE TABLE `books2` (
  `id_book` int(20) NOT NULL,
  `code_book` int(10) NOT NULL DEFAULT 0,
  `new_book` varchar(3) NOT NULL DEFAULT 'No',
  `name_book` varchar(50) NOT NULL DEFAULT ' ',
  `price` float(5,2) NOT NULL,
  `publisher` smallint(2) NOT NULL DEFAULT 0,
  `pages` int(11) DEFAULT NULL,
  `format` smallint(2) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `tirage` int(11) DEFAULT NULL,
  `topic` smallint(3) DEFAULT NULL,
  `category` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `books2`
--

INSERT INTO `books2` (`id_book`, `code_book`, `new_book`, `name_book`, `price`, `publisher`, `pages`, `format`, `release_date`, `tirage`, `topic`, `category`) VALUES
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

--
-- Тригери `books2`
--
DELIMITER $$
CREATE TRIGGER `trig1` AFTER INSERT ON `books2` FOR EACH ROW BEGIN
	IF(SELECT COUNT(books2.topic) 
	FROM books2 WHERE NEW.topic=books2.topic) NOT BETWEEN 5 AND 10
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Кількість тем може бути в діапазоні від 5 до 10';
	END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig10` BEFORE INSERT ON `books2` FOR EACH ROW BEGIN
		IF (NEW.publisher=9) AND (NEW.format=4) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництво BHV не випускає книги формату 60х88 / 16';
   		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig2` BEFORE INSERT ON `books2` FOR EACH ROW BEGIN
	IF (NEW.new_book='Yes' AND YEAR(NEW.release_date)!=YEAR(CURRENT_DATE)) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Новинкою може бути тільки книга видана в поточному році';
	END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig3` BEFORE INSERT ON `books2` FOR EACH ROW BEGIN
		IF(NEW.pages<100 AND NEW.price)>10 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Книга з кількістю сторінок до 100 не може коштувати більше 10 $';
		ELSEIF( NEW.pages<200 AND NEW.price)>20 THEN SET @err2='Книга з кількістю сторінок до 200 не може коштувати більше 20 $';
		ELSEIF(NEW.pages<300 AND NEW.price)>30 THEN SET @err3='Книга з кількістю сторінок до 300 не може коштувати більше 30 $';
		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig4` BEFORE INSERT ON `books2` FOR EACH ROW IF((NEW.publisher=9 AND NEW.tirage<5000) OR (NEW.publisher=5 AND NEW.tirage<10000))
		THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництво "BHV" не випускає книги накладом меншим 5000, а видавництво Diasoft - 10000.';
	END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig6` BEFORE DELETE ON `books2` FOR EACH ROW BEGIN
		IF ((CURRENT_USER != 'dbo') AND (COLUMNS_UPDATED() & 1)!=0)
		THEN 
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Ви не користувач dbo.Лише цей користувач може видаляти книги. ';
		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig7` BEFORE UPDATE ON `books2` FOR EACH ROW BEGIN
		IF ((CURRENT_USER != 'dbo') AND OLD.price!=NEW.price) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Користувач "dbo" не має права змінювати ціну книги';
		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig8` BEFORE INSERT ON `books2` FOR EACH ROW BEGIN
		IF (NEW.publisher IN (6,8)) AND (NEW.category=2) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництва ДМК і Еком підручники не видають';
		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig9` BEFORE INSERT ON `books2` FOR EACH ROW BEGIN
		SET @book_new_book_from_publisher=0;
		SELECT COUNT(*) INTO @book_new_book_from_publisher FROM books2 WHERE books2.publisher=NEW.publisher AND books2.new_book='Yes'AND
   	 	YEAR(CURRENT_DATE())=YEAR(books2.release_date) AND MONTH(books2.release_date);
   	 	IF (NEW.new_book='Yes' AND @book_new_book_from_publisher>10) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництво не може випустити більше 10 новинок протягом одного місяця поточного року';
   	 	END IF;
	END
$$
DELIMITER ;

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
(12, 'Python'),
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
(8, '170x235'),
(7, '60x84/16'),
(6, '60x90/16'),
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
(13, 'O\'Reilly Media, Inc.'),
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
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `idx_title` (`name_book`),
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
  MODIFY `id_category` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `formats`
--
ALTER TABLE `formats`
  MODIFY `id_format` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id_publisher` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
