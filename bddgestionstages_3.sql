-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 mars 2023 à 14:21
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : ` bddgestionstages`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `NUMCLASS` int(2) NOT NULL AUTO_INCREMENT,
  `LIBCLASS` char(10) DEFAULT NULL,
  `ANNEEDEBUT` date DEFAULT NULL,
  `ANNEEFIN` date DEFAULT NULL,
  PRIMARY KEY (`NUMCLASS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`NUMCLASS`, `LIBCLASS`, `ANNEEDEBUT`, `ANNEEFIN`) VALUES
(1, '2TSSL', '2022-09-02', '2023-07-03'),
(2, '1TSIO', '2018-09-03', '2019-07-01'),
(3, '2TSSL', '2018-09-03', '2019-07-01');

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

DROP TABLE IF EXISTS `enseigner`;
CREATE TABLE IF NOT EXISTS `enseigner` (
  `NUMMAT` int(2) NOT NULL,
  `NUMPROF` int(2) NOT NULL,
  `NUMCLASS` int(2) NOT NULL,
  `HEUREMAT` time DEFAULT NULL,
  PRIMARY KEY (`NUMMAT`,`NUMPROF`,`NUMCLASS`),
  KEY `FK_ENSEIGNER_PROF` (`NUMPROF`),
  KEY `FK_ENSEIGNER_CLASSE` (`NUMCLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`NUMMAT`, `NUMPROF`, `NUMCLASS`, `HEUREMAT`) VALUES
