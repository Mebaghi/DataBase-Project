DELIMITER //

CREATE PROCEDURE CalculateAgeFromBirthdateWithCursor(
    IN clerk_id INT,
    OUT age INT
)
BEGIN
    DECLARE clerk_birthdate VARCHAR(10);
    DECLARE birthdate_cursor CURSOR FOR
        SELECT birthdate FROM co_clerk WHERE id = clerk_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET age = NULL;
    
    OPEN birthdate_cursor;
    
    FETCH birthdate_cursor INTO clerk_birthdate;
    
    IF clerk_birthdate IS NOT NULL THEN
        -- Calculate the age
        SET age = YEAR(CURDATE()) - YEAR(STR_TO_DATE(clerk_birthdate, '%m/%d/%Y'));
    
        -- Adjust age if birthday hasn't occurred yet this year
        IF MONTH(CURDATE()) < MONTH(STR_TO_DATE(clerk_birthdate, '%m/%d/%Y'))
            OR (MONTH(CURDATE()) = MONTH(STR_TO_DATE(clerk_birthdate, '%m/%d/%Y')) AND DAYOFMONTH(CURDATE()) < DAYOFMONTH(STR_TO_DATE(clerk_birthdate, '%m/%d/%Y'))) THEN
            SET age = age - 1;
        END IF;
    END IF;
    
    CLOSE birthdate_cursor;
END //

DELIMITER ;
CALL CalculateAgeFromBirthdateWithCursor(123, @age);
SELECT @age AS age;