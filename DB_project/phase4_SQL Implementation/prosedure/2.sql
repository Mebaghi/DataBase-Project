DELIMITER //

CREATE PROCEDURE CalculateAverageScore(
    OUT avg_score DECIMAL(10,2)
)
BEGIN
    -- Declare variables
    DECLARE total_score DECIMAL(10,2);
    DECLARE num_scores INT;
    
    -- Calculate total score
    SELECT SUM(score) INTO total_score FROM co_team;
    
    -- Calculate number of scores
    SELECT COUNT(*) INTO num_scores FROM co_team;
    
    -- Calculate average score
    IF num_scores > 0 THEN
        SET avg_score = total_score / num_scores;
    ELSE
        SET avg_score = NULL;
    END IF;
END //

DELIMITER ;
