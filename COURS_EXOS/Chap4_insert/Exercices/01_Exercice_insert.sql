-- Création de la base de données
/*
 1. première étape
 */
CREATE DATABASE IF NOT EXISTS `db_aviation` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sélection de la base de données
USE db_aviation;

-- Création de la table companies
CREATE TABLE `companies` (
    `comp` CHAR(4),
    `street` VARCHAR(20),
    `city` VARCHAR(20) NULL,
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_company PRIMARY KEY (`comp`)
) ENGINE = InnoDB;

CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `num_flying` DECIMAL(7, 1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pilots PRIMARY KEY (`certificate`)
) ENGINE = InnoDB;


ALTER TABLE `pilots`
ADD CONSTRAINT `fk_pilots_companies_comp`
FOREIGN KEY (`company`) REFERENCES `companies`(`comp`);


-- inserts

INSERT INTO `companies`
(`comp`,`street`,`city` ,`name`)
VALUES
    ('AUS', 'sidney', 'Sidney', 'AUSTRA Air' ),
    ('CHI', 'chi', 'Pekin', ' CHINA Air' ),
    ('FRE1', 'beaubourg', 'Paris', 'Air France' ),
    ('FRE2', 'paris', 'Paris', 'Air Electric' ),
    ('SIN', 'pasir', 'Singapour', 'SIN A' )
    ;

-- ajout d'une colonne 

ALTER TABLE `pilots`
ADD COLUMN `created` 
DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `companies`
ADD COLUMN `num_street` 
SMALLINT UNSIGNED;

ALTER TABLE `companies`
ADD COLUMN `status` 
ENUM('draft', 'published', 'unpublished') DEFAULT 'draft' ;


UPDATE `companies`
SET `num_street` = 19
WHERE comp = 'AUS';

UPDATE `companies`
SET `num_street` = 17
WHERE comp = 'FRE1';

UPDATE `companies`
SET `num_street` = 22
WHERE comp = 'FRE2';

UPDATE `companies`
SET `num_street` = 15
WHERE comp = 'SIN';

UPDATE `companies`
SET `name`= 'CHINA Air'
WHERE comp = 'chi';

-- pour ajouter plusieurs colonnes en même temp
ALTER TABLE `pilots`
ADD COLUMN `birth_date` DATETIME, 
ADD COLUMN  `next_flight` DATETIME,
ADD COLUMN `num_jobs` SMALLINT UNSIGNED ;