DROP TABLE IF EXISTS `meetings`;
CREATE TABLE `meetings` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(128) NOT NULL,
    `virtual` VARCHAR(1) NOT NULL DEFAULT 'Y',
    `location_id` int(11) NOT NULL,
    `meeting_url` VARCHAR(128) NULL,
    `start_date` date DEFAULT NULL,
    `start_time` time DEFAULT NULL,
    `end_time` time DEFAULT NULL,
    `duration` int(11) DEFAULT 1,
    PRIMARY KEY (`_id`),
    FOREIGN KEY (`location_id`)
        REFERENCES `meeting_locations`(`_id`)
        ON DELETE RESTRICT
);

DROP TABLE IF EXISTS `meeting_locations`;
CREATE TABLE `meeting_locations` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `location` VARCHAR(255) NOT NULL,
    `additional_description` VARCHAR(255) NOT NULL,
     PRIMARY KEY (`_id`)
);

DROP TABLE IF EXISTS `meeting_attandance`;
CREATE TABLE `meeting_attandance` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `meeting_id` int(11) NOT NULL,
     PRIMARY KEY (`_id`),
     INDEX login_ind (`user_id`),
     FOREIGN KEY (`user_id`)
        REFERENCES `sec_users`(`_id`)
        ON DELETE RESTRICT,
     INDEX meeting_ind (`meeting_id`),
     FOREIGN KEY (`meeting_id`)
        REFERENCES `meetings`(`_id`)
        ON DELETE RESTRICT
);


DROP TABLE IF EXISTS `agenda_items`;
CREATE TABLE `agenda_items` (
    `_id` int(11) NOT NULL AUTO_INCREMENT,
    `meeting_id` INT(11) NULL,
    `item_title` VARCHAR(128) NULL,
    `item_details` VARCHAR(128) NULL,
    `decision_required` boolean default 0,
    PRIMARY KEY (`_id`)
);

DROP VIEW IF EXISTS `pending_items`;
CREATE VIEW `pending_items` as 
select 
`_id`, `item_title`, `item_details`, `decision_required` 
FROM `agenda_items` WHERE meeting_id IS NULL;

DROP VIEW IF EXISTS `users`;
CREATE VIEW `users` as 
select 
`_id`, `fname`, `lname`, `email`, `title` 
FROM `sec_users`;