SELECT 
    p.person_id AS ID,
    p.first_name AS "First name",
    p.last_name AS "Last name",
    COALESCE(SUM(m.budget), 0) AS "Total movies budget"
FROM 
    Person p
LEFT JOIN 
    Character c ON p.person_id = c.person_id
LEFT JOIN 
    Movie m ON c.movie_id = m.movie_id
GROUP BY 
    p.person_id, p.first_name, p.last_name;
