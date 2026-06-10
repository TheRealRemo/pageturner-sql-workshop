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
-- Question 21
SELECT books.title, round(avg(reviews.rating), 1) AS rating_average
FROM books
JOIN reviews ON books.book_id = reviews.book_id
GROUP BY books.title
HAVING COUNT(reviews.rating) >= 1;
-- Question 22
SELECT title, price
FROM books
WHERE price > (SELECT avg(price) FROM books);
-- Question 23
SELECT *
FROM books
WHERE books.book_id NOT IN (SELECT order_items.book_id
FROM order_items);
-- Question 24
SELECT *
FROM customers
WHERE customer_id NOT IN (SELECT orders.customer_id
FROM orders);
-- Question 25
SELECT title, COUNT(reviews.book_id) AS review_amount
FROM books
LEFT JOIN reviews ON reviews.book_id = books.book_id
GROUP BY books.book_id
ORDER BY review_amount DESC
LIMIT 1;
-- Question 26
SELECT books.title, SUM(order_items.quantity) AS quantity_count
FROM books
LEFT JOIN order_items ON order_items.book_id = books.book_id
GROUP BY books.title
ORDER BY quantity_count DESC
LIMIT 1;
-- Question 27
SELECT genres.name, SUM(order_items.quantity * books.price) AS total_revenue
FROM genres
JOIN books ON books.genre_id = genres.genre_id 
JOIN order_items ON order_items.book_id = books.book_id
GROUP BY genres.name
ORDER BY total_revenue DESC;
-- Question 28 (Customers who never ordered omitted)
SELECT CONCAT(customers.first_name, " ", customers.last_name) AS full_name, 
SUM(order_items.quantity * books.price) AS total_spent
FROM customers
JOIN orders ON orders.customer_id = customers.customer_id
JOIN order_items ON order_items.order_id = orders.order_id
JOIN books ON books.book_id = order_items.book_id
GROUP BY customers.customer_id
ORDER BY total_spent DESC;
-- Question 29
SELECT CONCAT(authors.first_name, " ", authors.last_name) AS full_name, AVG(reviews.rating) AS avg_rating
FROM authors
JOIN books ON books.author_id = authors.author_id
JOIN reviews ON reviews.book_id = books.book_id
GROUP BY authors.author_id
ORDER BY avg_rating DESC
LIMIT 1;
-- Question 30
SELECT genres.name, books.title, books.price
FROM books
JOIN genres ON genres.genre_id = books.genre_id
WHERE books.price = (
SELECT MAX(b.price)
FROM books b
WHERE b.genre_id = books.genre_id
);