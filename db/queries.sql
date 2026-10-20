-- 1. 10 последних показаний по номеру измерения
SELECT n, t_s, sensor, value
FROM readings
ORDER BY n DESC, sensor
LIMIT 10;

-- 2. Минимум, среднее и максимум по каждому датчику
SELECT sensor,
       MIN(value) AS min_value,
       ROUND(AVG(value), 2) AS avg_value,
       MAX(value) AS max_value
FROM readings
GROUP BY sensor
ORDER BY sensor;

-- 3. Все события по порядку времени
SELECT n, t_s, type, message
FROM events
ORDER BY n, id;

-- 4. Количество записей в таблицах
SELECT 'readings' AS table_name, COUNT(*) AS row_count FROM readings
UNION ALL
SELECT 'events', COUNT(*) FROM events;
