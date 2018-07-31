SELECT id, mrn, first_name, middle_name, last_name, height, weight
FROM   (SELECT id, mrn, first_name, middle_name, last_name, height, weight, Row_number() OVER(PARTITION BY mrn order by id) rn
FROM patients) t
WHERE rn = 1 AND last_name LIKE '%mit%';


SELECT id, mrn, first_name, middle_name, last_name, height, weight
FROM   (SELECT id, mrn, first_name, middle_name, last_name, height, weight, Row_number() OVER(PARTITION BY mrn order by id) rn
FROM patients) t
WHERE rn = 1 AND discharged_at IS NOT NULL;


SELECT id, mrn, first_name, middle_name, last_name, height, weight
FROM   (SELECT id, mrn, first_name, middle_name, last_name, height, weight, Row_number() OVER(PARTITION BY mrn order by id) rn
FROM patients) t
WHERE rn = 1 AND admitted_at > '07/05/2014' AND admitted_at < '08/19/2014'