(1, 2, 1, '02:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `NUMENT` int(2) NOT NULL AUTO_INCREMENT,
  `NUMSECT` int(2) NOT NULL,
  `NOMENT` char(50) DEFAULT NULL,
  `ADRESSENT` char(100) DEFAULT NULL,
  `REPR?SENTANTENT` char(50) DEFAULT NULL,
  `QUALITEREPENT` char(20) DEFAULT NULL,
  `SERVICE` char(20) DEFAULT NULL,
  `TELENT` int(10) DEFAULT NULL,
  `MAILENT` char(100) DEFAULT NULL,
  `LIEU` char(100) DEFAULT NULL,
  PRIMARY KEY (`NUMENT`),
  KEY `FK_ENTREPRISE_SECTEUR` (`NUMSECT`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`NUMENT`, `NUMSECT`, `NOMENT`, `ADRESSENT`, `REPR?SENTANTENT`, `QUALITEREPENT`, `SERVICE`, `TELENT`, `MAILENT`, `LIEU`) VALUES
(1, 3, 'BMPM', '9, boulevard de Strasbourg 13233 Marseille', NULL, NULL, NULL, 632289878, NULL, 'Marseille'),
(2, 3, 'Préfecture des Bouches du Rhône', 'Place Felix Barret CS 80001\r\n13282 Marseille cedex 6', 'Lepage Thierry', 'Directeur DIDSIC', NULL, 484354400, 'thierry.lepage@bouches-du-rhone.gouv.fr', 'Marseille'),
(3, 4, 'Provencoder', '2A DRINAN ST, SULLIVAN\'S QUAY,CORK IRELAND', 'Logan Kieran', 'CTO', NULL, NULL, 'kieran@provencoder.com', 'Ireland'),
(4, 5, 'Aix Marseille Université DOSI Campus Timône', '27 Boulevard Jean Moulin\r\n13005 MARSEILLE', 'LESTRELIN Emmanuel', 'Ingénieur système', NULL, 486136531, 'emmanuel.lestrelin@univ-amu.fr', 'Marseille'),
(5, 6, 'IKIMO9', '179 voie atlas ATHELIAS III 13600 La Ciotat', 'Lopes Serge', 'Responsable', 'développement', NULL, 'slopes@lcsgroup.fr', 'Ciotat');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `NUMETUD` int(2) NOT NULL AUTO_INCREMENT,
  `NUMCLASS` int(2) NOT NULL,
  `NOMETUD` char(50) DEFAULT NULL,
  `PREETUD` char(50) DEFAULT NULL,
  `SEXEETUD` tinyint(1) DEFAULT NULL,
  `DATENAISSETUD` date DEFAULT NULL,
  `ADRESSETUD` char(100) DEFAULT NULL,
  `TELETUD` bigint(10) DEFAULT NULL,
  `MAILETUD` char(100) DEFAULT NULL,
  `SPEETUD` varchar(30) DEFAULT NULL,
  `FORMETUD` char(50) DEFAULT NULL,
  `COMPAGNIEASSURANCEMALADIE` char(50) DEFAULT NULL,
  `ADRESSEMALADIE` char(100) DEFAULT NULL,
  `NUMCONTRATMAL` smallint(30) DEFAULT NULL,
  PRIMARY KEY (`NUMETUD`),
  KEY `FK_ETUDIANT_CLASSE` (`NUMCLASS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`NUMETUD`, `NUMCLASS`, `NOMETUD`, `PREETUD`, `SEXEETUD`, `DATENAISSETUD`, `ADRESSETUD`, `TELETUD`, `MAILETUD`, `SPEETUD`, `FORMETUD`, `COMPAGNIEASSURANCEMALADIE`, `ADRESSEMALADIE`, `NUMCONTRATMAL`) VALUES
(1, 3, 'tonton', 'phil', NULL, NULL, '16 Bd Jeanne d\'Arc, 13005 Marseille', 671665554, 'totont.phil@gmail.com', 'SLAM', 'BTS SIO', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `NUMMAT` int(2) NOT NULL AUTO_INCREMENT,
  `LIBELLEMAT` char(50) DEFAULT NULL,
  PRIMARY KEY (`NUMMAT`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`NUMMAT`, `LIBELLEMAT`) VALUES
(1, 'Anglais'),
(2, 'Atelier Professionnel'),
(3, 'Cybersecurite'),
(4, 'SLAM'),
(5, 'SUP.DISPOS.SERV.INF.'),
(6, 'CEJM'),
(7, 'Maths poujr l\'informatique'),
(8, 'Culture general'),
(9, 'parc certfication');

-- --------------------------------------------------------

--
-- Structure de la table `outils`
--

DROP TABLE IF EXISTS `outils`;
CREATE TABLE IF NOT EXISTS `outils` (
  `NUMOUT` smallint(1) NOT NULL AUTO_INCREMENT,
  `LIBOUT` char(50) DEFAULT NULL,
  PRIMARY KEY (`NUMOUT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `outils`
--

INSERT INTO `outils` (`NUMOUT`, `LIBOUT`) VALUES
(1, 'HTML'),
(2, 'CSS'),
(3, 'JS'),
(4, 'C#');

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `NUMPROF` int(2) NOT NULL AUTO_INCREMENT,
  `NOMPROF` char(50) DEFAULT NULL,
  `PREPROF` char(50) DEFAULT NULL,
  `TELPROF` int(10) DEFAULT NULL,
  `MAILPROF` char(100) DEFAULT NULL,
  `TOTALHEURECOURPROF` time DEFAULT NULL,
  PRIMARY KEY (`NUMPROF`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`NUMPROF`, `NOMPROF`, `PREPROF`, `TELPROF`, `MAILPROF`, `TOTALHEURECOURPROF`) VALUES
(1, 'Demede', 'Michel', NULL, 'michel.demede@free.fr', '12:00:00'),
(2, 'Casta', 'Joelle', NULL, NULL, '02:00:00'),
(3, 'Garnier', 'Marine', NULL, NULL, '05:00:00'),
(4, 'Gilly', 'Fabrice', NULL, NULL, '05:00:00'),
(5, 'Godard-Tsapis', 'Helene', NULL, NULL, '02:00:00'),
(6, 'Michaud', 'Christian', NULL, NULL, '05:00:00'),
(7, 'Tormento', 'Sylvie', NULL, NULL, '08:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

DROP TABLE IF EXISTS `secteur`;
CREATE TABLE IF NOT EXISTS `secteur` (
  `NUMSECT` int(2) NOT NULL AUTO_INCREMENT,
  `LIBSECT` char(50) DEFAULT NULL,
  `TYPESECT` char(50) DEFAULT NULL,
  PRIMARY KEY (`NUMSECT`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`NUMSECT`, `LIBSECT`, `TYPESECT`) VALUES
(1, NULL, 'Primaire'),
(2, NULL, 'Secondaire'),
(3, 'Fonction publique', 'Tertiaire'),
(4, '?', '?'),
(5, 'Université Aix Marseille', 'Tertiaire'),
(6, 'Immobilier', 'Tertiaire');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `NUMSPE` smallint(1) NOT NULL AUTO_INCREMENT,
  `LIBSPE` char(50) DEFAULT NULL,
  PRIMARY KEY (`NUMSPE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`NUMSPE`, `LIBSPE`) VALUES
(1, 'SLAM'),
(2, 'SISR');

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `NUMST` int(2) NOT NULL AUTO_INCREMENT,
  `NUMTUT` int(2) NOT NULL,
  `NUMENT` int(2) NOT NULL,
  `NUMOUT` smallint(1) NOT NULL,
  `NUMETUD` int(2) NOT NULL,
  `NUMSPE` smallint(1) NOT NULL,
  `NUMPROF` int(2) NOT NULL,
  `NUMTYPE` int(2) NOT NULL,
  `GRATIFST` int(3) DEFAULT NULL,
  `DATEDEST` date DEFAULT NULL,
  `DATEFINST` date DEFAULT NULL,
  `NBJOURST` bigint(2) DEFAULT NULL,
  `HEUREST` time DEFAULT NULL,
  `COMST` char(200) DEFAULT NULL,
  PRIMARY KEY (`NUMST`),
  KEY `FK_STAGE_TUTEUR` (`NUMTUT`),
  KEY `FK_STAGE_ENTREPRISE` (`NUMENT`),
  KEY `FK_STAGE_OUTILS` (`NUMOUT`),
  KEY `FK_STAGE_ETUDIANT` (`NUMETUD`),
  KEY `FK_STAGE_SPECIALITE` (`NUMSPE`),
  KEY `FK_STAGE_PROF` (`NUMPROF`),
  KEY `FK_STAGE_TYPE_STAGE` (`NUMTYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`NUMST`, `NUMTUT`, `NUMENT`, `NUMOUT`, `NUMETUD`, `NUMSPE`, `NUMPROF`, `NUMTYPE`, `GRATIFST`, `DATEDEST`, `DATEFINST`, `NBJOURST`, `HEUREST`, `COMST`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tuteur`
--

DROP TABLE IF EXISTS `tuteur`;
CREATE TABLE IF NOT EXISTS `tuteur` (
  `NUMTUT` int(2) NOT NULL AUTO_INCREMENT,
  `NUMENT` int(2) NOT NULL,
  `NOMTUT` char(50) DEFAULT NULL,
  `PRETUT` char(50) DEFAULT NULL,
  `FONCTUT` char(50) DEFAULT NULL,
  `TELTUT` int(10) DEFAULT NULL,
  `MAILTUT` char(100) DEFAULT NULL,
  PRIMARY KEY (`NUMTUT`),
  KEY `FK_TUTEUR_ENTREPRISE` (`NUMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tuteur`
--

INSERT INTO `tuteur` (`NUMTUT`, `NUMENT`, `NOMTUT`, `PRETUT`, `FONCTUT`, `TELTUT`, `MAILTUT`) VALUES
(1, 1, 'Delom', 'Pierre', NULL, 632289878, 'pierre.delom@intradef.gouv.fr');

-- --------------------------------------------------------

--
-- Structure de la table `type_stage`
--

DROP TABLE IF EXISTS `type_stage`;
CREATE TABLE IF NOT EXISTS `type_stage` (
  `NUMTYPE` int(2) NOT NULL AUTO_INCREMENT,
  `LI_BTYPE` char(50) DEFAULT NULL,
  PRIMARY KEY (`NUMTYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_stage`
--

INSERT INTO `type_stage` (`NUMTYPE`, `LI_BTYPE`) VALUES
(1, 'Dev WEB');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD CONSTRAINT `enseigner_ibfk_1` FOREIGN KEY (`NUMMAT`) REFERENCES `matiere` (`NUMMAT`),
  ADD CONSTRAINT `enseigner_ibfk_2` FOREIGN KEY (`NUMPROF`) REFERENCES `prof` (`NUMPROF`),
  ADD CONSTRAINT `enseigner_ibfk_3` FOREIGN KEY (`NUMCLASS`) REFERENCES `classe` (`NUMCLASS`);

--
-- Contraintes pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD CONSTRAINT `entreprise_ibfk_1` FOREIGN KEY (`NUMSECT`) REFERENCES `secteur` (`NUMSECT`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`NUMCLASS`) REFERENCES `classe` (`NUMCLASS`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `stage_ibfk_1` FOREIGN KEY (`NUMTUT`) REFERENCES `tuteur` (`NUMTUT`),
  ADD CONSTRAINT `stage_ibfk_2` FOREIGN KEY (`NUMENT`) REFERENCES `entreprise` (`NUMENT`),
  ADD CONSTRAINT `stage_ibfk_3` FOREIGN KEY (`NUMOUT`) REFERENCES `outils` (`NUMOUT`),
  ADD CONSTRAINT `stage_ibfk_4` FOREIGN KEY (`NUMETUD`) REFERENCES `etudiant` (`NUMETUD`),
  ADD CONSTRAINT `stage_ibfk_5` FOREIGN KEY (`NUMSPE`) REFERENCES `specialite` (`NUMSPE`),
  ADD CONSTRAINT `stage_ibfk_6` FOREIGN KEY (`NUMPROF`) REFERENCES `prof` (`NUMPROF`),
  ADD CONSTRAINT `stage_ibfk_7` FOREIGN KEY (`NUMTYPE`) REFERENCES `type_stage` (`NUMTYPE`);

--
-- Contraintes pour la table `tuteur`
--
ALTER TABLE `tuteur`
  ADD CONSTRAINT `tuteur_ibfk_1` FOREIGN KEY (`NUMENT`) REFERENCES `entreprise` (`NUMENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
