CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
    author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
    label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    multiplayer VARCHAR(200),
    last_played_at DATE NOT NULL
);