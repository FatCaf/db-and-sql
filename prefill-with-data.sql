-- Insert into Country
INSERT INTO Country (country_name) VALUES
('United States'),
('United Kingdom'),
('France'),
('Germany'),
('Japan');

-- Insert into File
INSERT INTO File (file_name, mime_type, "key", url) VALUES
('avatar1.jpg', 'image/jpeg', 'avatars/avatar1.jpg', 'http://example.com/avatars/avatar1.jpg'),
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'http://example.com/posters/poster1.jpg'),
('photo1.jpg', 'image/jpeg', 'photos/photo1.jpg', 'http://example.com/photos/photo1.jpg');

-- Insert into Person
INSERT INTO Person (first_name, last_name, biography, date_of_birth, gender, home_country_id, primary_photo_file_id) VALUES
('John', 'Doe', 'An acclaimed actor.', '1980-05-15', 'Male', 1, 1),
('Jane', 'Smith', 'A renowned director.', '1975-08-20', 'Female', 2, 1),
('Pierre', 'Dupont', 'Famous French screenwriter.', '1982-11-30', 'Male', 3, 3);

-- Insert into PersonPhoto
INSERT INTO PersonPhoto (person_id, photo_file_id) VALUES
(1, 3),
(2, 1);

-- Insert into Genre
INSERT INTO Genre (genre_name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Horror');

-- Insert into Movie
INSERT INTO Movie (title, description, budget, release_date, duration, director_id, country_id, poster_file_id) VALUES
('Action Hero', 'An action-packed adventure.', 150000000.00, '2023-01-15', 130, 2, 1, 2),
('Drama Queen', 'A dramatic story of a queen.', 100000000.00, '2022-06-25', 120, 2, 2, 3);

-- Insert into ActorParticipation
INSERT INTO ActorParticipation (movie_id, person_id) VALUES
(1, 1),
(2, 1);

-- Insert into MovieGenre
INSERT INTO MovieGenre (movie_id, genre_id) VALUES
(1, 1), -- Action Hero is an Action movie
(2, 2); -- Drama Queen is a Drama movie

-- Insert into Character
INSERT INTO Character (name, description, role, movie_id, person_id) VALUES
('Heroic Lead', 'The main hero of the story.', 'leading', 1, 1),
('Supporting Role', 'A supporting character.', 'supporting', 2, 1);

-- Insert into UserAccount
INSERT INTO "UserAccount" (username, first_name, last_name, email, password, avatar_file_id) VALUES
('johndoe', 'John', 'Doe', 'john.doe@example.com', 'password123', 1),
('janedoe', 'Jane', 'Doe', 'jane.doe@example.com', 'password123', 1);

-- Insert into FavoriteMovie
INSERT INTO FavoriteMovie (user_id, movie_id) VALUES
(1, 1),
(2, 2);
