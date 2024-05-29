-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 29 mai 2024 à 14:00
-- Version du serveur : 5.7.40
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locationvoiliers`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `IdClient` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdClient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`IdClient`, `Nom`, `Ville`) VALUES
(330, 'Dupont', 'Lacanau'),
(128, 'Roka', 'Bastia'),
(210, 'Gaber', 'Nice'),
(325, 'Oualali', 'Nice'),
(278, 'Wiart', 'Arcachon'),
(111, 'Rousseau', 'Hourtin'),
(945, 'Rousselle', 'Porto'),
(357, 'Fallon', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `NumVoilier` int(11) NOT NULL,
  `NumClient` int(11) NOT NULL,
  `Debut` date NOT NULL,
  `Fin` date DEFAULT NULL,
  PRIMARY KEY (`NumVoilier`,`NumClient`,`Debut`),
  KEY `NumClient` (`NumClient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`NumVoilier`, `NumClient`, `Debut`, `Fin`) VALUES
(110, 330, '2023-01-01', '2023-01-08'),
(160, 111, '2023-02-01', '2023-02-08'),
(456, 330, '2023-03-01', '2023-03-08'),
(456, 330, '2023-04-01', '2023-04-08'),
(484, 278, '2023-05-01', '2023-05-08'),
(484, 278, '2023-06-01', '2023-06-08'),
(484, 278, '2023-07-01', '2023-07-08'),
(120, 325, '2023-08-01', '2023-08-08'),
(120, 325, '2023-09-01', '2023-09-08'),
(494, 330, '2023-10-01', '2023-10-08'),
(149, 325, '2023-11-01', '2023-11-08'),
(120, 128, '2023-12-01', '2023-12-08'),
(456, 210, '2023-01-15', '2023-01-22'),
(494, 128, '2023-02-15', '2023-02-22'),
(358, 325, '2023-03-15', '2023-03-22'),
(365, 945, '2023-04-15', '2023-04-22'),
(360, 330, '2023-05-15', '2023-05-22');

-- --------------------------------------------------------

--
-- Structure de la table `succursale`
--

DROP TABLE IF EXISTS `succursale`;
CREATE TABLE IF NOT EXISTS `succursale` (
  `Base` varchar(50) NOT NULL,
  `Directeur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Base`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `succursale`
--

INSERT INTO `succursale` (`Base`, `Directeur`) VALUES
('Hourtin', 'Smith'),
('Lacanau', 'Godel'),
('Porto', 'Escher'),
('Bastia', 'Mozart'),
('Arcachon', 'Godart'),
('Mimizan', 'Bach');

-- --------------------------------------------------------

--
-- Structure de la table `voilier`
--

DROP TABLE IF EXISTS `voilier`;
CREATE TABLE IF NOT EXISTS `voilier` (
  `IdVoilier` int(11) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  `Etat` varchar(50) DEFAULT NULL,
  `Base` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdVoilier`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `voilier`
--

INSERT INTO `voilier` (`IdVoilier`, `Type`, `Prix`, `Etat`, `Base`) VALUES
(110, 'optimist', '300.00', '1', 'Arcachon'),
(120, 'optimist', '300.00', '2', 'Arcachon'),
(160, 'optimist', '250.00', '6', 'Hourtin'),
(165, 'optimist', '220.00', '3', 'Hourtin'),
(456, '407', '450.00', '2', 'Lacanau'),
(484, '407', '450.00', '3', 'Arcachon'),
(494, '407', '400.00', '5', 'Arcachon'),
(124, '421', '400.00', '3', 'Arcachon'),
(145, '421', '420.00', '4', 'Lacanau'),
(147, '421', '420.00', '3', 'Lacanau'),
(149, '421', '300.00', '6', 'Hourtin'),
(358, 'planche', '150.00', '2', 'Bastia'),
(360, 'planche', '130.00', '2', 'Porto'),
(365, 'planche', '125.00', '3', 'Lacanau');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
