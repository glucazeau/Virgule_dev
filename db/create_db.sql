-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 07 Octobre 2012 à 15:48
-- Version du serveur: 5.5.28
-- Version de PHP: 5.4.7

SET foreign_key_checks = 0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `virgule`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenants`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registration_date` datetime NOT NULL,
  `lastname` varchar(50) NOT NULL COLLATE utf8_bin,
  `firstname` varchar(50) NOT NULL COLLATE utf8_bin,
  `birthdate` date DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8_bin,
  `cellphone_number` varchar(10) COLLATE utf8_bin,
  `address` varchar(50) COLLATE utf8_bin DEFAULT '',
  `zipcode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `nationality` varchar(50) COLLATE utf8_bin DEFAULT '',
  `marital_status` varchar(20) COLLATE utf8_bin DEFAULT '',
  `commentaires` mediumtext COLLATE utf8_bin,
  `registring_date` date NOT NULL,
  `picture_path` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `scholarized` tinyint(4) DEFAULT NULL,
  `profession` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `scholarized_in_the_country` tinyint(4) DEFAULT NULL,
  `scholarized_in_a foreign_country` tinyint(4) DEFAULT NULL,
  `scholarization_level` tinyint(4) DEFAULT NULL,
  `emergency_contact_lastname` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `emergency_contact_firstname` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `emergency_contact_phone_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `emergency_contact_connection_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `fk_native_country_id` int(10) unsigned DEFAULT NULL,
  `fk_welcomed_by_teacher_id` int(10) unsigned DEFAULT NULL,
  `fk_mother_tongue_id` int(10) unsigned DEFAULT NULL,
  `fk_scholarization_language_id` int(10) unsigned DEFAULT NULL,
  `fk_proposed_level_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY `fk_native_country_id` (`fk_native_country_id`) REFERENCES country(id),
  FOREIGN KEY `fk_welcomed_by_teacher_id` (`fk_welcomed_by_teacher_id`) REFERENCES teacher(id),
  FOREIGN KEY `fk_mother_tongue_id` (`fk_mother_tongue_id`) REFERENCES languages(id),
  FOREIGN KEY `fk_scholarization_language_id` (`fk_scholarization_language_id`) REFERENCES language(id),
  FOREIGN KEY `fk_proposed_level_id` (`fk_proposed_level_id`) REFERENCES level(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Structure de la table `attended`
--

CREATE TABLE IF NOT EXISTS `attended` (
  `fk_student_id` int(10) unsigned NOT NULL REFERENCES student(id),
  `fk_session_id` int(10) unsigned NOT NULL REFERENCES session(id),
  PRIMARY KEY (`fk_student_id`,`fk_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day_of_week` tinyint(4) NOT NULL DEFAULT '1',
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `alternate_startdate` date DEFAULT NULL,
  `alternate_enddate` date DEFAULT NULL,
  `fk_level_id` int(10) unsigned NOT NULL REFERENCES level(id),
  `fk_semester_id` int(10) unsigned NOT NULL REFERENCES semester(id),
  `fk_teacher_id` int(10) unsigned NOT NULL REFERENCES teacher(id),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `organization_branch`
--

CREATE TABLE IF NOT EXISTS `organization_branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `president_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone_number` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fax_number` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `email_address` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `enrolled`
--

CREATE TABLE IF NOT EXISTS `enrolled` (
  `fk_student_id` int(10) unsigned NOT NULL REFERENCES student(id),
  `fk_course_id` int(10) unsigned NOT NULL REFERENCES course(id),
  PRIMARY KEY (`fk_student_id`,`fk_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `formateurs`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `last_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone_number` varchar(10) COLLATE utf8_bin DEFAULT '0',
  `cellphone_number` varchar(10) COLLATE utf8_bin DEFAULT '0',
  `email_address` varchar(50) COLLATE utf8_bin DEFAULT '',
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `registration_date` datetime NOT NULL,
  `last_connection_date` datetime DEFAULT NULL,
  `fk_role_id` int(11) NOT NULL REFERENCES roles(id),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `langues`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `alternative_names` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `niveaux`
--

CREATE TABLE IF NOT EXISTS `class_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `html_color_code` varchar(7) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `parle`
--

CREATE TABLE IF NOT EXISTS `speaks` (
  `fk_language_id` int(10) unsigned NOT NULL REFERENCES language(id),
  `fk_student_id` int(10) unsigned NOT NULL REFERENCES student(id),
  PRIMARY KEY (`fk_language_id`,`fk_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_bin NOT NULL,
  `iso_code` varchar(3) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classroom`
--

CREATE TABLE IF NOT EXISTS `classroom` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `comments` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `class_session`
--

CREATE TABLE IF NOT EXISTS `class_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `summary` mediumtext COLLATE utf8_bin,
  `fk_class_id` int(10) unsigned NOT NULL REFERENCES class(id),
  `fk_session_teacher_id` int(10) unsigned NOT NULL REFERENCES teacher(id),
  `fk_summary_teacher_id` int(10) unsigned NOT NULL REFERENCES teacher(id),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` tinytext COLLATE utf8_bin,
  `date` datetime NOT NULL,
  `fk_teacher_id` int(10) unsigned NOT NULL REFERENCES teacher(id),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Structure de la table `commented`
--

CREATE TABLE IF NOT EXISTS `commented` (
`fk_student_id` int(10) unsigned NOT NULL REFERENCES student(id),
`fk_teacher_id` int(10) unsigned NOT NULL REFERENCES teacher(id),
  PRIMARY KEY (`fk_student_id`, `fk_teacher_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


SET foreign_key_checks = 1;