
SELECT DATE_ADD(birth_date, INTERVAL ROUND((RAND()*6)-3) DAY)
FROM pilots 
WHERE birth_date = (SELECT max(birth_date) FROM pilots) LIMIT 1;

-- Autre solution :
SELECT DATE_ADD(MAX(birth_date), INTERVAL ROUND(RAND() * 6 - 3) DAY) FROM pilots;
