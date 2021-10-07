/*

Эта база данных была разработана для удобства прослушивания радио каналов
в режиме реального времени. Так же ознакамливаться с чартами и подакстами с
озданными сотрудниками радио рекорд, покупать билеты на события и следить 
за новостями мира музыки.
База данных решает задачи хранения пользователей, фото-аватарки и их профили, 
каждого радио, подкаста или чарта со своим уникальным id.

*/
DROP DATABASE IF EXISTS radiorecord;

CREATE DATABASE IF NOT EXISTS radiorecord;

USE radiorecord;

-- создадим юзеров!
CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(150) NOT NULL,
	last_name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	phone CHAR(11) NOT NULL,
	password_hash BIGINT UNIQUE,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	INDEX (phone),
	INDEX (email)
);
INSERT INTO users (first_name, last_name, email, phone, password_hash) -- добавим юзеров
VALUES ('Juanita', 'Menloe', 'jmenloe0@cnn.com', '86527782320', 'pFeAuKfh'),
('Ev', 'Serman', 'eserman1@angelfire.com', '67438600383', 'TfpBuCeE'),
('Deanne', 'Whal', 'dwhal2@tiny.cc', '67511331829', 'KzatN2NntsSJ'),
('Chrissy', 'Kryska', 'ckryska3@imdb.com', '36531728106', '2H0AWC'),
('Marget', 'Kemm', 'mkemm4@imdb.com', '37992592446', 'jhdAQBIVCB'),
('Blondy', 'Franzetti', 'bfranzetti5@wisc.edu', '62485473559', 'Q3UcPrxik'),
('Daffi', 'Ladley', 'dladley6@prlog.org', '67207681243', '2QeSBeV9onjO'),
('Alyss', 'Witt', 'awitt7@dagondesign.com', '42848406179', 'H32J4QA'),
('Ora', 'Taleworth', 'otaleworth8@census.gov', '31401476975', 'o8fS79sCv'),
('Rourke', 'Pideon', 'rpideon9@imgur.com', '46235393209', 'xtvX7oJ88by'),
('Onofredo', 'Di Biagi', 'odibiagia@bloomberg.com', '96955192162', 'shLSL30gk38k'),
('Jessa', 'Diplock', 'jdiplockb@example.com', '63201242944', 'Z09IkC0TXeV9'),
('Morena', 'Basant', 'mbasantc@wisc.edu', '94498462704', 'CKaOxlFoP'),
('Brendin', 'Bisatt', 'bbisattd@privacy.gov.au', '83174211566', 'fXjbhKDldEg'),
('Pattin', 'Stidston', 'pstidstone@fema.gov', '57333945936', 'NZ2hZM'),
('Klarrisa', 'Salway', 'ksalwayf@nba.com', '17044192689', '9ChVZi'),
('Elna', 'Brayshaw', 'ebrayshawg@ebay.co.uk', '66784224668', 'ABXaso'),
('Ernesto', 'Ipplett', 'eippletth@illinois.edu', '63742793802', 'fDYQqc'),
('Gill', 'Cupitt', 'gcupitti@mozilla.org', '83079885512', 'uAGqnMR1tY'),
('Bebe', 'Procter', 'bprocterj@columbia.edu', '82883033981', 'adtnHW'),
('Darya', 'Querree', 'dquerreek@pagesperso-orange.fr', '84672742222', 'dELXdo1Jhly'),
('Krishnah', 'Leney', 'kleneyl@latimes.com', '58755004129', 'DG05g0KbKs'),
('Timofei', 'Fowles', 'tfowlesm@cdbaby.com', '81708465140', 'Tf53h2Pe'),
('Towney', 'Yuryaev', 'tyuryaevn@marketwatch.com', '37064753928', 'U4U7fSS0lza'),
('Pamelina', 'Faichney', 'pfaichneyo@facebook.com', '72179038243', 'p00DBwvs8');
SELECT * FROM users;

