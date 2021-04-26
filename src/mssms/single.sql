-- Справочник городов
DECLARE @cities TABLE
(
	city_id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	city_name NVARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO @cities (city_id, city_name)
VALUES 
	('F5A2C3B9-4A84-407B-8C10-0E98AD521428', N'Москва'),
	('5E997273-D9C6-4E91-9C2B-E2AC6662345B', N'Санкт-Петербург')
;

-- Справочник адресов
DECLARE @addresses TABLE
(
	address_id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	street_name NVARCHAR(255) NOT NULL,
	house_number VARCHAR(10) NOT NULL,
	UNIQUE (street_name, house_number)
);
INSERT INTO @addresses (address_id, street_name, house_number)
VALUES 
	('2DAA6D91-0C1C-450E-B9C9-FCA103F85083', N'Гагарина', '1'),
	('C571AB70-87B4-45B9-83E0-E71912F11074', N'Гагарина', '2')
;

-- Справочник людей
DECLARE @people TABLE
(
	person_id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	last_name NVARCHAR(100) NOT NULL,
	city_id UNIQUEIDENTIFIER NOT NULL,
	address_id UNIQUEIDENTIFIER NULL,
	UNIQUE (last_name, city_id, address_id)
);
INSERT INTO @people (person_id, last_name, city_id, address_id)
VALUES 
	('46575F6F-A52C-41BE-9B1E-3DFCF74B6D24', N'Иванов','F5A2C3B9-4A84-407B-8C10-0E98AD521428', '2DAA6D91-0C1C-450E-B9C9-FCA103F85083'),
	('5E997273-D9C6-4E91-9C2B-E2AC6662345B', N'Иванов','5E997273-D9C6-4E91-9C2B-E2AC6662345B', '2DAA6D91-0C1C-450E-B9C9-FCA103F85083'),
	('3374AE22-CA0F-42F9-B05F-482C8E7D6AD3', N'Иванова','F5A2C3B9-4A84-407B-8C10-0E98AD521428', '2DAA6D91-0C1C-450E-B9C9-FCA103F85083'),
	('C571AB70-87B4-45B9-83E0-E71912F11074', N'Петров', '5E997273-D9C6-4E91-9C2B-E2AC6662345B', 'C571AB70-87B4-45B9-83E0-E71912F11074')
;

-- Телефонная книга
DECLARE @phone_book TABLE
(
	phone_book_id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	person_id UNIQUEIDENTIFIER NOT NULL,
	phone BIGINT NOT NULL,
	UNIQUE (person_id, phone)
);
INSERT INTO @phone_book (phone_book_id, person_id, phone)
VALUES 
	('DCA7F52D-90A2-4B58-8CD1-06C09DBC418C', '46575F6F-A52C-41BE-9B1E-3DFCF74B6D24', 79031234567),
	('6B349324-81E5-4EE2-ACB5-A58C2C08E095', '46575F6F-A52C-41BE-9B1E-3DFCF74B6D24', 71691234567),
	('89F10A35-0F9E-4C28-9F2F-A3BEC202D950', '5E997273-D9C6-4E91-9C2B-E2AC6662345B', 72691234567),
	('E6861F83-D34A-445B-8959-43ABAE42A1C7', '3374AE22-CA0F-42F9-B05F-482C8E7D6AD3', 79031234568)
;

-- Справочник машин м владельцев
DECLARE @cars TABLE
(
	car_id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	model NVARCHAR(100) NOT NULL,
	color VARCHAR(20) NOT NULL,
	cost MONEY NOT NULL,
	person_id UNIQUEIDENTIFIER NULL
);
INSERT INTO @cars (car_id, model, color, cost, person_id)
VALUES 
	('712F947F-3166-4ADB-8301-8E6697523C9F', N'Chery Tiggo 8', 'Black', 1524900, '46575F6F-A52C-41BE-9B1E-3DFCF74B6D24'),
	('99360D7E-06F5-4119-B70E-E51CDBE6D3B3', N'Volvo XC90', 'White', 5055432, '3374AE22-CA0F-42F9-B05F-482C8E7D6AD3'),
	('609E16B2-DC7E-4354-879F-C2B88454DB2B', N'BMW X3', 'Black', 4050000, '5E997273-D9C6-4E91-9C2B-E2AC6662345B'),
	('3803451D-9A1D-4BA4-A3CE-26EECA2F63CD', N'Hyundai Sonata', 'Red', 1417000, '3374AE22-CA0F-42F9-B05F-482C8E7D6AD3')
;

-- Вкладчики банков
DECLARE @bank_deposit TABLE
(
	bank_deposit_id UNIQUEIDENTIFIER NOT NULL,
	bank_name NVARCHAR(100) NOT NULL,
	bank_account VARCHAR(200) NOT NULL,
	amount MONEY NOT NULL DEFAULT 0,
	person_id UNIQUEIDENTIFIER NOT NULL
);
INSERT INTO @bank_deposit (bank_deposit_id, bank_name, bank_account, amount, person_id)
VALUES 
	('FA1CFC5F-F394-4926-8102-0F9D9F1D6D9C', N'Альфа-Банк', '5485493039348420495843', 2324200, '46575F6F-A52C-41BE-9B1E-3DFCF74B6D24'),
	('6BBAA467-0BD4-4CF5-A5AA-B916980C0606', N'Альфа-Банк', '3437893429473482349834', 3432228, '46575F6F-A52C-41BE-9B1E-3DFCF74B6D24'),
	('B716B7B5-70DF-4D87-8B2E-5C1DBE85F27C', N'Райффайзенбанк', '342849343284937437892', 5000000, '46575F6F-A52C-41BE-9B1E-3DFCF74B6D24'),
	('5E997273-D9C6-4E91-9C2B-E2AC6662345B', N'Сбербанк России', '45475834545643856384', 1293994, '5E997273-D9C6-4E91-9C2B-E2AC6662345B'),
	('0092DAD8-F11B-4215-B19C-B10413CFD724', N'Райффайзенбанк', '4536548563456388348', 2832394, '3374AE22-CA0F-42F9-B05F-482C8E7D6AD3')
;

-- ====================================================================
-- По № телефона найти: Фамилию, Марку автомобиля, 
-- Стоимость автомобиля (может быть несколько);
-- ====================================================================
SELECT p.last_name, c.model, c.cost
FROM @phone_book pb
JOIN @people p ON pb.person_id = p.person_id
JOIN @cars c ON pb.person_id = c.person_id
WHERE pb.phone LIKE '79031234568';

-- ====================================================================
-- Используя сформированное в пункте а) правило, 
-- по № телефона найти: только Марку автомобиля 
-- (автомобилей может быть несколько)
-- ====================================================================
SELECT DISTINCT c.model
FROM @phone_book pb
JOIN @people p ON pb.person_id = p.person_id
JOIN @cars c ON pb.person_id = c.person_id
WHERE pb.phone LIKE '79031234568';

