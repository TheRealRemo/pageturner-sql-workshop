-- Question 1
SELECT title , price
FROM books
ORDER BY price DESC;
-- Question 2
SELECT title, publication_year
FROM books
WHERE publication_year > 2000;
-- Question 3
SELECT *
FROM customers
WHERE country = "USA";
-- Question 4
SELECT country
FROM customers
GROUP BY country;
-- Question 5
SELECT title, price
FROM books
ORDER BY price 
LIMIT 5;
-- Question 6 
SELECT title
FROM books
WHERE title LIKE '%Foundation%';
-- Question 7
SELECT title, stock_quantity 
FROM books
WHERE stock_quantity = 0;
-- Question 8
SELECT count(*)
FROM books;
-- Question 9
SELECT ROUND(avg(price), 2)
FROM books;
-- Question 10
SELECT max(price) , min(price) 
FROM books;
-- Question 11
SELECT genres.name, count(b.genre_ID) AS GenreCount
FROM books b
JOIN genres ON b.genre_id = genres.genre_ID
GROUP BY b.genre_ID;
-- Question 12
SELECT genres.name, SUM(stock_quantity)
FROM books b
JOIN genres ON b.genre_id = genres.genre_ID
GROUP BY b.genre_id;
-- Question 13
SELECT b.genre_id, genres.name, count(b.genre_ID) AS GenreCount
FROM books b
JOIN genres ON b.genre_id = genres.genre_ID
GROUP BY b.genre_id
HAVING COUNT(b.genre_id) > 3;
-- Question 14
SELECT orders.status, COUNT(orders.status) AS StatusCount
FROM orders
GROUP BY orders.status;

