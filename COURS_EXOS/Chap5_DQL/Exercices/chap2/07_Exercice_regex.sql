

SELECT `name`, `company`
FROM `pilots`
WHERE company REGEXP '.*r.{2}$';


-- '.*r.{2}$'  . n'importe quel caractère * de 0, n .{2} deux caractères quelconque $ se termine par