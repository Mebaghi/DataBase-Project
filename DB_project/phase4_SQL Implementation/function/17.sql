DELIMITER //

CREATE FUNCTION CalculateAgeById (clerk_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE birthdate DATE;
    DECLARE age INT;
    
    -- Fetch the birthdate for the given id
    SELECT STR_TO_DATE(birthdate, '%m/%d/%Y') INTO birthdate 
    FROM co_clerk 
    WHERE id = clerk_id;
    
    -- Calculate the age
    SET age = FLOOR(DATEDIFF(CURDATE(), birthdate) / 365.25);
    RETURN age;
END //

DELIMITER ;
SELECT id, CalculateAgeById(id) AS Age FROM co_clerk;