CREATE TABLE Country (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE File (
    file_id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(50),
    "key" VARCHAR(255) UNIQUE NOT NULL,
    url TEXT NOT NULL
);

CREATE TABLE Person (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    home_country_id INT,
    primary_photo_file_id INT,
    FOREIGN KEY (home_country_id) REFERENCES Country(country_id),
    FOREIGN KEY (primary_photo_file_id) REFERENCES File(file_id)
);

CREATE TABLE PersonPhoto (
    photo_id SERIAL PRIMARY KEY,
    person_id INT NOT NULL,
    photo_file_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (photo_file_id) REFERENCES File(file_id)
);

CREATE TABLE Genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE Movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget DECIMAL(15, 2),
    release_date DATE,
    duration INT,
    director_id INT,
    country_id INT,
    poster_file_id INT,
    FOREIGN KEY (director_id) REFERENCES Person(person_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id),
    FOREIGN KEY (poster_file_id) REFERENCES File(file_id)
);

CREATE TABLE ActorParticipation (
    participation_id SERIAL PRIMARY KEY,
    movie_id INT,
    person_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE MovieGenre (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

CREATE TABLE Character (
    character_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    role VARCHAR(20) CHECK (role IN ('leading', 'supporting', 'background')),
    movie_id INT,
    person_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE "UserAccount" (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar_file_id INT,
    FOREIGN KEY (avatar_file_id) REFERENCES File(file_id)
);

CREATE TABLE FavoriteMovie (
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES "UserAccount"(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);