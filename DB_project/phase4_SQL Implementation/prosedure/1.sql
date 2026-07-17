DELIMITER //

CREATE PROCEDURE CalculateSalaryFromCoClerk(
    IN id INT,
    OUT salary DECIMAL(10,2)
)
BEGIN
    DECLARE experience INT;
    DECLARE children_num INT;
    DECLARE total_experience INT;
    
    
    SELECT experience, children_num INTO experience, children_num
    FROM co_clerk
    WHERE id = id
    LIMIT 1; 
    
    
IF experience IS NOT NULL AND children_num IS NOT NULL THEN
        
        SET total_experience = experience + children_num;
        
        
        SET salary = total_experience * 1000;
    ELSE
        
        SET salary = NULL;
    END IF;
END //

DELIMITER ;
CALL CalculateSalaryFromCoClerk(123, @result);
SELECT @result AS salary;