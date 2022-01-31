DROP TABLE IF EXISTS `sec_users`;
CREATE TABLE `sec_users` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(255) NOT NULL,
    `pswd` VARCHAR(255) NULL,
    `fname` VARCHAR(64),
    `lname` VARCHAR(64),
    `email` VARCHAR(255),
    `title` VARCHAR(255),
    `active` VARCHAR(1) NOT NULL DEFAULT 'Y',
    `role_id` int(11) NOT NULL,
    `activation_code` VARCHAR(32) ,
    `priv_admin` VARCHAR(1), 
     PRIMARY KEY (`_id`),
     UNIQUE KEY unique_login (login),
     INDEX role_ind (`role_id`),
     FOREIGN KEY (`role_id`)
        REFERENCES `user_roles`(`_id`)
        ON DELETE RESTRICT
)

DROP VIEW IF EXISTS `users`;
CREATE VIEW `users` as 
select 
`_id`, `login`, `fname`, `lname`,  `email`, `title`, `role_id`
FROM `sec_users` where UPPER(active) = 'Y';

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `role_name` VARCHAR(255) NOT NULL,
    `role_description` VARCHAR(255) NOT NULL,
     PRIMARY KEY (`_id`)
);