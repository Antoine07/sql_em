
SELECT num_flying,
CASE
    WHEN num_flying > 30 THEN "The quantity is greater than 30"
    WHEN num_flying = 30 THEN "The quantity is 30"
    ELSE "The quantity is under 30"
END
FROM pilots;