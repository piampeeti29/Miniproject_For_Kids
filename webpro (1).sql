-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 01:34 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `alphabet`
--

CREATE TABLE `alphabet` (
  `alpha_id` int(10) UNSIGNED NOT NULL,
  `lesson_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `FnameT` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `FnameS` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alphaone`
--

CREATE TABLE `alphaone` (
  `id` int(10) UNSIGNED NOT NULL,
  `alphabet` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alphaone`
--

INSERT INTO `alphaone` (`id`, `alphabet`, `sound`, `text`) VALUES
(1, 'a.png', 'voiceexample.mp3', 'เอ'),
(2, 'b.png', 'voiceexample2.mp3', 'บี'),
(3, 'c.png', 'voiceexample3.mp3', 'ซี'),
(4, 'd.png', 'voiceexample4.mp3', 'ดี'),
(5, 'e.png', 'voiceexample5.mp3', 'อี'),
(6, 'f.png', 'voiceexample6.mp3', 'เอฟ'),
(7, 'g.png', 'voiceexample7.mp3', 'จี'),
(8, 'h.png', 'voiceexample8.mp3', 'เอช');

-- --------------------------------------------------------

--
-- Table structure for table `alphatest`
--

CREATE TABLE `alphatest` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `trueans` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alphatest`
--

INSERT INTO `alphatest` (`id`, `question`, `ans1`, `ans2`, `ans3`, `trueans`) VALUES
(1, 'A', 'เจ', 'เอ', 'เค', 'เอ'),
(2, 'B', 'จี', 'บี', 'ดี', 'บี'),
(3, 'C', 'ที', 'อี', 'ซี', 'ซี'),
(4, 'D', 'จี', 'วี', 'ดี', 'ดี'),
(5, 'E', 'อี', 'บี', 'วี', 'อี'),
(6, 'F', 'เอฟ', 'เอส', 'เอช', 'เอฟ'),
(7, 'G', 'ดี', 'จี', 'วี', 'จี'),
(8, 'H', 'เอส', 'เอฟ', 'เอช', 'เอช'),
(9, 'I', 'ไอ', 'โอ', 'อาร์', 'ไอ'),
(10, 'J', 'เอ', 'เจ', 'เค', 'เจ'),
(11, 'K', 'เอ', 'เจ', 'เค', 'เค'),
(12, 'L', 'แอล', 'เอ็ม', 'เอ็กซ์', 'แอล'),
(13, 'M', 'เอ็ม', 'โอ', 'เอ็น', 'เอ็ม'),
(14, 'N', 'เอ็น', 'เอ็ม', 'อาร์', 'เอ็น'),
(15, 'O', 'ไอ', 'โอ', 'ยู', 'โอ'),
(16, 'P', 'พี', 'วาย', 'คิว', 'พี'),
(17, 'Q', 'แซด', 'คิว', 'เค', 'คิว'),
(18, 'R', 'จี', 'ดับเบิ้ลยู', 'อาร์', 'อาร์'),
(19, 'S', 'เอช', 'เอฟ', 'เอส', 'เอส'),
(20, 'T', 'จี', 'ที', 'ดี', 'ที'),
(21, 'U', 'ยู', 'ไอ', 'ดับเบิ้ลยู', 'ยู'),
(22, 'V', 'จี', 'ที', 'วี', 'วี'),
(23, 'W', 'ดับเบิ้ลยู', 'เค', 'ยู', 'ดับเบิ้ลยู'),
(24, 'X', 'เอ็กซ์', 'เอ็น', 'เอ็ม', 'เอ็กซ์'),
(25, 'Y', 'วาย', 'ที', 'แอล', 'วาย'),
(26, 'Z', 'เอ', 'แซด', 'วาย', 'แซด');

-- --------------------------------------------------------

--
-- Table structure for table `alphathree`
--

CREATE TABLE `alphathree` (
  `id` int(10) UNSIGNED NOT NULL,
  `alphabet` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alphathree`
--

INSERT INTO `alphathree` (`id`, `alphabet`, `sound`, `text`) VALUES
(17, 'q.png', 'voiceexample17.mp3', 'คิว'),
(18, 'r.png', 'voiceexample18.mp3', 'อาร์'),
(19, 's.png', 'voiceexample19.mp3', 'เอส'),
(20, 't.png', 'voiceexample20.mp3', 'ที'),
(21, 'u.png', 'voiceexample21.mp3', 'ยู'),
(22, 'v.png', 'voiceexample22.mp3', 'วี'),
(23, 'w.png', 'voiceexample23.mp3', 'ดับเบิลยู'),
(24, 'x.png', 'voiceexample24.mp3', 'เอ็กซ์'),
(25, 'y.png', 'voiceexample25.mp3', 'วาย'),
(26, 'z.png', 'voiceexample26.mp3', 'แซด/ซี');

-- --------------------------------------------------------

--
-- Table structure for table `alphatwo`
--

CREATE TABLE `alphatwo` (
  `id` int(10) UNSIGNED NOT NULL,
  `alphabet` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alphatwo`
--

INSERT INTO `alphatwo` (`id`, `alphabet`, `sound`, `text`) VALUES
(9, 'i.png', 'voiceexample9.mp3', 'ไอ'),
(10, 'j.png', 'voiceexample10.mp3', 'เจ'),
(11, 'k.png', 'voiceexample11.mp3', 'เค'),
(12, 'l.png', 'voiceexample12.mp3', 'แอล'),
(13, 'm.png', 'voiceexample13.mp3', 'เอ็ม'),
(14, 'n.png', 'voiceexample14.mp3', 'เอ็น'),
(15, 'o.png', 'voiceexample15.mp3\n', 'โอ'),
(16, 'p.png', 'voiceexample16.mp3', 'พี');

-- --------------------------------------------------------

--
-- Table structure for table `animallesson1`
--

CREATE TABLE `animallesson1` (
  `id` int(10) UNSIGNED NOT NULL,
  `animal` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `animallesson1`
--

INSERT INTO `animallesson1` (`id`, `animal`, `sound`, `text`) VALUES
(1, 'lion.png', 'lion.mp3', 'Lion'),
(2, 'cat.png', 'cat.mp3', 'Cat'),
(3, 'dog.png', 'dog.mp3', 'Dog'),
(4, 'frog.png', 'frog.mp3', 'Frog'),
(5, 'wolf.png', 'wolf.mp3', 'Wolf'),
(6, 'snake.png', 'snake.mp3', 'Snake'),
(7, 'cow.png', 'cow.mp3', 'Cow'),
(8, 'goat.png', 'goat.mp3', 'Goat'),
(9, 'pig.png', 'pig.mp3', 'Pig'),
(10, 'chicken.png', 'chicken.mp3', 'Chicken');

-- --------------------------------------------------------

--
-- Table structure for table `animallesson2`
--

CREATE TABLE `animallesson2` (
  `id` int(10) UNSIGNED NOT NULL,
  `animal` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `animallesson2`
--

INSERT INTO `animallesson2` (`id`, `animal`, `sound`, `text`) VALUES
(11, 'goose.png', 'goose.mp3', 'Goose'),
(12, 'turtle.png', 'turtle.mp3', 'Turtle'),
(13, 'fox.png', 'fox.mp3', 'Fox'),
(14, 'tiger.png', 'tiger.mp3', 'Tiger'),
(15, 'sheep.png', 'sheep.mp3', 'Sheep'),
(16, 'crow.png', 'crow.mp3', 'Crow'),
(17, 'bird.png', 'bird.mp3', 'Bird'),
(18, 'fish.png', 'fish.mp3', 'Fish'),
(19, 'rabbit.png', 'rabbit.mp3', 'Rabbit'),
(20, 'deer.png', 'deer.mp3', 'Deer');

-- --------------------------------------------------------

--
-- Table structure for table `animaltest`
--

CREATE TABLE `animaltest` (
  `id` int(11) NOT NULL,
  `question` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `trueans` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `animaltest`
--

INSERT INTO `animaltest` (`id`, `question`, `ans1`, `ans2`, `ans3`, `trueans`) VALUES
(1, 'lion.png', 'lion', 'tiger', 'snake', 'lion'),
(2, 'cat.png', 'cat', 'tiger', 'dog', 'cat'),
(3, 'dog.png', 'lion', 'dog', 'wolf', 'dog'),
(4, 'frog.png', 'frog', 'turtle', 'fox', 'frog'),
(5, 'wolf.png', 'cat', 'dog', 'wolf', 'wolf'),
(6, 'snake.png', 'fish', 'spider', 'snake', 'snake'),
(7, 'cow.png', 'sheep', 'cow', 'crow', 'cow'),
(8, 'goat.png', 'cow', 'goat', 'sheep', 'goat'),
(9, 'pig.png', 'pig', 'goat', 'chicken', 'pig'),
(10, 'chicken.png', 'goose', 'duck', 'chicken', 'chicken'),
(11, 'goose.png', 'chicken', 'goose', 'turtle', 'goose'),
(12, 'turtle.png', 'turtle', 'tiger', 'snake', 'turtle'),
(13, 'fox.png', 'wolf', 'pig', 'fox', 'fox'),
(14, 'tiger.png', 'lion', 'tiger', 'goat', 'tiger'),
(15, 'sheep.png', 'sheep', 'pig', 'cow', 'sheep'),
(16, 'crow.png', 'bird', 'crow', 'snake', 'crow'),
(17, 'bird.png', 'bird', 'goose', 'rabbit', 'bird'),
(18, 'fish.png', 'frog', 'fish', 'fox', 'fish'),
(19, 'rabbit.png', 'deer', 'rabbit', 'lion', 'rabbit'),
(20, 'deer.png', 'goat', 'rabbit', 'deer', 'deer');

-- --------------------------------------------------------

--
-- Table structure for table `colorone`
--

CREATE TABLE `colorone` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colorone`
--

INSERT INTO `colorone` (`id`, `color`, `sound`, `text`) VALUES
(1, 'red.png', 'red.mp3', 'RED'),
(2, 'orange.png', 'orange.mp3', 'ORANGE'),
(3, 'yellow.png', 'yellow.mp3', 'YELLOW'),
(4, 'brown.png', 'brown.mp3', 'BROWN');

-- --------------------------------------------------------

--
-- Table structure for table `colortest`
--

CREATE TABLE `colortest` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `trueans` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colortest`
--

INSERT INTO `colortest` (`id`, `question`, `ans1`, `ans2`, `ans3`, `trueans`) VALUES
(1, 'red.png', 'red', 'yellow', 'green', 'red'),
(2, 'orange.png', 'blue', 'green', 'orange', 'orange'),
(3, 'yellow.png', 'red', 'yellow', 'white', 'yellow'),
(4, 'brown.png', 'brown', 'purple', 'pink', 'brown'),
(5, 'green.png', 'gold', 'gray', 'green', 'green'),
(6, 'blue.png', 'blue', 'black', 'red', 'blue'),
(7, 'purple.png', 'red', 'brown', 'purple', 'purple'),
(8, 'pink.png', 'pink', 'white', 'green', 'pink'),
(9, 'black.png', 'black', 'blue', 'purple', 'black'),
(10, 'white.png', 'gold', 'yellow', 'white', 'white'),
(11, 'gray.png', 'green', 'gray', 'gold', 'gray'),
(12, 'gold.png', 'brown', 'gold', 'orange', 'gold');

-- --------------------------------------------------------

--
-- Table structure for table `colorthree`
--

CREATE TABLE `colorthree` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colorthree`
--

INSERT INTO `colorthree` (`id`, `color`, `sound`, `text`) VALUES
(9, 'black.png', 'black.mp3', 'BLACK'),
(10, 'white.png', 'white.mp3', 'WHITE'),
(11, 'gray.png', 'gray.mp3', 'GRAY'),
(12, 'gold.png', 'gold.mp3', 'GOLD');

-- --------------------------------------------------------

--
-- Table structure for table `colortwo`
--

CREATE TABLE `colortwo` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colortwo`
--

INSERT INTO `colortwo` (`id`, `color`, `sound`, `text`) VALUES
(5, 'green.png', 'green.mp3', 'GREEN'),
(6, 'blue.png', 'blue.mp3', 'BLUE'),
(7, 'purple.png', 'purple.mp3', 'PURPLE'),
(8, 'pink.png', 'pink.mp3', 'PINK');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_ID` int(10) UNSIGNED NOT NULL,
  `lesson_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `FnameT` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_ID`, `lesson_name`, `FnameT`, `grade`) VALUES
(1, 'Color', 'Napassanan', 5),
(3, 'Alphabet', 'Phunyavee', 5),
(4, 'Color', 'Napassanan', 2),
(14, 'Fruit', 'Napassanan', 4);

-- --------------------------------------------------------

--
-- Table structure for table `fruitlesson1`
--

CREATE TABLE `fruitlesson1` (
  `id` int(10) UNSIGNED NOT NULL,
  `fruit` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fruitlesson1`
--

INSERT INTO `fruitlesson1` (`id`, `fruit`, `sound`, `text`) VALUES
(1, 'apple.png', 'apple.mp3', 'Apple'),
(2, 'papaya.png', 'papaya.mp3', 'Papaya'),
(3, 'pineapple.png', 'pineapple.mp3', 'Pineapple'),
(4, 'orange.png', 'orange.mp3', 'Orange'),
(5, 'coconut.png', 'coconut.mp3', 'Coconut');

-- --------------------------------------------------------

--
-- Table structure for table `fruitlesson2`
--

CREATE TABLE `fruitlesson2` (
  `id` int(10) UNSIGNED NOT NULL,
  `fruit` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fruitlesson2`
--

INSERT INTO `fruitlesson2` (`id`, `fruit`, `sound`, `text`) VALUES
(6, 'peach.png', 'peach.mp3', 'Peach'),
(7, 'lime.png', 'lime.mp3', 'Lime'),
(8, 'cherry.png', 'cherry.mp3', 'Cherry'),
(9, 'watermelon.png', 'watermelon.mp3', 'Watermelon'),
(10, 'melon.png', 'melon.mp3', 'Melon');

-- --------------------------------------------------------

--
-- Table structure for table `fruittest`
--

CREATE TABLE `fruittest` (
  `id` int(11) NOT NULL,
  `question` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `trueans` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fruittest`
--

INSERT INTO `fruittest` (`id`, `question`, `ans1`, `ans2`, `ans3`, `trueans`) VALUES
(1, 'apple.png', 'banana', 'coconut', 'apple', 'apple'),
(2, 'papaya.png', 'banana', 'coconut', 'papaya', 'papaya'),
(3, 'pineapple.png', 'banana', 'coconut', 'pineapple', 'pineapple'),
(4, 'orange.png', 'kiwi', 'grapes', 'orange', 'orange'),
(5, 'coconut.png', 'grapes', 'coconut', 'pineapple', 'coconut'),
(6, 'peach.png', 'peach', 'lime', 'apple', 'peach'),
(7, 'lime.png', 'strawberry', 'lime', 'peach', 'lime'),
(8, 'cherry.png', 'banana', 'strawberry', 'cherry', 'cherry'),
(9, 'watermelon.png', 'melon', 'watermelon', 'papaya', 'watermelon'),
(10, 'melon.png', 'melon', 'watermelon', 'papaya', 'melon');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `lesson_ID` int(11) NOT NULL,
  `lessonname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`lesson_ID`, `lessonname`) VALUES
(1, 'Alphabet'),
(2, 'Number'),
(3, 'Color'),
(4, 'Fruit'),
(5, 'Animal');

-- --------------------------------------------------------

--
-- Table structure for table `lessonalphabet`
--

CREATE TABLE `lessonalphabet` (
  `CourseID` int(10) UNSIGNED NOT NULL,
  `TeacherID` int(10) UNSIGNED NOT NULL,
  `StudentID` int(10) UNSIGNED NOT NULL,
  `Score` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `number`
--

CREATE TABLE `number` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `trueans` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `numberfive`
--

CREATE TABLE `numberfive` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `numberfive`
--

INSERT INTO `numberfive` (`id`, `number`, `sound`, `text`) VALUES
(1000, '1,000', 'onethousand.mp3', 'One thousand'),
(10000, '10,000', 'tenthousand.mp3', 'Ten thousand'),
(100000, '100,000', 'onehundredthousand.mp3', 'One hundred thousand'),
(1000000, '1,000,000', 'onemillion.mp3', 'One million');

-- --------------------------------------------------------

--
-- Table structure for table `numberfour`
--

CREATE TABLE `numberfour` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `numberfour`
--

INSERT INTO `numberfour` (`id`, `number`, `sound`, `text`) VALUES
(100, '100', 'onehundred.mp3', 'One hundred'),
(200, '200', 'twohundred.mp3', 'Two hundred'),
(300, '300', 'threehundred.mp3', 'Three hundred'),
(400, '400', 'fourhundred.mp3', 'Four hundred'),
(500, '500', 'fivehundred.mp3', 'Five hundred'),
(600, '600', 'sixhundred.mp3', 'Six hundred'),
(700, '700', 'sevenhundred.mp3', 'Seven hundred'),
(800, '800', 'eighthundred.mp3', 'Eight hundred'),
(900, '900', 'ninehundred.mp3', 'Nine hundred');

-- --------------------------------------------------------

--
-- Table structure for table `numberone`
--

CREATE TABLE `numberone` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `numberone`
--

INSERT INTO `numberone` (`id`, `number`, `sound`, `text`) VALUES
(1, '1', 'one.mp3', 'One'),
(2, '2', 'two.mp3', 'Two'),
(3, '3', 'three.mp3', 'Three'),
(4, '4', 'four.mp3', 'Four'),
(5, '5', 'five.mp3', 'Five'),
(6, '6', 'six.mp3', 'Six'),
(7, '7', 'seven.mp3', 'Seven'),
(8, '8', 'eight.mp3', 'Eight'),
(9, '9', 'nine.mp3', 'Nine'),
(10, '10', 'ten.mp3', 'Ten');

-- --------------------------------------------------------

--
-- Table structure for table `numbertest`
--

CREATE TABLE `numbertest` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ans1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ans3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `trueans` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `numbertest`
--

INSERT INTO `numbertest` (`id`, `question`, `ans1`, `ans2`, `ans3`, `trueans`) VALUES
(1, '1', 'two', 'four', 'one', 'one'),
(2, '2', 'two', 'zero', 'three', 'two'),
(3, '3', 'three', 'ten', 'one', 'three'),
(4, '4', 'nine', 'six', 'four', 'four'),
(5, '5', 'five', 'seven', 'one', 'five'),
(6, '6', 'nine', 'six', 'two', 'six'),
(7, '7', 'ten', 'five', 'seven', 'seven'),
(8, '8', 'eight', 'four', 'zero', 'eight'),
(9, '9', 'nine', 'four', 'three', 'nine'),
(10, '0', 'zero', 'nine', 'six', 'zero'),
(11, '10', 'twelve', 'sixteen', 'ten', 'ten'),
(12, '11', 'eleven', 'fourteen', 'nineteen', 'eleven'),
(13, '12', 'eleven', 'twelve', 'thirteen', 'twelve'),
(14, '13', 'eighteen', 'thirteen', 'fifteen', 'thirteen'),
(15, '14', 'zero', 'fourteen', 'seventeen', 'fourteen'),
(16, '20', 'twenty', 'ninety', 'fourty', 'twenty'),
(17, '30', 'eighty', 'thirty', 'sixty', 'thirty'),
(18, '40', 'seventy', 'ten', 'fourty', 'fourty'),
(19, '50', 'ninety', 'fourty', 'fifty', 'fifty'),
(20, '90', 'ninety', 'eighty', 'twenty', 'ninety'),
(21, '100', 'one hundred', 'four hundred', 'nine hundred', 'one hundred'),
(22, '200', 'two hunderd', 'six hundred', 'one hundred', 'two hunderd'),
(23, '300', 'three hundred', 'eight hundred', 'seven hundred', 'three hundred'),
(24, '600', 'six hundred', 'four hundred', 'three hundred', 'six hundred'),
(25, '800', 'two hundred', 'eight hundred', 'two hundred', 'eight hundred'),
(26, '1000', 'two thousand', 'four thousand', 'one thousand', 'one thousand'),
(27, '4000', 'two thousand', 'four thousand', 'two thousand', 'four thousand'),
(28, '6000', 'three thousand', 'six thousand', 'one thousand', 'six thousand'),
(29, '8000', 'eight thousand', 'six thousand', 'two thousand', 'eight thousand'),
(30, '10000', 'five thousand', 'seven thousand', 'ten thousand', 'ten thousand');

-- --------------------------------------------------------

--
-- Table structure for table `numberthree`
--

CREATE TABLE `numberthree` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `numberthree`
--

INSERT INTO `numberthree` (`id`, `number`, `sound`, `text`) VALUES
(30, '30', 'thirty.mp3', 'Thirty'),
(40, '40', 'fourty.mp3', 'Fourty'),
(50, '50', 'fifty.mp3', 'Fifty'),
(60, '60', 'sixty.mp3', 'Sixty'),
(70, '70', 'seventy.mp3', 'Seventy'),
(80, '80', 'eighty.mp3', 'Eighty'),
(90, '90', 'ninety.mp3', 'Ninety');

-- --------------------------------------------------------

--
-- Table structure for table `numbertwo`
--

CREATE TABLE `numbertwo` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sound` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `numbertwo`
--

INSERT INTO `numbertwo` (`id`, `number`, `sound`, `text`) VALUES
(11, '11', 'eleven.mp3', 'Eleven'),
(12, '12', 'twelve.mp3', 'Twelve'),
(13, '13', 'thirteen.mp3', 'Thirteen'),
(14, '14', 'fourteen.mp3', 'Fourteen'),
(15, '15', 'fifteen.mp3', 'Fifteen'),
(16, '16', 'sixteen.mp3', 'Sixteen'),
(17, '17', 'seventeen.mp3', 'Seventeen'),
(18, '18', 'eighteen.mp3', 'Eighteen'),
(19, '19', 'nineteen.mp3', 'Nineteen'),
(20, '20', 'twenty.mp3', 'Twenty');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` int(10) UNSIGNED NOT NULL,
  `FnameS` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `LnameS` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `StudentID` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `Alscore` int(11) DEFAULT NULL,
  `Cscore` int(11) DEFAULT NULL,
  `Nscore` int(11) DEFAULT NULL,
  `Fscore` int(11) DEFAULT NULL,
  `Ascore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `FnameS`, `LnameS`, `StudentID`, `username`, `password`, `grade`, `Alscore`, `Cscore`, `Nscore`, `Fscore`, `Ascore`) VALUES
(1, 'Napassanan', 'Nopphakhun', 331501015, 'admin', '$2b$10$aio93dCC11HfL9IMDqsQCepQPr66uJBrJvu/c.Ww6Q6iaYKL1wC4W', 1, 26, 12, 30, 10, 20),
(2, 'Adelard', 'Poshakrishana', 331501016, 'Adelard', '$2b$10$pF3mlRxD9K5E7hyKhoX8weCPDJmVSnEDuh8tEN5Bc57Dqmhv5cqwm', 2, 0, 0, 0, NULL, NULL),
(3, 'Pisit', 'Buranadham', 633150124, 'Pisit', '$2b$10$pF3mlRxD9K5E7hyKhoX8weCPDJmVSnEDuh8tEN5Bc57Dqmhv5cqwm', 3, 0, 0, 0, NULL, NULL),
(4, 'Chin', 'Buri', 633150128, 'Chin', '$2b$10$pF3mlRxD9K5E7hyKhoX8weCPDJmVSnEDuh8tEN5Bc57Dqmhv5cqwm', 1, 0, 0, 0, NULL, NULL),
(5, 'Wijittra', 'Tubthong', 632158106, 'Wijittra', '$2b$10$CCfvxQ4CDa0nmnPglsF8JO2QTGd3N1G1LVfA/zILUvbHqLVsfE.TK', 5, NULL, NULL, NULL, NULL, NULL),
(6, 'Niramon', 'Rattanakun', 653210146, 'Niramon', '$2b$10$OHOCbQR8N6W11VzcoPh.J.HECg1eka39JxLfkjPQZm6bkmcTw.UGm', 6, NULL, NULL, NULL, NULL, NULL),
(7, 'Apinan', 'Wattanakul', 675186954, 'Apinan', '$2b$10$Q.UTMndAaFM931Q3ebICeefgOU5raJoQw9Q46.lfQKR.L..0Ggq2C', 5, NULL, NULL, NULL, NULL, NULL),
(8, 'Pimjai', 'Lertpanya', 890456324, 'Pimjai', '$2b$10$VEd8E0ga8cFjBiwsPSXOfepL7mPFxM.s3NsK89U8XaeeYEup/nBHu', 1, NULL, NULL, NULL, NULL, NULL),
(9, 'Nattawan', 'Chaivanit', 970423456, 'Nattawan', '$2b$10$6aqIVbxZFTU0zZUVB6e9UungfaizRKct95RCk/y4J0iNEUEy0cDVG', 2, NULL, NULL, NULL, NULL, NULL),
(10, 'Irin', 'Jaipakdee', 633150104, 'Irin', '$2b$10$Ptb7iCYlmZy3y9Yp42uOWuqOqTRt4y/nHYw3vptDgTgF9ZMIBPxhe', 1, NULL, NULL, NULL, NULL, NULL),
(11, 'Amporn', 'Limlikhit', 633150964, 'Amporn', '$2b$10$S4LDja.UWF1MXuS3sYvN2.sZA93V7gbfY1togGWIf40JmQ30sH5eu', 5, NULL, NULL, NULL, NULL, NULL),
(12, 'Monthira', 'Boonyasiri', 569234577, 'Monthira', '$2b$10$7UtSPmOrDnW5MX5KN3XYmuhdxUus9iDi5jv2oNJWcJE/Tjoplcdt2', 4, NULL, NULL, NULL, NULL, NULL),
(13, 'Vutthipong', 'Sirivech', 523467789, 'bom', '$2b$10$wPqrrZvkFTOEUXGJ2Nx9ueVorPtpRsZlnLMZ5pChXAN1qVyd2vl6i', 1, NULL, NULL, NULL, NULL, NULL),
(17, 'Phunyavee', 'khwandee', 633150109, 'b', '$2b$10$/lyNTwC2uOZuMTpVX7EHK.Cv06dCNv5g8wKdgh8sW3Inumfot6jxa', 1, NULL, NULL, NULL, NULL, NULL),
(20, 'Manop', 'Nopma', 123456789, 'mama', '$2b$10$WnjDJYCGOBt9Dhle0DCHoeWDLtJUJLCKO6eH3luFcUXyaiiWjBHMu', 4, NULL, NULL, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TID` int(10) UNSIGNED NOT NULL,
  `FnameT` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `LnameT` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `TeacherID` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`TID`, `FnameT`, `LnameT`, `TeacherID`, `username`, `password`, `Email`, `Tel`, `img`) VALUES
(1, 'Phunyavee', 'Khwandee', 100000, 'admin', '$2b$10$aio93dCC11HfL9IMDqsQCepQPr66uJBrJvu/c.Ww6Q6iaYKL1wC4W', 'bombom@lamduan.mfu.ac.th', '1234', 'bom.jpg'),
(2, 'Napassanan', 'Nopphakhun', 100001, 'Napassanan', '$2b$10$aio93dCC11HfL9IMDqsQCepQPr66uJBrJvu/c.Ww6Q6iaYKL1wC4W', 'amm', '1234', 'ink.gif'),
(3, 'Piampeeti', 'Wungsatanawat', 100003, 'a', '$2b$10$aio93dCC11HfL9IMDqsQCepQPr66uJBrJvu/c.Ww6Q6iaYKL1wC4W', NULL, NULL, NULL),
(4, 'Teetech', 'Chuasai', 100004, 'Teetuch', '1236', NULL, NULL, NULL),
(5, 'Naphaschakorn', 'Charoenthiphakorn', 100005, 'Naphaschakorn', '1237', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(10) UNSIGNED NOT NULL,
  `score` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `score`) VALUES
(1, 'admin', '$2b$10$aio93dCC11HfL9IMDqsQCepQPr66uJBrJvu/c.Ww6Q6iaYKL1wC4W', 1, '9'),
(2, 'a', '$2b$10$4y/.hY0YdAcXDBaFslc27eZHdtt7Tpy01QHYVt1wxjQZ8OmcqAFU6', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2b$10$piztmN/QiM5daltciEonmOC10jn/bAwadOhHodZnQBjQOiGpd1at.', 1),
(2, 'b', '$2b$10$CTmicor1K4Qo9G89Z1bWgut7H6/CnbcRw3B.5v6IEcTNkPDqgbXii', 1),
(3, 'aaaa', 'aaaa', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alphabet`
--
ALTER TABLE `alphabet`
  ADD PRIMARY KEY (`alpha_id`);

--
-- Indexes for table `alphaone`
--
ALTER TABLE `alphaone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alphatest`
--
ALTER TABLE `alphatest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alphathree`
--
ALTER TABLE `alphathree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alphatwo`
--
ALTER TABLE `alphatwo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animallesson1`
--
ALTER TABLE `animallesson1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animallesson2`
--
ALTER TABLE `animallesson2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animaltest`
--
ALTER TABLE `animaltest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colorone`
--
ALTER TABLE `colorone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colortest`
--
ALTER TABLE `colortest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colorthree`
--
ALTER TABLE `colorthree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colortwo`
--
ALTER TABLE `colortwo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_ID`);

--
-- Indexes for table `fruitlesson1`
--
ALTER TABLE `fruitlesson1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fruitlesson2`
--
ALTER TABLE `fruitlesson2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fruittest`
--
ALTER TABLE `fruittest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_ID`);

--
-- Indexes for table `number`
--
ALTER TABLE `number`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numberfive`
--
ALTER TABLE `numberfive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numberfour`
--
ALTER TABLE `numberfour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numberone`
--
ALTER TABLE `numberone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numbertest`
--
ALTER TABLE `numbertest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numberthree`
--
ALTER TABLE `numberthree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numbertwo`
--
ALTER TABLE `numbertwo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useradmin`
--
ALTER TABLE `useradmin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alphabet`
--
ALTER TABLE `alphabet`
  MODIFY `alpha_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alphaone`
--
ALTER TABLE `alphaone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `alphatest`
--
ALTER TABLE `alphatest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `animallesson1`
--
ALTER TABLE `animallesson1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `animallesson2`
--
ALTER TABLE `animallesson2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `animaltest`
--
ALTER TABLE `animaltest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `colorone`
--
ALTER TABLE `colorone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colortest`
--
ALTER TABLE `colortest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `colorthree`
--
ALTER TABLE `colorthree`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `colortwo`
--
ALTER TABLE `colortwo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fruitlesson1`
--
ALTER TABLE `fruitlesson1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fruitlesson2`
--
ALTER TABLE `fruitlesson2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fruittest`
--
ALTER TABLE `fruittest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `number`
--
ALTER TABLE `number`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `numberfive`
--
ALTER TABLE `numberfive`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000001;

--
-- AUTO_INCREMENT for table `numberfour`
--
ALTER TABLE `numberfour`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=901;

--
-- AUTO_INCREMENT for table `numberone`
--
ALTER TABLE `numberone`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `numbertest`
--
ALTER TABLE `numbertest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `numberthree`
--
ALTER TABLE `numberthree`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `numbertwo`
--
ALTER TABLE `numbertwo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `TID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `useradmin`
--
ALTER TABLE `useradmin`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
