

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