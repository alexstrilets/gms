
DROP TABLE IF EXISTS `sec_users`;
CREATE TABLE `sec_users` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(255) NOT NULL,
    `pswd` VARCHAR(255) NOT NULL,
    `fname` VARCHAR(64),
    `lname` VARCHAR(64),
    `email` VARCHAR(255),
    `title` VARCHAR(255),
    `active` VARCHAR(1),
    `activation_code` VARCHAR(32),
    `priv_admin` VARCHAR(1), 
     PRIMARY KEY (`_id`),
     UNIQUE KEY unique_login (login)
)

DROP TABLE IF EXISTS ``;
CREATE TABLE `sec_apps` (
    `app_name` VARCHAR(128) NOT NULL,
    `app_type` VARCHAR(255),
    `description` VARCHAR(255),
    PRIMARY KEY (`app_name`)
)

DROP TABLE IF EXISTS ``;
CREATE TABLE `sec_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `ldescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `description` (`description`)
)

DROP TABLE IF EXISTS ``;
CREATE TABLE `sec_users_groups` (
    `login` VARCHAR(255) NOT NULL,
    `group_id` int(11) NOT NULL,
    PRIMARY KEY (`login`, `group_id`)
)

ALTER TABLE `sec_users_groups` ADD CONSTRAINT `sec_users_groups_ibfk_1` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE RESTRICT

ALTER TABLE `sec_users_groups` ADD CONSTRAINT `sec_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE RESTRICT

DROP TABLE IF EXISTS ``;
CREATE TABLE `sec_groups_apps` (
    `group_id` int(11) NOT NULL,
    `app_name` VARCHAR(128) NOT NULL,
    `priv_access` VARCHAR(1),
    `priv_insert` VARCHAR(1),
    `priv_delete` VARCHAR(1),
    `priv_update` VARCHAR(1),
    `priv_export` VARCHAR(1),
    `priv_print` VARCHAR(1),
    PRIMARY KEY (`group_id`, `app_name`)

)

ALTER TABLE `sec_groups_apps` ADD CONSTRAINT `sec_groups_apps_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE

ALTER TABLE `sec_groups_apps` ADD CONSTRAINT `sec_groups_apps_ibfk_2` FOREIGN KEY (`app_name`) REFERENCES `sec_apps` (`app_name`) ON DELETE CASCADE

--- Calendar
DROP TABLE IF EXISTS `calendar_meetings`;
CREATE TABLE IF NOT EXISTS `calendar_meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `description` text,
  `start_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `recurrence` varchar(1) DEFAULT NULL,
  `period` varchar(1) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `id_api` varchar(255) DEFAULT NULL,
  `id_event_google` varchar(255) DEFAULT NULL,
  `recur_info` varchar(255) DEFAULT NULL,
  `event_color` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `reminder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;