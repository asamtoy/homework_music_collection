DROP TABLE IF EXISTS music;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  NAME VARCHAR(255)
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  artist_id INT REFERENCES artists(id)
);