-- создадим профили для юзеров!
CREATE TABLE  profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender ENUM('f', 'm', 'x') NOT NULL,
	birthday DATE NOT NULL,
	photo_id BIGINT UNSIGNED,
	city VARCHAR(130),
	country VARCHAR(130),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY (photo_id) REFERENCES images(id)
);
INSERT INTO profiles (user_id, gender, birthday, photo_id, city, country) -- добавим профили
VALUES(1, 'm', '2003-06-01', 1, 'Jamaica', 'United States'),
(2, 'm', '1982-08-03', 2, 'Whakatane', 'New Zealand'),
(3, 'f', '1974-09-18', 3, 'Brumadinho', 'Brazil'),
(4, 'f', '1971-07-20', 4, 'Votorantim', 'Brazil'),
(5, 'f', '1979-04-10', 5, 'Morro Agudo', 'Brazil'),
(6, 'm', '1986-01-04', 6, 'Presidente Prudente', 'Brazil'),
(7, 'm', '1975-10-02', 7, 'Timon', 'Brazil'),
(8, 'f', '1980-10-19', 8, 'Quilmes', 'Argentina'),
(9, 'f', '1971-08-29', 9, 'Anguera', 'Brazil'),
(10, 'x', '1975-12-26', 10, 'Seattle', 'United States'),
(11, 'f', '1990-03-26', 11, 'Totoras', 'Argentina'),
(12, 'f', '1994-06-08', 12, 'Quatro Barras', 'Brazil'),
(13, 'f', '1995-11-17', 13, 'Carmo do Cajuru', 'Brazil'),
(14, 'f', '1979-08-16', 14, 'Itapetinga', 'Brazil'),
(15, 'f', '1985-07-27', 15, 'Paraíba do Sul', 'Brazil'),
(16, 'm', '1998-04-21', 16, 'Calilegua', 'Argentina'),
(17, 'm', '1979-09-19', 17, 'Miguel Pereira', 'Brazil'),
(18, 'f', '1978-04-22', 18, 'Chicago', 'United States'),
(19, 'm', '1995-08-26', 19, 'Aracruz', 'Brazil'),
(20, 'x', '1983-11-08', 20, 'Paiçandu', 'Brazil'),
(21, 'f', '1977-05-03', 21, 'Boa Esperança', 'Brazil'),
(22, 'f', '1972-03-27', 22, 'Ceres', 'Brazil'),
(23, 'f', '1993-04-14', 23, 'Unaí', 'Brazil'),
(24, 'm', '1982-12-04', 24, 'Ji Paraná', 'Brazil'),
(25, 'x', '1973-08-17', 25, 'Camanducaia', 'Brazil');
SELECT * FROM profiles;

-- создадим хранилище изображений!
CREATE TABLE images(
	id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR (255) NOT NULL,
	who_created_name VARCHAR(255) NOT NULL,
	who_created_id BIGINT UNSIGNED
);
INSERT INTO images (name, who_created_name, who_created_id) -- добавим аватарки пользователей
VALUES ( 'Goldenrod.jpg','Juanita', 1)
,('Puce.jpg','Ev' ,  2)
,('Fuscia.jpg','Deanne' , 3)
,('Orange.jpg','Chrissy' , 4)
,('Mauv.jpg','Marget' , 5)
,('Yellow.jpg','Blondy' , 6)
,('Teal.jpg', 'Daffi', 7)
,('Pink.jpg','Alyss' , 8)
,('Teal.jpg','Ora' , 9)
,('Teal.jpg','Rourke' , 10)
,('Teal.jpg','Onofredo' , 11)
,('Mauv.jpg','Jessa' , 12)
,('Purple.jpg','Morena' , 13)
,('Crimson.jpg','Brendin' , 14)
,('Khaki.jpg','Pattin' , 15)
,('Fuscia.jpg','Klarrisa' , 16)
,('Blue.jpg','Elna' , 17)
,('Teal.jpg','Ernesto' , 18)
,('Maroon.jpg','Gill' , 19)
,('Mauv.jpg','Bebe' , 20)
,('Yellow.jpg','Darya' , 21)
,( 'Fuscia.jpg','Krishnah' , 22)
,('Teal.jpg','Timofei' , 23)
,('Aquamarine.jpg','Towney' , 24)
,('Teal.jpg','Pamelina' , 25);

