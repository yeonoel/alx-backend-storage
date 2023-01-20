-- creates a stored procedure ComputeAverageWeightedScoreForUser
-- that computes and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
	DECLARE avg_score FLOAT
	SET avg_score = (SELECT SUM(weight * score) / SUM(weight)
				    FROM users
				    JOIN corrections AS cor ON users.id = cor.user_id
				    JOIN PROJECTS AS proj ON cor.project_id = proj.id
				    WHERE users.id = user_id);
	UPDATE users SET average_score = avg_score WHERE id = user_id;
END
$$
DELIMITER ;
