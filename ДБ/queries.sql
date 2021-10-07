-- commit
-- **********************
SELECT 
		u.first_name, u.last_name, wsd.developments_name
FROM 
		who_subscribe_developments wsd 
JOIN
		users u
ON 
		wsd.user_id = u.id;
	
-- **********************
SELECT 
		u.id, u.first_name, u.last_name, wlr.radio_id, wlr.radio_name
FROM 
		users u
INNER JOIN 
		who_listening_radio wlr 
ON 
		u.id = wlr.user_id
ORDER BY 
		wlr.radio_id DESC
LIMIT 10;

-- **********************
CREATE VIEW 
		radchan 
AS SELECT 
		* 
FROM 
		radiochannels 
ORDER BY 
		radio_name;
	
SELECT * FROM radchan;

-- **********************
CREATE OR REPLACE VIEW 
		radiochan
AS SELECT 
		id, radio_name, photo_id
FROM
		radiochannels
WHERE 
		id = 15;
	
SELECT * FROM radiochan;

-- **********************
DROP PROCEDURE IF EXISTS ecute_rad;
delimiter //
CREATE PROCEDURE ecute_rad()
BEGIN
		CASE
			WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
				SELECT radio_name FROM radiochannels WHERE id BETWEEN 1 AND 5;
			WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
				SELECT radio_name FROM radiochannels WHERE id BETWEEN 6 AND 10;
			WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
				SELECT radio_name FROM radiochannels WHERE id BETWEEN 11 AND 20;
		END CASE;
END //
delimiter ;

CALL ecute_rad();

-- **********************
DROP TRIGGER IF EXISTS radiotrig;

delimiter //
CREATE TRIGGER radiotrig BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.first_name) AND ISNULL(NEW.last_name)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning! NOT NULL!';
	END IF;
END //
delimiter ;

INSERT INTO users (first_name, last_name, email, phone, password_hash) -- добавим юзеров
VALUES (NULL, NULL, 'ASDF@.com', '96541238597', 'TYUOU');


