INSERT INTO images (name, who_created_name, who_created_id) -- добавим аватарки радио
VALUES ('Record.jpg', 'Record', 1)
,('Party_24/7.jpg', 'Party 24/7', 2)
,('Organic.jpg', 'Organic', 3)
,('Chill_House.jpg', 'Chill House', 4)
,('Lo-Fi.jpg', 'Lo-Fi', 5)
,('Dream_Pop.jpg', 'Dream Pop', 6)
,('Ambient.jpg', 'Ambient', 7)
,('Innocence.jpg', 'Innocence', 8)
,('Deep.jpg', 'Deep', 9)
,('Tech_House.jpg', 'Tech House', 10)
,('Russian_Mix.jpg', 'Russian Mix', 11)
,('Chill-Out.jpg', 'Chill-Out', 12)
,('Pirate_Station.jpg', 'Pirate Station', 13)
,('Маятник_Фуко.jpg', 'Маятник Фуко', 14)
,('Black_Rap.jpg', 'Black Rap', 15)
,('Trancemission.jpg', 'Trancemission', 16)
,('Megamix.jpg', 'Megamix', 17)
,('Record_Gold.jpg', 'Record Gold', 18)
,('Big_Hits.jpg', 'Big Hits', 19)
,('Remix.jpg', 'Remix', 20);

INSERT INTO images (name, who_created_name, who_created_id) -- добавим аватарки подкастов
VALUES ('RECORD_MEGAMIX123.jpg', 'RECORD MEGAMIX', 1)
,('RECORD_PARTY8756.jpg', 'RECORD PARTY', 2)
,('RECORD_CLASSIC(beta).jpg', 'RECORD CLASSIC', 3)
,('KREMOV_I_HRUSTALEV_DVIZH-PARIZH.jpg', 'КРЕМОВ И ХРУСТАЛЕВ', 4);

INSERT INTO images (name, who_created_name, who_created_id) -- добавим аватарки чартов
VALUES ('Rampampam.jpg', 'Record Mix Admin', 2)
,('Bad_Habits.jpg', 'Record Mix Admin', 2)
,('A_Little_Taste.jpg', 'Record Mix Admin', 2)
,('Ya_v_momente.jpg', 'Record Mix Admin', 2);

INSERT INTO images (name, who_created_name, who_created_id) -- добавим аватарки новостей
VALUES ('Поэтический_флешмоб.jpg', 'Record News Admin', 1)
,('Обьявление_сезона.jpg', 'Record News Admin', 1)
,('Record_Brithday.jpg', 'Record News Admin', 1)
,('Record_Stream_LP.jpg', 'Record News Admin', 1);

INSERT INTO images (name, who_created_name, who_created_id) -- добавим аватарки событий
VALUES ('Фестиваль.jpg', 'Record News Admin', 1)
,('Markul.jpg', 'Record News Admin', 1)
,('PS_jungle.jpg', 'Record News Admin', 1)
,('Супердискотека_90-х.jpg', 'Record News Admin', 1);


-- создадим радио каналы!
CREATE TABLE radiochannels(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	radio_name VARCHAR (150) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	photo_id BIGINT UNSIGNED,
	FOREIGN KEY (photo_id) REFERENCES images(id)
);
INSERT INTO radiochannels (radio_name, photo_id) 
VALUES ('Record', 26)
,('Party 24/7', 27)
,('Organic', 28)
,('Chill House', 29)
,('Lo-Fi', 30)
,('Dream Pop', 31)
,('Ambient', 32)
,('Innocence', 33)
,('Deep', 34)
,('Tech House', 35)
,('Russian Mix', 36)
,('Chill-Out', 37)
,('Pirate Station', 38)
,('Маятник Фуко', 39)
,('Black Rap', 40)
,('Trancemission', 41)
,('Megamix', 42)
,('Record Gold', 43)
,('Big Hits', 44)
,('Remix', 45);
SELECT * FROM radiochannels;


