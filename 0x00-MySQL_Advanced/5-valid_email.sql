-- script that creates a trigger that resets the
-- attribute valid_email only when the email has been changed
CREATE TRIGGER `reset_attribut`
AFTER UPDATE users ON users.email
FOR EACH ROW
UPDATE SET valid_email = 0;
