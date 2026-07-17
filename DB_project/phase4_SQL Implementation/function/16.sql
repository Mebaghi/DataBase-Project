DELIMITER //

CREATE FUNCTION CalculateAverageScore ()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_score DECIMAL(10,2);
    SELECT AVG(score) INTO avg_score FROM co_team;
    RETURN avg_score;
END //

DELIMITER ;

SELECT CalculateAverageScore() AS AverageScore;