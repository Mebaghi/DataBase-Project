DELIMITER //

CREATE TRIGGER check_unfinished_projects_before_insert
BEFORE INSERT ON co_project
FOR EACH ROW
BEGIN
    DECLARE project_count INT;
    SELECT COUNT(*) INTO project_count FROM co_project WHERE unfinished_projects >= 10;
    IF project_count >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There can be at most 10 unfinished projects';
    END IF;
END //

DELIMITER ; 