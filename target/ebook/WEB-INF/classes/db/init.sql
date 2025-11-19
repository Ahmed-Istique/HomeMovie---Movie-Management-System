CREATE TABLE users (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE movies (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255),
    screenwriter VARCHAR(255),
    actors VARCHAR(255),
    studio VARCHAR(255),
    genre VARCHAR(100),
    rating FLOAT,
    poster_url VARCHAR(255),
    description VARCHAR(1000),
    section VARCHAR(50), -- 'todays_special' or 'movies_2025'
    created_by INT, -- References users.id
    FOREIGN KEY (created_by) REFERENCES users(id)
);

-- Insert admin user
INSERT INTO users (name, email, password, is_admin) 
VALUES ('Admin', 'admin@qq.com', 'admin12@', TRUE);