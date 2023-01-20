-- creates a stored procedure ComputeAverageScoreForUser that computes
-- and store the average score for a student An average score can be a decimal
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE AVG_score FLOAT;
    SET AVG_score = (SELECT AVG(score) FROM corrections
    WHERE corrections.user_id = user_id);
    UPDATE users SET average_score = AVG_score WHERE users.id = user_id;
END $$
DELIMITER ;
