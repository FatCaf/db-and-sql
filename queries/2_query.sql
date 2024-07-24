SELECT 
    m.movie_id AS ID,
    m.title AS Title,
    COUNT(c.person_id) AS "Actors count"
FROM 
    Movie m
LEFT JOIN 
    Character c ON m.movie_id = c.movie_id
WHERE 
    m.release_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY 
    m.movie_id, m.title;
