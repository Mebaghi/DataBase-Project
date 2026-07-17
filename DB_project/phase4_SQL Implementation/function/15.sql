
DELIMITER //
CREATE FUNCTION CalculateTotal (
    experience INT,
    children_num INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT;
    SET result = (experience + children_num) * 1000;
    RETURN result;
END //


DELIMITER ;

SELECT CalculateTotal(5, 3) AS TotalResult;