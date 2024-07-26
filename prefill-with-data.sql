-- Insert into Country
INSERT INTO Country (country_name, createdAt, updatedAt) VALUES
('United States', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('United Kingdom', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('France', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Germany', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Japan', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into File
INSERT INTO File (file_name, mime_type, "key", url, createdAt, updatedAt) VALUES
('avatar1.jpg', 'image/jpeg', 'avatars/avatar1.jpg', 'http://example.com/avatars/avatar1.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'http://example.com/posters/poster1.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('photo1.jpg', 'image/jpeg', 'photos/photo1.jpg', 'http://example.com/photos/photo1.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into Person
INSERT INTO Person (first_name, last_name, biography, date_of_birth, gender, home_country_id, primary_photo_file_id, createdAt, updatedAt) VALUES
('John', 'Doe', 'An acclaimed actor.', '1980-05-15', 'Male', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Jane', 'Smith', 'A renowned director.', '1975-08-20', 'Female', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Pierre', 'Dupont', 'Famous French screenwriter.', '1982-11-30', 'Male', 3, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into PersonPhoto
INSERT INTO PersonPhoto (person_id, photo_file_id, createdAt, updatedAt) VALUES
(1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into Genre
INSERT INTO Genre (genre_name, createdAt, updatedAt) VALUES
('Action', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Drama', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Comedy', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Horror', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into Movie
INSERT INTO Movie (title, description, budget, release_date, duration, director_id, country_id, poster_file_id, createdAt, updatedAt) VALUES
('Action Hero', 'An action-packed adventure.', 150000000.00, '2023-01-15', 200, 2, 1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Drama Queen', 'A dramatic story of a queen.', 100000000.00, '2022-06-25', 120, 2, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into ActorParticipation
INSERT INTO ActorParticipation (movie_id, person_id, createdAt, updatedAt) VALUES
(1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into MovieGenre
INSERT INTO MovieGenre (movie_id, genre_id, createdAt, updatedAt) VALUES
(1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP), -- Action Hero is an Action movie
(2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP); -- Drama Queen is a Drama movie

-- Insert into Character
INSERT INTO Character (name, description, role, movie_id, person_id, createdAt, updatedAt) VALUES
('Heroic Lead', 'The main hero of the story.', 'leading', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Supporting Role', 'A supporting character.', 'supporting', 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into UserAccount
INSERT INTO "UserAccount" (username, first_name, last_name, email, password, avatar_file_id, createdAt, updatedAt) VALUES
('johndoe', 'John', 'Doe', 'john.doe@example.com', 'password123', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('janedoe', 'Jane', 'Doe', 'jane.doe@example.com', 'password123', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert into FavoriteMovie
INSERT INTO FavoriteMovie (user_id, movie_id, createdAt, updatedAt) VALUES
(1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
