
SELECT `name`, ROUND( num_flying  / ( SELECT sum(num_flying) FROM pilots ), 2 ) * 100  as `fq_flying`
FROM `pilots`;