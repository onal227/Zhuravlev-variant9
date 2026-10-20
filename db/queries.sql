-- 10 последних показаний по номеру измерения
SELECT n, t_s, sensor, value
FROM readings
ORDER BY n DESC, sensor
LIMIT 10;

-- Минимум, среднее и максимум по каждому датчику
SELECT sensor,
       MIN(value) AS min_value,
       ROUND(AVG(value), 2) AS avg_value,
       MAX(value) AS max_value
FROM readings
GROUP BY sensor
ORDER BY sensor;

-- Все события по порядку
SELECT n, t_s, type, message
FROM events
ORDER BY n, id;
