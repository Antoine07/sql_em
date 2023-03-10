/*

Faites une requête permettant de sélectionner le pilote ayant eu le meilleur bonus. 
Vous pouvez utiliser la fonction max de MySQL.
*/

SELECT name 
FROM pilots
WHERE bonus = ( SELECT MAX(bonus) FROM pilots );

-- ou
SELECT name FROM pilots ORDER BY bonus DESC LIMIT 1;