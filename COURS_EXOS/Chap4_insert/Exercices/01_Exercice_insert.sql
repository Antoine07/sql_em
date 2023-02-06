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
