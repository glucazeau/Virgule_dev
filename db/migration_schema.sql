SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE `alpha_a_passe` ,
`alpha_documents` ,
`alpha_examens` ,
`alpha_types_documents` ;


-- date séance => date/heure
ALTER TABLE `alpha_seances` CHANGE `date_seance` `date_seance` DATETIME NOT NULL;

-- Formateurs
ALTER TABLE `alpha_formateurs` CHANGE `tel_fixe` `tel_fixe` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '';
ALTER TABLE `alpha_formateurs` CHANGE `tel_portable` `tel_portable` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '';
ALTER TABLE `alpha_apprenants` DROP `actif_yn`;
ALTER TABLE `alpha_formateurs` CHANGE `login` `login` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;  
ALTER TABLE `alpha_formateurs` CHANGE `mot_de_passe` `mot_de_passe` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;  

-- Salles
CREATE TABLE `alphacrf`.`alpha_salles` (
`id_salle` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
`libelle_salle` VARCHAR( 100 ) NOT NULL ,
`infos_salle` TINYTEXT NULL ,
PRIMARY KEY ( `id_salle` )
) ENGINE = InnoDB ;

INSERT INTO `alphacrf`.`alpha_salles` (
`id_salle` ,
`libelle_salle` ,
`infos_salle`
)
VALUES 
(1 , 'Salle principale - Albert Thomas', '40 rue Albert Thomas - 75010 Paris'),
(2 , 'Salle secondaire - Albert Thomas', 'Musée - 40 rue Albert Thomas - 75010 Paris')
;

-- creation fk cours->salle
ALTER TABLE `alpha_cours` ADD `fk_id_salle` TINYINT( 3 ) UNSIGNED NOT NULL;
-- initialisation des salles
UPDATE `alpha_cours` SET fk_id_salle = 1;
-- création relation
ALTER TABLE `alpha_cours` ADD FOREIGN KEY ( `fk_id_salle` ) REFERENCES `alphacrf`.`alpha_salles` (
`id_salle`
) ON DELETE NO ACTION ON UPDATE NO ACTION ;


RENAME TABLE alpha_a_comme	 TO 	a_comme	;
RENAME TABLE alpha_a_participe_a	 TO 	a_participe_a	;
RENAME TABLE alpha_apprenants	 TO 	apprenants	;
RENAME TABLE alpha_cours	 TO 	cours	;
RENAME TABLE alpha_est_inscrit_a	 TO 	est_inscrit_a	;
RENAME TABLE alpha_formateurs	 TO 	formateurs	;
RENAME TABLE alpha_langues	 TO 	langues	;
RENAME TABLE alpha_niveaux	 TO 	niveaux	;
RENAME TABLE alpha_parle	 TO 	parle	;
RENAME TABLE alpha_pays	 TO 	pays	;
RENAME TABLE alpha_permissions	 TO 	permissions	;
RENAME TABLE alpha_possede	 TO 	possede	;
RENAME TABLE alpha_raisons_apprentissage	 TO 	raisons_apprentissage	;
RENAME TABLE alpha_salles	 TO 	salles	;
RENAME TABLE alpha_seances	 TO 	seances	;
RENAME TABLE alpha_sessions	 TO 	sessions	;
RENAME TABLE alpha_sites_web               	 TO 	sites_web	;

-- DEBUT sfDoctrineGuard
--
-- Table structure for table `sf_guard_forgot_password`
--

CREATE TABLE `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) default NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_group`
--

CREATE TABLE `sf_guard_group` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_group_permission`
--

CREATE TABLE `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL default '0',
  `permission_id` bigint(20) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_permission`
--

CREATE TABLE `sf_guard_permission` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_remember_key`
--

CREATE TABLE `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) default NULL,
  `remember_key` varchar(32) default NULL,
  `ip_address` varchar(50) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_user`
--

CREATE TABLE `sf_guard_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `email_address` varchar(255) NOT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL default 'sha1',
  `salt` varchar(128) default NULL,
  `password` varchar(128) default NULL,
  `is_active` tinyint(1) default '1',
  `is_super_admin` tinyint(1) default '0',
  `last_login` datetime default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_user_group`
--

CREATE TABLE `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL default '0',
  `group_id` bigint(20) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_user_permission`
--

CREATE TABLE `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL default '0',
  `permission_id` bigint(20) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  ADD CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_group_permission`
--
ALTER TABLE `sf_guard_group_permission`
  ADD CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  ADD CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_user_permission`
--
ALTER TABLE `sf_guard_user_permission`
  ADD CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

ALTER TABLE `sf_guard_user` ADD `tel_fixe` VARCHAR( 10 ) AFTER `email_address` ,
ADD `tel_portable` VARCHAR( 10 ) AFTER `tel_fixe` ;

-- FIN sfDoctrineGuard
SET FOREIGN_KEY_CHECKS = 1;