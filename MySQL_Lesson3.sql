-- homework3
-- добавим таблицу постов 
CREATE TABLE posts(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	name_pos VARCHAR(255) NOT NULL,
	words VARCHAR(2048) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Добавим два поста, которые создали Петя и Вася
INSERT INTO posts VALUES (DEFAULT, 1, 'Hello World!', 'My first posts!', DEFAULT);
INSERT INTO posts VALUES (DEFAULT, 4, 'Hello World!123', 'No! Its my first posts!', DEFAULT);
SELECT * FROM posts;


-- добавим лайки к медиа

CREATE TABLE media_likes(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	file_name VARCHAR(255),
	id_media BIGINT UNSIGNED NOT NULL,
	type_media INT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (id_media),
	KEY (type_media),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (id_media) REFERENCES media(id),
	FOREIGN KEY (type_media) REFERENCES media(media_types_id)
);


INSERT INTO media_likes VALUES (DEFAULT, 1, 'doc.docx', 7, 1, DEFAULT); -- петя поставил лайк на васин файл
INSERT INTO media_likes VALUES (DEFAULT, 4, 'im.jpg', 1, 3, DEFAULT);  -- вася поставил лайк на петин файл
SELECT * FROM media_likes; 


-- добавим лайки к постам 

CREATE TABLE posts_likes(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	post_id BIGINT UNSIGNED NOT NULL,
	post_name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (post_id),
	KEY (post_name),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (post_id) REFERENCES posts(id)
);


INSERT INTO posts_likes VALUES (DEFAULT, 4, 1, 'Hello World!', DEFAULT); -- вася ставит лайк петеному сообществу
INSERT INTO posts_likes VALUES (DEFAULT, 1, 2, 'Hello World!123', DEFAULT); -- петя ставит лайк на свое сообщесвто
SELECT * FROM posts_likes; 


-- добавим лайки пользовталеям 

CREATE TABLE user_likes(
	id SERIAL PRIMARY KEY,
	like_from_user_id BIGINT UNSIGNED NOT NULL,
	like_to_user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (like_from_user_id),
	KEY (like_to_user_id),
	FOREIGN KEY (like_from_user_id) REFERENCES users(id),
	FOREIGN KEY (like_to_user_id) REFERENCES users(id)
);


INSERT INTO user_likes VALUES (DEFAULT, 1, 4, DEFAULT); -- лайк от пети васе
INSERT INTO user_likes VALUES (DEFAULT, 4, 1, DEFAULT); -- лайк от васи пете
SELECT * FROM user_likes; 