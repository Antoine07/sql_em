
ALTER TABLE `pilots`
ADD `lead_pl` VARCHAR(6) ;

-- clé étrangère

ALTER TABLE `pilots`
ADD CONSTRAINT `fk_pilots_pilots_certificate` 
FOREIGN KEY (`lead_pl`) REFERENCES `pilots`(`certificate`);

/*
Mettez à jour la table pilots sachant que Pierre est le chef pilote de Alan, Tom et Yi. Et que John est le chef pilote de Sophie, Albert et Yan.
*/

UPDATE `pilots`
SET `lead_pl` = 'ct-7' 
WHERE `name` IN ('alan', 'tom', 'yi');

UPDATE `pilots`
SET `lead_pl` = 'ct-6' 
WHERE `name` IN ('sophie', 'albert', 'yan');

-- 02-2 Sélectionnez les certificats et les noms des pilotes travaillant pour la compagnie 'Air France', et ayant fait plus de 60 heures de vol.
SELECT `p`.`name`, `last_name`, `certificate`, `num_flying`, `c`.`name` as `company_name` 
FROM `pilots` as `p` JOIN `companies` as `c`
ON `p`.`company` = `c`.`comp`
WHERE `c`.`name` = 'Air France'
AND `num_flying` > 60;


-- 03

SELECT SUM(`p`.`num_flying`) as `sum`
FROM `pilots`as `p`
JOIN `companies`as `c`
ON `p`.`company`= `c`.`comp`
WHERE `c`.`name` = 'AUSTRA Air';

-- 04

SELECT `p`.`company`, SUM(`p`.`num_flying`) as `sum`
FROM `pilots`as `p`
JOIN `companies`as `c`
ON `p`.`company`= `c`.`comp`
GROUP BY `p`.`company` ;

-- 04-2
/*
Faites la somme des profits des compagnies ayant un pilote ayant plus de 150h de vol (indiquez le nom de la compagnie)
*/

SELECT `s`.`company`, SUM(`s`.`profit`) as `sum`
FROM `sales`as `s`
JOIN `pilots`as `p`
ON `s`.`company`= `p`.`company`
WHERE `p`.`num_flying` > 150
GROUP BY `s`.`company` ;

/*
Faites la somme des profits des compagnies dont la somme des heures de vol des pilotes est supérieur à 150.
*/


-- 05 Sélectionnez le nom de la compagnie, le certificat du pilote et le nom du pilote même si la compagnie n'emploie pas de pilote.

SELECT `c`.`name`, `p`.`certificate` as `pilot_certif`,  `p`.`name` as `pilot_name`
FROM `pilots`as `p`
RIGHT JOIN `companies`as `c`
ON `p`.`company`= `c`.`comp`;

-- Les compagnies qui n'ont pas de pilote

SELECT `c`.*
FROM `pilots`as `p`
RIGHT JOIN `companies`as `c`
ON `p`.`company`= `c`.`comp`
WHERE `p`.`certificate` IS NULL;

-- insertion d'un pilote qui n'a pas de compagnie 

/*
Nom : Harry, certificat ct-19. Il n'a aucun leader pilote, a fait 0 heure de vol, n'est rattaché à aucune compagnie, a un bonus de 100, a fait 0 jour de travail, n'a aucun vol planifié et a pour date de naissance : '2000-01-01 12:00:00'.

*/

INSERT INTO `pilots`
(`name`, `certificate`, `num_flying`, `bonus`, `num_jobs`, `birth_date` ) 
VALUES ('Harry', 'ct-19', 0, 100, 0, '2000-01-01 12:00:00' ) ;

SELECT `name`, `company` 
FROM `pilots`  
WHERE `company` IS NULL ;

SELECT `p`.`name`, `p`.`company` 
FROM `pilots` as `p`
LEFT JOIN `companies`as `c`
ON `p`.`company`= `c`.`comp`;

SELECT `p`.`name`
FROM `pilots` as `p`
LEFT JOIN `companies`as `c`
ON `p`.`company`= `c`.`comp`
WHERE  `p`.`company` IS NULL;