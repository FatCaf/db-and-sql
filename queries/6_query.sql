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
        'person_id', d.person_id,
        'first_name', d.first_name,
        'last_name', d.last_name,
        'photo', JSON_BUILD_OBJECT(
            'file_id', dp.file_id,
            'file_name', dp.file_name,
            'mime_type', dp.mime_type,
            'key', dp."key",
            'url', dp.url
        )
    ) AS Director,
    JSON_AGG(
        JSON_BUILD_OBJECT(
            'person_id', a.person_id,
            'first_name', a.first_name,
            'last_name', a.last_name,
            'photo', JSON_BUILD_OBJECT(
                'file_id', ap.file_id,
                'file_name', ap.file_name,
                'mime_type', ap.mime_type,
                'key', ap."key",
                'url', ap.url
            )
        )
    ) AS Actors,
    JSON_AGG(
        JSON_BUILD_OBJECT(
            'genre_id', g.genre_id,
            'name', g.genre_name
        )
    ) AS Genres
FROM 
    Movie m
JOIN 
    File f ON m.poster_file_id = f.file_id
JOIN 
    Person d ON m.director_id = d.person_id
JOIN 
    File dp ON d.primary_photo_file_id = dp.file_id
LEFT JOIN 
    Character c ON m.movie_id = c.movie_id
LEFT JOIN 
    Person a ON c.person_id = a.person_id
LEFT JOIN 
    File ap ON a.primary_photo_file_id = ap.file_id
JOIN 
    MovieGenre mg ON m.movie_id = mg.movie_id
JOIN 
    Genre g ON mg.genre_id = g.genre_id
WHERE 
    m.movie_id = 1
GROUP BY 
    m.movie_id, m.title, m.release_date, m.duration, m.description, f.file_id, f.file_name, f.mime_type, f."key", f.url,
    d.person_id, d.first_name, d.last_name, dp.file_id, dp.file_name, dp.mime_type, dp."key", dp.url;
