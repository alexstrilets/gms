
/*
 * organization
 */
DROP TABLE IF EXISTS ogranization;
CREATE TABLE ogranization (
    _id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(32),
    website VARCHAR(64),
    boardNumber int(11) NOT NULL,
    boardQuorum int(11) NOT NULL,
    PRIMARY KEY (_id)
);
ALTER TABLE ogranization ENGINE = InnoDB;


/*
 * person
 */
DROP TABLE IF EXISTS person;
CREATE TABLE person (
    _id int(11) NOT NULL AUTO_INCREMENT,
    organization_id int(11) NOT NULL,
    lastName VARCHAR(64) NOT NULL, 
    firstName VARCHAR(64) NOT NULL, 
    startDate date NOT NULL, 
    endDate date DEFAULT NULL,
    email VARCHAR(64) NOT NULL, 
    phone VARCHAR(64) NOT NULL, 
    linkedIn VARCHAR(64) NOT NULL, 
    bio TEXT NOT NULL, 
    PRIMARY KEY (_id)
);
ALTER TABLE person ENGINE = InnoDB;  

ALTER TABLE person
    ADD CONSTRAINT fk_person_organization_id
    FOREIGN KEY (organization_id)
    REFERENCES ogranization(_id)
    ON DELETE RESTRICT;


/*
 * board_position
 */
DROP TABLE IF EXISTS board_position;
CREATE TABLE board_position (
    _id int(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(64) NOT NULL,
    voting boolean DEFAULT FALSE,
    PRIMARY KEY (_id)
);    
ALTER TABLE board_position ENGINE = InnoDB;


/*
 * committee_position
 */
DROP TABLE IF EXISTS committee_position;
CREATE TABLE committee_position (
    _id int(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(64) NOT NULL,
    voting boolean DEFAULT FALSE,
    PRIMARY KEY (_id)
);    
ALTER TABLE committee_position ENGINE = InnoDB;

/*
 * board
 */
DROP TABLE IF EXISTS board;
CREATE TABLE board (
    _id int(11) NOT NULL AUTO_INCREMENT,
    organization_id int(11) NOT NULL,
    board_position_id int(11) NOT NULL,
    person_id int(11) NOT NULL,
    PRIMARY KEY (_id)
);
ALTER TABLE board ENGINE = InnoDB; 

ALTER TABLE board
    ADD CONSTRAINT fk_board_organization_id
    FOREIGN KEY (organization_id)
    REFERENCES ogranization(_id)
    ON DELETE RESTRICT;

ALTER TABLE board
    ADD CONSTRAINT fk_board_board_position_id
    FOREIGN KEY (board_position_id)
    REFERENCES board_position(_id)
    ON DELETE RESTRICT;

ALTER TABLE board
    ADD CONSTRAINT fk_board_position_person_id
    FOREIGN KEY (person_id)
    REFERENCES person(_id)
    ON DELETE RESTRICT;   


/*
 * committee
 */
DROP TABLE IF EXISTS committee;
CREATE TABLE committee (
    _id int(11) NOT NULL AUTO_INCREMENT,
    organization_id int(11) NOT NULL,
    committee_name VARCHAR(128),
    committeeNumber int(11) NOT NULL,
    committeeQuorum int(11) NOT NULL,
    PRIMARY KEY (_id)
);
ALTER TABLE committee ENGINE = InnoDB;
ALTER TABLE committee
    ADD CONSTRAINT fk_committee_organization_id
    FOREIGN KEY (organization_id)
    REFERENCES ogranization(_id)
    ON DELETE RESTRICT;

/*
 * committee_member
 */
DROP TABLE IF EXISTS committee_member;
CREATE TABLE committee_member (
    _id int(11) NOT NULL AUTO_INCREMENT,
    committee_id int(11) NOT NULL,
    committee_position_id int(11) NOT NULL,
    person_id int(11) NOT NULL,
    PRIMARY KEY (_id)
);
ALTER TABLE committee_member ENGINE = InnoDB; 

ALTER TABLE committee_member
    ADD CONSTRAINT fk_committee_member_committee_id
    FOREIGN KEY (committee_id)
    REFERENCES committee(_id)
    ON DELETE RESTRICT;

ALTER TABLE committee_member
    ADD CONSTRAINT fk_committee_member_committee_position_id
    FOREIGN KEY (committee_position_id)
    REFERENCES committee_position(_id)
    ON DELETE RESTRICT;


ALTER TABLE committee_member
    ADD CONSTRAINT fk_committee_member_person_id
    FOREIGN KEY (person_id)
    REFERENCES person(_id)
    ON DELETE RESTRICT;   



/*
 * agenda
 */
DROP TABLE IF EXISTS agenda;
CREATE TABLE agenda (
    _id int(11) NOT NULL AUTO_INCREMENT,
    start_date DATETIME NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY (_id)
);
ALTER TABLE agenda ENGINE = InnoDB;

/*
 * action_item
 */
DROP TABLE IF EXISTS action_item;
CREATE TABLE action_item (
    _id int(11) NOT NULL AUTO_INCREMENT,
    agenda_id int(11) NOT NULL,
    description VARCHAR(256) NULL,
    created DATE NULL,
    due DATE NULL,
    deliverable boolean default true,
    task_owner_id int(11) NULL,
    PRIMARY KEY (_id)
);

ALTER TABLE agenda_item ENGINE = InnoDB;

ALTER TABLE action_item
    ADD CONSTRAINT fk_action_item_agenda_id
    FOREIGN KEY (agenda_id)
    REFERENCES agenda(_id)
    ON DELETE RESTRICT;  
 

/*
 * decision_item
 */
DROP TABLE IF EXISTS decision_item;
CREATE TABLE decision_item (
    _id int(11) NOT NULL AUTO_INCREMENT,
    agenda_id int(11) NOT NULL,
    description VARCHAR(256) NULL,
    mover_id int(11) NOT NULL,
    motion_id int(11) NOT NULL,
    seconded_id int(11) NOT NULL,
    members_for int(11) NOT NULL DEFAULT 0,
    members_against int(11) NOT NULL DEFAULT 0,
    members_abstain int(11) NOT NULL DEFAULT 0,
    passed boolean DEFAULT true,
    review_frequency varchar(32) NULL,
    PRIMARY KEY (_id)
);

ALTER TABLE decision_item ENGINE = InnoDB;

ALTER TABLE decision_item
    ADD CONSTRAINT fk_decision_item_agenda_id
    FOREIGN KEY (agenda_id)
    REFERENCES agenda(_id)
    ON DELETE RESTRICT;  
    
/* more fk constraints to write */