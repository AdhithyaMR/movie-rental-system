# Movie Rental System — SQL Mini Project

This is a SQL project that simulates a simple movie rental system. It allows you to manage customer data, movie information, and rental records using SQL.

---

## Project Structure

This project includes:
- `Customers` table — stores customer details
- `Movies` table — stores movie information
- `Rentals` table — tracks which customer rented which movie and when

---

## Database Schema

### Customers Table
| Column       | Type         | Description            |
|--------------|--------------|------------------------|
| customer_id  | INT (PK)     | Unique customer ID     |
| name         | VARCHAR(100) | Customer name          |
| email        | VARCHAR(100) | Customer email         |

### Movies Table
| Column        | Type         | Description          |
|---------------|--------------|----------------------|
| movie_id      | INT (PK)     | Unique movie ID      |
| title         | VARCHAR(100) | Movie title          |
| genre         | VARCHAR(50)  | Genre (e.g. Sci-Fi)  |
| year_released | INT          | Year of release      |

### Rentals Table
| Column       | Type      | Description                  |
|--------------|-----------|------------------------------|
| rental_id    | INT (PK)  | Unique rental ID             |
| customer_id  | INT (FK)  | Refers to Customers table    |
| movie_id     | INT (FK)  | Refers to Movies table       |
| rental_date  | DATE      | Date when movie was rented   |
| return_date  | DATE      | Date when movie was returned |

---

## Sample Data

- 3 Customers
- 5 Movies
- 5 Rental records

---

# Sample SQL Queries

Here are some of the queries included in this project:

- View all customers:
  ```sql
  SELECT * FROM Customers;

## Show rental history with customer and movie names:
```sql
SELECT Rentals.rental_id, Customers.name, Movies.title, Rentals.rental_date, Rentals.return_date
FROM Rentals
JOIN Customers ON Rentals.customer_id = Customers.customer_id
JOIN Movies ON Rentals.movie_id = Movies.movie_id;
```

## Find movies that are not yet returned:
```sql
SELECT Customers.name, Movies.title, Rentals.rental_date
FROM Rentals
JOIN Customers ON Rentals.customer_id = Customers.customer_id
JOIN Movies ON Rentals.movie_id = Movies.movie_id
WHERE Rentals.return_date IS NULL;
```
## Count how many times each movie was rented:
```sql
SELECT Movies.title, COUNT(Rentals.rental_id) AS times_rented
FROM Rentals
JOIN Movies ON Rentals.movie_id = Movies.movie_id
GROUP BY Movies.title;

```



