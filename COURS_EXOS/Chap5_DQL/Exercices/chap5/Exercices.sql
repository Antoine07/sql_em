DROP TABLE IF EXISTS sales;

CREATE TABLE `sales` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `year_month` DATE ,
    `company` CHAR(4),
    `profit` DECIMAL(15,2),
    CONSTRAINT pk_id PRIMARY KEY (`id`)
) ENGINE=InnoDB ;


-- clé étrangère qui point vers la clé primaire de la table companies
ALTER TABLE `sales` 
ADD CONSTRAINT `fk_sales_companies_comp`
FOREIGN KEY (`company`)
REFERENCES `companies`(`comp`);


-- procédure pour mettre des données dans la table
DELIMITER $$

DROP PROCEDURE IF EXISTS set_data$$
CREATE PROCEDURE set_data(IN  comp CHAR(4))
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE d DATE DEFAULT '1980-01-01';
  loop_data : LOOP
    IF (i = 20*12) THEN
        LEAVE loop_data;
    END IF;

    INSERT INTO 
    `sales` (`year_month`, `company`, `profit`) VALUES ( d, comp, ROUND(RAND()*15 * 100000, 2 ));

    SET d = DATE_ADD(d, INTERVAL 1 MONTH);
    SET i = 1 + i;
  END LOOP; 
END$$


-- remettre le délimiter par défaut
DELIMITER ;