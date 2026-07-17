DELIMITER //

CREATE TRIGGER check_birthdate_before_update 
BEFORE UPDATE ON co_clerk 
FOR EACH ROW 
BEGIN 
    IF YEAR(STR_TO_DATE(NEW.birthdate, '%m/%d/%Y')) >= 2003 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Clerk must be born before 2003'; 
    END IF; 
END //

DELIMITER ;