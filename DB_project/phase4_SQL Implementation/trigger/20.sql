DELIMITER //

CREATE TRIGGER check_education_before_update 
BEFORE UPDATE ON co_clerk 
FOR EACH ROW 
BEGIN 
    IF NEW.education NOT IN ('Bachelor', 'diploma', 'phd') THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Education must be bachelor, diploma, or phd'; 
    END IF; 
END //

DELIMITER ;