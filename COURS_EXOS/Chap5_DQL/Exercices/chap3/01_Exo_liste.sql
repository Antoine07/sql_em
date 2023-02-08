

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