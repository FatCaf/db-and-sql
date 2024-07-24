SELECT 
    p.person_id AS "Director ID",
    CONCAT(p.first_name, ' ', p.last_name) AS "Director name",
    COALESCE(AVG(m.budget), 0) AS "Average budget"
FROM 
    Person p
LEFT JOIN 
    Movie m ON p.person_id = m.director_id
GROUP BY 
    p.person_id, p.first_name, p.last_name;
