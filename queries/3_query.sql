SELECT 
    u.user_id AS ID,
    u.username AS Username,
    ARRAY_AGG(f.movie_id) AS "Favorite movie IDs"
FROM 
    "UserAccount" u
LEFT JOIN 
    FavoriteMovie f ON u.user_id = f.user_id
GROUP BY 
    u.user_id, u.username;
