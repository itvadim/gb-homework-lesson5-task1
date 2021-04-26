-- ====================================================================
-- По № телефона найти: Фамилию, Марку автомобиля, 
-- Стоимость автомобиля (может быть несколько);
-- ====================================================================
SELECT p.last_name, c.model, c.cost
FROM phone_book pb
JOIN people p ON pb.person_id = p.person_id
JOIN cars c ON pb.person_id = c.person_id
WHERE pb.phone LIKE '79031234568';

-- ====================================================================
-- Используя сформированное в пункте а) правило, 
-- по № телефона найти: только Марку автомобиля 
-- (автомобилей может быть несколько)
-- ====================================================================
SELECT DISTINCT c.model
FROM phone_book pb
JOIN people p ON pb.person_id = p.person_id
JOIN cars c ON pb.person_id = c.person_id
WHERE pb.phone LIKE '79031234568';

-- ====================================================================
-- Используя простой, не составной вопрос: по Фамилии 
-- (уникальна в городе, но в разных городах есть однофамильцы) 
-- и Городу проживания найти: Улицу проживания, Банки, 
-- в которых есть вклады и №телефона
-- ====================================================================
SELECT c.city_name, ad.street_name, ad.house_number, bd.banks, pb.phones
FROM people p
JOIN cities c ON p.city_id = c.city_id
JOIN addresses ad ON p.address_id = ad.address_id
JOIN 
(
	SELECT 
		person_bank_info.person_id, 
		banks =  string_agg(person_bank_info.bank_name, ',')
	FROM
	(
		SELECT DISTINCT 
			person_id, bank_name
		FROM  bank_deposit
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
		FROM phone_book
	) person_phone_info
	GROUP BY person_phone_info.person_id
) pb ON p.person_id = pb.person_id
WHERE 
	c.city_name = N'Москва' AND
	--c.city_name = N'Санкт-Петербург' AND 
	p.last_name = N'Иванов';