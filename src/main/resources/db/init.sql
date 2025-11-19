CREATE TABLE users (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    photo_url VARCHAR(255),
    about VARCHAR(1000),
    country VARCHAR(100)
);

CREATE TABLE movies (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    title VARCHAR(255) NOT NULL,
    director VARCHAR(1000),
    screenwriter VARCHAR(1000),
    actors VARCHAR(1000),
    studio VARCHAR(255),
    genre VARCHAR(100),
    rating FLOAT,
    poster_url VARCHAR(255),
    description VARCHAR(1000),
    section VARCHAR(50),
    created_by INT,
    FOREIGN KEY (created_by) REFERENCES users(id)
);

-- Insert the fixed admin user:
INSERT INTO users (name, email, password, is_admin, photo_url, about, country) 
VALUES ('Admin', 'admin@qq.com', 'admin12@', TRUE, NULL, NULL, NULL);