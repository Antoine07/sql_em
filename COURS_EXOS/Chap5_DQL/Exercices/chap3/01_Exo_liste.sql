

-- 01

SELECT num_street, street, city
FROM companies
WHERE comp IN (
    SELECT company 
    FROM pilots
    WHERE num_flying < 90
);

-- avec la fonction CONCAT_WS

SELECT CONCAT_WS( ', ', num_street, street, city ) as `address`
FROM companies
WHERE comp IN (
    SELECT company 
    FROM pilots
    WHERE num_flying < 90
);


-- 02
/*

Sélectionnez le/les pilote(s) ayant fait le plus d'heures de vol sans utiliser l'opérateur MAX ni la clause ORDER BY. Puis sélectionnez les nombres d'heures de vol sauf le plus grand.

*/

SELECT name, num_flying
FROM pilots
WHERE num_flying >= ALL(SELECT num_flying FROM pilots);



SELECT name, num_flying
FROM pilots
WHERE num_flying < ANY(SELECT num_flying FROM pilots);


--- 03 
/*
Faites la somme des heures de vol des pilotes dont le nom de la compagnie est Air France. Bien sûr, vous ne connaissez pas la clef primaire de la compagnie.
*/

SELECT SUM(num_flying)
FROM pilots
WHERE `certificate` IN (
    SELECT `certificate`
    FROM pilots
    WHERE company IN (
        SELECT comp 
        FROM companies
        WHERE `name`= 'Air France'
    )
);

SELECT SUM(num_flying) as sum_flying
FROM pilots
WHERE `company` = (SELECT comp FROM companies WHERE `name`='Air France');


-- 
/*
comp = ITA, street = mapoli, city = Rome, name = Italia Air, num_street = 20
*/

INSERT INTO companies 
SET comp = 'ITA', street = 'mapoli', city = 'Rome', `name` = 'Italia Air', num_street = 20 ;

/*
Trouvez toutes les compagnies n'ayant pas de pilotes.
*/

SELECT `name`, comp 
FROM companies
WHERE comp NOT IN (SELECT company FROM pilots);

SELECT name, num_street, street, city
FROM companies
WHERE comp IN(
    SELECT company
    FROM pilots
    WHERE num_flying < ALL(
        SELECT num_flying
        FROM pilots
        WHERE plane='A380'
    )
);

ALTER TABLE `pilots`
ADD `last_name` VARCHAR(100) AFTER `name` ;

UPDATE `pilots`
SET `last_name` = (
    CASE
        WHEN `name` IN ('alan', 'yi', 'sophie') THEN 'Dupont'
        WHEN `name` IN ('tom') THEN 'Lu'
        WHEN `name` IN ('Albert') THEN 'Pierre'
        ELSE 'chai'
    END
);

-- requête corrélée