-- creates a stored procedure ComputeAverageWeightedScoreForUser
-- that computes and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
	IN user_id INT)
BEGIN
	DECLARE avg_score FLOAT;
	SET avg_score = (SELECT SUM(weight * score) / SUM(weight)
				    FROM users
				    JOIN corrections as cor ON users.id = cor.user_id
				    JOIN projects as proj ON cor.project_id = proj.id
				    WHERE users.id = user_id);
	UPDATE users SET average_score = avg_score WHERE id = user_id;
END
$$
DELIMITER ;
