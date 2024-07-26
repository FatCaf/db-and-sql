SELECT 
    m.movie_id AS ID,
    m.title AS Title,
    m.release_date AS "Release date",
    m.duration AS Duration,
    m.description AS Description,
    JSON_BUILD_OBJECT(
        'file_id', f.file_id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'key', f."key",
        'url', f.url
    ) AS Poster,
    JSON_BUILD_OBJECT(
        'director_id', d.person_id,
        'first_name', d.first_name,
        'last_name', d.last_name
    ) AS Director
FROM 
    Movie m
JOIN 
    File f ON m.poster_file_id = f.file_id
JOIN 
    Person d ON m.director_id = d.person_id
JOIN 
    MovieGenre mg ON m.movie_id = mg.movie_id
JOIN 
    Genre g ON mg.genre_id = g.genre_id
WHERE 
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND g.genre_name IN ('Action', 'Drama');
