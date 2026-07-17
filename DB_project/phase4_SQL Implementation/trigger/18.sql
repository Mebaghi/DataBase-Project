DELIMITER //

CREATE TRIGGER check_experience_before_insert
BEFORE INSERT ON co_clerk
FOR EACH ROW
BEGIN
    IF NEW.experience <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Experience must be greater than 0';
    END IF;
END //

CREATE TRIGGER check_experience_before_update
BEFORE UPDATE ON co_clerk
FOR EACH ROW
BEGIN
    IF NEW.experience <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Experience must be greater than 0';
    END IF;
END //

DELIMITER ;