CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    year_released INT
);

-- Rentals Table
CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    rental_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- ========== INSERT SAMPLE DATA ==========

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com');

-- Insert Movies
INSERT INTO Movies VALUES
(1, 'Inception', 'Sci-Fi', 2010),
(2, 'Titanic', 'Romance', 1997),
(3, 'The Matrix', 'Sci-Fi', 1999),
(4, 'Interstellar', 'Sci-Fi', 2014),
(5, 'Joker', 'Drama', 2019);

-- Insert Rentals
INSERT INTO Rentals VALUES
(1, 1, 1, '2025-08-01', '2025-08-05'),
(2, 2, 2, '2025-08-02', NULL),
(3, 1, 3, '2025-08-03', '2025-08-06'),
(4, 3, 5, '2025-08-04', '2025-08-07'),
(5, 2, 4, '2025-08-05', NULL);

-- ========== PRACTICE QUERIES ==========

-- 1. Show all customers
SELECT * FROM Customers;

-- 2. List all movies in the database
SELECT * FROM Movies;

-- 3. Show all rental records with customer and movie details
SELECT Rentals.rental_id, Customers.name, Movies.title, Rentals.rental_date, Rentals.return_date
FROM Rentals
JOIN Customers ON Rentals.customer_id = Customers.customer_id
JOIN Movies ON Rentals.movie_id = Movies.movie_id;

-- 4. Find all movies that are currently not returned
SELECT Customers.name, Movies.title, Rentals.rental_date
FROM Rentals
JOIN Customers ON Rentals.customer_id = Customers.customer_id
JOIN Movies ON Rentals.movie_id = Movies.movie_id
WHERE Rentals.return_date IS NULL;

-- 5. Count how many times each movie was rented
SELECT Movies.title, COUNT(Rentals.rental_id) AS times_rented
FROM Rentals
JOIN Movies ON Rentals.movie_id = Movies.movie_id
GROUP BY Movies.title;
