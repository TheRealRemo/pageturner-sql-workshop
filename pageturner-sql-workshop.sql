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
SELECT genres.name AS GenreNames, SUM(stock_quantity) AS TotalStockQuantity
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
-- Question 15
SELECT books.title, CONCAT(first_name, " ", last_name) AS full_name
FROM books
JOIN authors ON books.author_id = authors.author_id;
-- Question 16
SELECT books.title BookTitle, genres.name GenreName
FROM books 
JOIN genres ON books.genre_id = genres.genre_ID;
-- Question 17
SELECT orders.order_id AS Order_ID, order_date, CONCAT(first_name, " ", last_name) AS full_name
FROM orders
JOIN customers ON orders.order_id = customers.customer_id;
-- Question 18
SELECT books.title order_item_book_title, order_items.quantity, order_items.unit_price
FROM order_items
JOIN books ON order_items.book_id = books.book_id;  
--  Question 19
SELECT CONCAT(authors.first_name, " ", authors.last_name) AS full_name, count(books.title) AS books_written
FROM authors
LEFT JOIN books ON authors.author_id = books.author_id
GROUP BY full_name
ORDER BY books_written DESC;
-- Question 20
SELECT CONCAT(customers.first_name, " ", customers.last_name) AS full_name, count(orders.customer_id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY full_name
ORDER BY total_orders DESC;
