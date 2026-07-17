DELIMITER //

CREATE PROCEDURE CalculateAgeFromBirthdate(
    IN clerk_id INT,
    OUT age INT
)
BEGIN
    DECLARE clerk_birthdate DATE;
    
    -- Get the birthdate for the specified clerk_id
    SELECT STR_TO_DATE(birthdate, '%m/%d/%Y') INTO clerk_birthdate
    FROM co_clerk
    WHERE id = clerk_id
    LIMIT 1; -- Limit the result to one row
    
    -- Calculate the age
    SET age = YEAR(CURDATE()) - YEAR(clerk_birthdate);
    
    -- Adjust age if birthday hasn't occurred yet this year
    IF MONTH(CURDATE()) < MONTH(clerk_birthdate)
        OR (MONTH(CURDATE()) = MONTH(clerk_birthdate) AND DAYOFMONTH(CURDATE()) < DAYOFMONTH(clerk_birthdate)) THEN
        SET age = age - 1;
    END IF;
END //

DELIMITER ;

CALL CalculateAgeFromBirthdate(123, @age);
SELECT @age AS age;