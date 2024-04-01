-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 30, 2024 at 03:14 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediatek`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonnements`
--

DROP TABLE IF EXISTS `abonnements`;
CREATE TABLE IF NOT EXISTS `abonnements` (
  `id_abonnement` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `prix` decimal(6,3) NOT NULL,
  PRIMARY KEY (`id_abonnement`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abonnements`
--

INSERT INTO `abonnements` (`id_abonnement`, `id_user`, `date_debut`, `date_fin`, `prix`) VALUES
(9, 12, '2024-03-30', '2024-06-30', 22.000);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id_document` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('livre','film','audicd') COLLATE utf8mb4_general_ci NOT NULL,
  `createur` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_de_sortie` date NOT NULL,
  `nombre_exemplaire` int NOT NULL,
  `image` varchar(510) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_document`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id_document`, `titre`, `type`, `createur`, `description`, `genre`, `date_de_sortie`, `nombre_exemplaire`, `image`) VALUES
(1, 'Soul', 'livre', 'Erika Landon', '\"Soul\" by Erika Landon is a transcendent exploration of the depths of human consciousness and the interconnectedness of all beings. With prose that flows like a gentle stream and insights that resonate with the echoes of eternity, Landon crafts a luminous', 'science', '2018-03-09', 45, 'book1.jpg'),
(2, 'Space', 'livre', 'Erika Landon', 'In \"Space,\" Erika Landon invites readers on an unforgettable odyssey through the vast expanses of the universe. With prose that sparkles like distant stars and a narrative that dances between the realms of science and poetry, Landon crafts a symphony of c', 'science', '2018-03-09', 30, 'book2.jpg'),
(3, 'The Nightingale', 'film', 'Jennifer Kent', 'Set in 1825, Clare, a young Irish convict woman, chases a British officer through the rugged Tasmanian wilderness, bent on revenge for a terrible act of violence he committed against her family. On the way she enlists the services of an Aboriginal tracker', 'thriller', '2018-03-15', 18, 'book3.jpg'),
(4, 'The GodFather', 'film', 'Francis Ford Coppola', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'crime drama', '1972-03-13', 33, 'movie2.jpeg'),
(5, 'I Am Legend', 'film', 'Francis Lawrence', 'Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.', 'Action Drama', '2007-03-21', 70, 'movie3.jpeg'),
(6, 'Peaky Blinders', 'film', 'Steven Knight', 'A gangster family epic set in 1900s England, centering on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.', 'drama crime', '2013-06-10', 100, 'movie4.jpeg'),
(7, 'Breaking Bad', 'livre', 'Vince Gilligan', 'A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family\'s future.', 'crime thriller drame', '2008-03-14', 100, 'movie5.jpeg'),
(8, 'The World of Ice&Fire', 'livre', 'George R. R. Martin', 'This lavishly illustrated volume is a comprehensive history of the Seven Kingdoms, providing vividly constructed accounts of the epic battles, bitter rivalries, and daring rebellions that lead to the events of A Song of Ice and Fire and HBO’s Game of Thro', 'fantasy', '2014-10-28', 50, 'book4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `emprunts`
--

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE IF NOT EXISTS `emprunts` (
  `id_emprunt` int NOT NULL AUTO_INCREMENT,
  `id_document` int NOT NULL,
  `type_document` enum('livre','film','audiocd') COLLATE utf8mb4_general_ci NOT NULL,
  `id_emprunteur` int NOT NULL,
  `id_bibliotecaire` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_retour` date NOT NULL,
  PRIMARY KEY (`id_emprunt`),
  KEY `id_bibliotecaire` (`id_bibliotecaire`),
  KEY `id_document` (`id_document`),
  KEY `id_emprunteur` (`id_emprunteur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

DROP TABLE IF EXISTS `lists`;
CREATE TABLE IF NOT EXISTS `lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_document` int NOT NULL,
  `date_ajout` date NOT NULL,
  `type` enum('souhait','favori') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_document` (`id_document`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_maker` int NOT NULL,
  `type_element` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_element` int NOT NULL,
  `date_action` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `action`, `id_maker`, `type_element`, `id_element`, `date_action`) VALUES
(1, 'ajout taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(2, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(3, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(4, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(5, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(6, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(7, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(8, 'ajout taux', 0, 'Document', 2, '2024-03-28 00:00:00'),
(9, 'modification taux', 0, 'Document', 2, '2024-03-28 00:00:00'),
(10, 'modification taux', 0, 'Document', 2, '2024-03-28 00:00:00'),
(11, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(12, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(13, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(14, 'modification taux', 0, 'Document', 2, '2024-03-28 00:00:00'),
(15, 'modification taux', 0, 'Document', 2, '2024-03-28 00:00:00'),
(16, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(17, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(18, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(19, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(20, 'modification taux', 0, 'Document', 1, '2024-03-28 00:00:00'),
(21, 'modification taux', 0, 'Document', 2, '2024-03-28 00:00:00'),
(22, 'modification taux', 9, 'Document', 1, '2024-03-28 00:00:00'),
(23, 'modification taux', 9, 'Document', 2, '2024-03-28 00:00:00'),
(24, 'modification taux', 9, 'Document', 1, '2024-03-28 23:20:29'),
(25, 'modification taux', 9, 'Document', 1, '2024-03-29 00:37:13'),
(26, 'modification taux', 9, 'Document', 1, '2024-03-29 03:52:40'),
(27, 'modification taux', 9, 'Document', 2, '2024-03-29 15:19:19'),
(28, 'ajout taux', 10, 'Document', 2, '2024-03-29 21:28:27'),
(29, 'ajout taux', 9, 'Document', 3, '2024-03-29 22:46:32'),
(30, 'ajout taux', 9, 'Document', 8, '2024-03-30 02:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `taux`
--

DROP TABLE IF EXISTS `taux`;
CREATE TABLE IF NOT EXISTS `taux` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_document` int NOT NULL,
  `id_user` int NOT NULL,
  `taux` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_document` (`id_document`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_de_naissance` date NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('admin','bibliotecaire','user') COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` enum('homme','femme') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `user_name`, `password`, `email`, `nom`, `prenom`, `date_de_naissance`, `telephone`, `type`, `adresse`, `genre`) VALUES
(1, 'lucifer', '123456', 'anouer@mail.com', 'inoubli', 'anouer', '2024-03-01', '58100621', 'admin', 'sidi hssine', 'homme'),
(12, 'aaaaaaaa', '236c8637b0b192efd17ba0d0f802d1b1cc3887ecf7cb60c514644b6a4a4a92f8', 'a3@gmail.com', 'aaaaaaaaaa', 'aaaaaaaa', '2018-03-02', '54124749', 'user', 'aaaaaaaaa', 'homme');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abonnements`
--
ALTER TABLE `abonnements`
  ADD CONSTRAINT `abonnements_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`id_bibliotecaire`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`id_document`) REFERENCES `documents` (`id_document`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunts_ibfk_3` FOREIGN KEY (`id_emprunteur`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lists`
--
ALTER TABLE `lists`
  ADD CONSTRAINT `lists_ibfk_1` FOREIGN KEY (`id_document`) REFERENCES `documents` (`id_document`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lists_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taux`
--
ALTER TABLE `taux`
  ADD CONSTRAINT `taux_ibfk_1` FOREIGN KEY (`id_document`) REFERENCES `documents` (`id_document`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `taux_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