-- ====================================================================
-- Используя простой, не составной вопрос: по Фамилии 
-- (уникальна в городе, но в разных городах есть однофамильцы) 
-- и Городу проживания найти: Улицу проживания, Банки, 
-- в которых есть вклады и №телефона
-- ====================================================================
SELECT c.city_name, ad.street_name, ad.house_number, bd.banks, pb.phones
FROM @people p
JOIN @cities c ON p.city_id = c.city_id
JOIN @addresses ad ON p.address_id = ad.address_id
JOIN 
(
	SELECT 
		person_bank_info.person_id, 
		banks =  string_agg(person_bank_info.bank_name, ',')
	FROM
	(
		SELECT DISTINCT 
			person_id, bank_name
		FROM @bank_deposit
	) person_bank_info
	GROUP BY person_bank_info.person_id
) bd ON p.person_id = bd.person_id
JOIN 
(
	SELECT 
		person_phone_info.person_id, 
		phones = string_agg(person_phone_info.phone, ',')
	FROM 
	(
		SELECT DISTINCT 
			person_id, phone
		FROM @phone_book
	) person_phone_info
	GROUP BY person_phone_info.person_id
) pb ON p.person_id = pb.person_id
WHERE 
	c.city_name = N'Москва' AND
	--c.city_name = N'Санкт-Петербург' AND 
	p.last_name = N'Иванов';