-- создадим подкасты!
CREATE TABLE podcasts(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	podcast_name VARCHAR (150) NOT NULL,
	craeted_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	photo_id BIGINT UNSIGNED,
	FOREIGN KEY (photo_id) REFERENCES images(id)
);
INSERT INTO podcasts (podcast_name, photo_id) 
VALUES ('RECORD MEGAMIX', 46)
,('RECORD PARTY', 47)
,('RECORD CLASSIC', 48)
,('КРЕМОВ И ХРУСТАЛЕВ', 49);
SELECT * FROM podcasts;


-- создадим чарты!
CREATE TABLE charts(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	charts_name VARCHAR (150) NOT NULL,
	craeted_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	photo_id BIGINT UNSIGNED,
	FOREIGN KEY (photo_id) REFERENCES images(id)
);
INSERT INTO charts (charts_name, photo_id) 
VALUES ('Rampampam(Record mix)', 58)
,('Bad Habits(Record mix)', 59)
,('A Little Taste(Record mix)', 60)
,('Я в моменте(Record mix)', 61);
SELECT * FROM charts;

-- создадим новости!
CREATE TABLE news(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	news_name VARCHAR (150) NOT NULL,
	news_text VARCHAR (2500) NOT NULL,
	craeted_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	photo_id BIGINT UNSIGNED,
	FOREIGN KEY (photo_id) REFERENCES images(id)
);
INSERT INTO news (news_name, news_text, photo_id) 
VALUES ('Поэтический флешмоб "Осенний Движ" в эфире Рекорда', 
'«Рекорд, ну что же ты творишь,
Моим ушам покоя нету.
Опять звучит осенний движ.
На рейв! Карету мне, карету!»
А.С. Пушкин (с) Черновики.
Совместно с А.С.Пушкиным мы запускаем поэтический флешмоб «Осенний Движ» 
- сочиняйте и присылайте нам четверостишия со словами "Рекорд" и "осенний движ"
 в наш чат в мобильном приложении. Лучшие будут озвучены фирменным Рекордовским 
голосом в эфире на всю страну под фрагменты легендарных классических произведений.
Участвуйте, Пушкины!', 50)
,('Обьявляем новый сезон на Рекорде!', 
'Лето – всё! У нас новый, Осенний Движ!
С 1 сентября встречайте:
- Ежедневную двухчасовую вечеринку Record Party. В эфире по будням в 21:00, сразу после Крема и Хруста.
- Новый радиоканал "Party 24/7" – нон-стоп микс из иностранных танцевальных треков-боевиков.
- Новых героев с живыми видеосетами из нашей осенней студии - Record Videostream – каждый четверг с 22:00 до 23:00.
И, конечно, новый сезон любимых обновлённых шоу:
- Вейкаперы – ежедневно по будням с 7:00 до 11:00.
- Крем-Хруст шоу – каждый будний вечер в 20:00.
- Еженедельный пятничный Мегамикс в 21:00.', 51)
,('Record Brithday Superchart: Лучшее с 1995 по 2001', 'Мечтали прокатиться на машине времени? 
В наш день рождения возможно всё! Путешествуем с 1995 года прямиком в 2021!
Специально для Вас Feel отобрал 26 самых ярких треков за все наши 26 лет существования!
Слушайте праздничный выпуск Суперчарта.', 52)
,('Record_Stream_LP', 
'В новом эпизоде Record Video Stream – часовой сет от «мамы» техно 
и пионерки российской электронной сцены — Лены Поповой.', 53);
SELECT * FROM news;

-- создадим события!
CREATE TABLE developments(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	developments_name VARCHAR (150) NOT NULL,
	developments_text VARCHAR (2500) NOT NULL,
	craeted_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	photo_id BIGINT UNSIGNED,
	FOREIGN KEY (photo_id) REFERENCES images(id)
);
INSERT INTO developments (developments_name, developments_text , photo_id) 
VALUES ('Фестиваль уличного исскуства', 'Record Dance Radio представляет Фестиваль уличного искусства и культуры.
Уличные музыканты, художники и шоумены - неотъемлемая часть среды современного мегаполиса. 
Их выступления подчас впечатляют больше чем помпезные дорогостоящие шоу. 
Однако "поймать" их в городе непросто. Но есть уникальная возможность увидеть самых ярких представителей этой культуры: 
от уличных театров до цирковых артистов, от вольных музыкантов до мастеров граффити и стрит-арта - на одной сцене.
Шоу состоится 17 сентября в 19:00 в "Тинькофф Арене".
Вход - свободный.
Фестиваль проходит при поддержке Комитета по культуре Санкт-Петербурга.', 54)
,('Markul', 'MARKUL отправляется в масштабный тур по СНГ с презентацией нового альбома! 
Pressure Tour начнется с 32 городов осенью и продолжится уже весной 2022 года.
MARKUL —  российский хип-хоп-исполнитель, выходец из Грин-парка, 
бывший участник творческого объединения Booking Machine, чья карьера началась в Лондоне и продолжилась уже в России. 
В 2017 году музыкант переехал в Санкт-Петербург и окончательно определился с фирменным звучанием.
В это же время вышел первый релиз Маркула Tranzit , представляющий яркую смесь рэпа, дэнсхолла и чувственной поп-музыки, 
а годом позже — пластинка «Great Depression»,ставшая прорывной в карьере артиста.
В 2020-м году, после завершения аншлагового тура «Before I Disappear», музыкант выпустил сразу три новые песни 
(«2 минуты», «Phantom» и «Конфеты») и сосредоточился на написании нового материала, который будет представлен широкой публике в 2021 году.', 55)
,('Пиратская Станция. Back to the Jungle', 'В связи с тем, что границы России со многими европейскими странами и Америкой по-прежнему остаются закрытыми, 
а значит иностранные артисты не смогут прилететь и выступить на главном drum&bass спектакле планеты, Пиратская Станция «Back To The Jungle» в Москве 
переносится на 5 ноября 2021 года. Место проведения остается прежним — Adrenaline Stadium. Все приобретенные ранее билеты будут действительны на новую 
дату, их не нужно обменивать.
Гостей из столицы будет ждать продолжение невероятного шоу, премьера которого состоялась 7-го марта 2020 года в Санкт-Петербурге. Дикие Джунгли, 
яркое технологическое представление при участии артистов цирка и балета — всё это в новом шоу от Радио Record.', 56)
,('Супердискотека 90-х', '«Барби атакует!» — под этим слоганом пройдет главный ретромегадэнс страны от Радио Рекорд в 2021 году! 
В новом шоу будет раскрыта тема противостояния совка и фирмЫ, когда в нашу жизнь ворвались вещи «из-за бугра». Аленка или Сникерс? 
Харатьян или Ди Каприо? Неваляшка или Барби? Исход этой битвы будет решён 11 декабря 2021 года в Ледовом Дворце.', 57);
SELECT * FROM developments;

-- кто слушает радио?
CREATE TABLE who_listening_radio(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	radio_id BIGINT UNSIGNED NOT NULL,
	radio_name VARCHAR (150) NOT NULL,
	listening_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (radio_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (radio_id) REFERENCES radiochannels(id)
);
INSERT INTO who_listening_radio (user_id, radio_id, radio_name) 
VALUES (1, 19, 'Big Hits'),
(2, 17, 'Megamix'),
(3, 1, 'Record'),
(4, 13, 'Pirate Station'),
(5, 4, 'Chill House'),
(6, 17, 'Megamix'),
(7, 10, 'Tech House'),
(8, 1, 'Record'),
(9, 1, 'Record'),
(10, 20, 'Remix'),
(11, 1, 'Record'),
(12, 7, 'Ambient'),
(13, 16, 'Trancemission'),
(14, 19, 'Big Hits'),
(15, 14, 'Маятник Фуко'),
(16, 17, 'Megamix'),
(17, 19, 'Big Hits'),
(18, 5, 'Lo-Fi'),
(19, 16, 'Trancemission'),
(20, 5, 'Lo-Fi'),
(21, 2, 'Party 24/7'),
(22, 6, 'Dream Pop'),
(23, 16, 'Trancemission'),
(24, 16, 'Trancemission'),
(25, 19, 'Big Hits');
SELECT * FROM who_listening_radio;

-- кто слушает подкасты?
CREATE TABLE who_listening_podcasts(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	podcast_id BIGINT UNSIGNED NOT NULL,
	podcast_name VARCHAR (150) NOT NULL,
	listening_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (podcast_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (podcast_id) REFERENCES podcasts(id)
);
INSERT INTO who_listening_podcasts (user_id, podcast_id, podcast_name) 
VALUES (1, 4, 'КРЕМОВ И ХРУСТАЛЕВ'),
(2, 4, 'КРЕМОВ И ХРУСТАЛЕВ'),
(3, 3, 'RECORD CLASSIC'),
(4, 2, 'RECORD PARTY'),
(5, 4, 'КРЕМОВ И ХРУСТАЛЕВ'),
(6, 2, 'RECORD PARTY'),
(7, 3, 'RECORD CLASSIC'),
(8, 2, 'RECORD PARTY'),
(9, 2, 'RECORD PARTY'),
(10, 1, 'RECORD MEGAMIX'),
(11, 1, 'RECORD MEGAMIX'),
(12, 3, 'RECORD CLASSIC'),
(13, 1, 'RECORD MEGAMIX'),
(14, 3, 'RECORD CLASSIC'),
(15, 3, 'RECORD CLASSIC'),
(16, 1, 'RECORD MEGAMIX'),
(17, 4, 'КРЕМОВ И ХРУСТАЛЕВ'),
(18, 2, 'RECORD PARTY'),
(19, 2, 'RECORD PARTY'),
(20, 2, 'RECORD PARTY'),
(21, 2, 'RECORD PARTY'),
(22, 2, 'RECORD PARTY'),
(23, 2, 'RECORD PARTY'),
(24, 4, 'КРЕМОВ И ХРУСТАЛЕВ'),
(25, 3, 'RECORD CLASSIC');
SELECT * FROM who_listening_podcasts;

-- кто слушает чарты?
CREATE TABLE who_listening_charts(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	chart_id BIGINT UNSIGNED NOT NULL,
	chart_name VARCHAR (150) NOT NULL,
	listening_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (chart_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (chart_id) REFERENCES charts(id)
);
INSERT INTO who_listening_charts (user_id, chart_id, chart_name) 
VALUES (1, 3, 'A Little Taste(Record mix)'),
(2, 1, 'Rampampam(Record mix)'),
(3, 2, 'Bad Habits(Record mix)'),
(4, 3, 'A Little Taste(Record mix)'),
(5, 2, 'Bad Habits(Record mix)'),
(6, 1, 'Rampampam(Record mix)'),
(7, 2, 'Bad Habits(Record mix)'),
(8, 3, 'A Little Taste(Record mix)'),
(9, 3, 'A Little Taste(Record mix)'),
(10, 3, 'A Little Taste(Record mix)'),
(11, 2, 'Bad Habits(Record mix)'),
(12, 1, 'Rampampam(Record mix)'),
(13, 4, 'Я в моменте(Record mix)'),
(14, 3, 'A Little Taste(Record mix)'),
(15, 1, 'Rampampam(Record mix)'),
(16, 3, 'A Little Taste(Record mix)'),
(17, 4, 'Я в моменте(Record mix'),
(18, 1, 'Rampampam(Record mix)'),
(19, 4, 'Я в моменте(Record mix)'),
(20, 3, 'A Little Taste(Record mix)'),
(21, 4, 'Я в моменте(Record mix)'),
(22, 1, 'Rampampam(Record mix)'),
(23, 1, 'Rampampam(Record mix)'),
(24, 3, 'A Little Taste(Record mix)'),
(25, 4, 'Я в моменте(Record mix)');
SELECT * FROM who_listening_charts;

DROP TABLE who_watching_news;
-- кто смотрит новости?
CREATE TABLE who_watching_news(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	news_id BIGINT UNSIGNED NOT NULL,
	news_name VARCHAR (150) NOT NULL,
	watching_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (news_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (news_id) REFERENCES news(id)
);
INSERT INTO who_watching_news (user_id, news_id, news_name) 
VALUES (1, 1, 'Поэтический флешмоб "Осенний Движ" в эфире Рекорда'),
(2, 4, 'Record_Stream_LP'),
(3, 3, 'Record Brithday Superchart: Лучшее с 1995 по 2001'),
(4, 2, 'Обьявляем новый сезон на Рекорде!'),
(5, 4, 'Record_Stream_LP'),
(6, 4, 'Record_Stream_LP'),
(7, 2, 'Обьявляем новый сезон на Рекорде!'),
(8, 4, 'Record_Stream_LP'),
(9, 4, 'Record_Stream_LP'),
(10, 4, 'Record_Stream_LP'),
(11, 4, 'Record_Stream_LP'),
(12, 2, 'Обьявляем новый сезон на Рекорде!'),
(13, 2, 'Обьявляем новый сезон на Рекорде!'),
(14, 2, 'Обьявляем новый сезон на Рекорде!'),
(15, 1, 'Поэтический флешмоб "Осенний Движ" в эфире Рекорда'),
(16, 1, 'Поэтический флешмоб "Осенний Движ" в эфире Рекорда'),
(17, 2, 'Обьявляем новый сезон на Рекорде!'),
(18, 4, 'Record_Stream_LP'),
(19, 3, 'Record Brithday Superchart: Лучшее с 1995 по 2001'),
(20, 2, 'Обьявляем новый сезон на Рекорде!'),
(21, 2, 'Обьявляем новый сезон на Рекорде!'),
(22, 4, 'Record_Stream_LP'),
(23, 1, 'Поэтический флешмоб "Осенний Движ" в эфире Рекорда'),
(24, 2, 'Обьявляем новый сезон на Рекорде!'),
(25, 4, 'Record_Stream_LP');
SELECT * FROM who_watching_news;

-- кто подписался на события?
CREATE TABLE who_subscribe_developments(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	developments_id BIGINT UNSIGNED NOT NULL,
	developments_name VARCHAR (150) NOT NULL,
	subscribe_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (user_id),
	KEY (developments_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (developments_id) REFERENCES developments(id)
);
INSERT INTO who_subscribe_developments (user_id, developments_id, developments_name) 
VALUES (1, 2, 'Markul'),
(2, 4, 'Супердискотека 90-х'),
(3, 4, 'Супердискотека 90-х'),
(4, 2, 'Markul'),
(5, 1, 'Фестиваль уличного исскуства'),
(6, 4, 'Супердискотека 90-х'),
(7, 3, 'Пиратская Станция. Back to the Jungle'),
(8, 3, 'Пиратская Станция. Back to the Jungle'),
(9, 2, 'Markul'),
(10, 2, 'Markul'),
(11, 2, 'Markul'),
(12, 3, 'Пиратская Станция. Back to the Jungle'),
(13, 4, 'Супердискотека 90-х'),
(14, 2, 'Markul'),
(15, 3, 'Пиратская Станция. Back to the Jungle'),
(16, 1, 'Фестиваль уличного исскуства'),
(17, 2, 'Markul'),
(18, 3, 'Пиратская Станция. Back to the Jungle'),
(19, 2, 'Markul'),
(20, 3, 'Пиратская Станция. Back to the Jungle'),
(21, 1, 'Фестиваль уличного исскуства'),
(22, 4, 'Супердискотека 90-х'),
(23, 3, 'Пиратская Станция. Back to the Jungle'),
(24, 1, 'Фестиваль уличного исскуства'),
(25, 2, 'Markul');
SELECT * FROM who_subscribe_developments;
















