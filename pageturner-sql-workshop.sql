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

