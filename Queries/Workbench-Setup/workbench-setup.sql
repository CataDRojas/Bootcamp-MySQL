SELECT * FROM users;

USE `twitter`;

SELECT * FROM users;
INSERT INTO users 
VALUES(6,'Francisco','Carreño','Panchoso','1999-07-24',now(),now());
UPDATE users SET 
first_name = 'Nataniel', last_name='Soto', handle = 'skinny', birthday='2000-04-15', updated_at= now() WHERE id=2;
DELETE FROM users WHERE id=5;