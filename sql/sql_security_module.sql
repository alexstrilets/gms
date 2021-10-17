
CREATE TABLE `sec_users` (
    `login` VARCHAR(255) NOT NULL,
    `pswd` VARCHAR(255) NOT NULL,
    `name` VARCHAR(64),
    `email` VARCHAR(255),
    `active` VARCHAR(1),
    `activation_code` VARCHAR(32),
    `priv_admin` VARCHAR(1),
    PRIMARY KEY (`login`)
)


CREATE TABLE `sec_apps` (
    `app_name` VARCHAR(128) NOT NULL,
    `app_type` VARCHAR(255),
    `description` VARCHAR(255),
    PRIMARY KEY (`app_name`)
)


CREATE TABLE `sec_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `description` (`description`)
)


CREATE TABLE `sec_users_groups` (
    `login` VARCHAR(255) NOT NULL,
    `group_id` int(11) NOT NULL,
    PRIMARY KEY (`login`, `group_id`)
)

ALTER TABLE `sec_users_groups` ADD CONSTRAINT `sec_users_groups_ibfk_1` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE

ALTER TABLE `sec_users_groups` ADD CONSTRAINT `sec_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE


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

