-- script that creates a trigger that resets the
-- attribute valid_email only when the email has been changed
CREATE TRIGGER `reset_attribut`
AFTER UPDATE ON users
FOR EACH ROW
UPDATE users SET valid_email = 0;
