--1
SELECT name, country FROM institutions ORDER BY country ASC;

--3

SELECT full_name, h_index FROM researchers 
WHERE h_index >= 20 AND h_index <= 40;
