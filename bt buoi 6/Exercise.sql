USE sakila;

-- 1. How many category films we have?
SELECT COUNT(*) AS category_count
FROM category;

-- 2. Count the number of "ACTION" films
SELECT COUNT(*) AS action_film_count
FROM film 
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Action';

-- 3. Count the number of unique customers who have rentals in the rental table
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM rental;

-- 4. Select the film title and length of all films that have length greater than the average film length
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- 5. Select the maximum number and the minimum number of films for each category
SELECT category.name AS category_name,
       MAX(film_count) AS max_film_count,
       MIN(film_count) AS min_film_count
FROM (
    SELECT fc.category_id, COUNT(f.film_id) AS film_count
    FROM film_category fc
    JOIN film f ON fc.film_id = f.film_id
    GROUP BY fc.category_id
) AS subquery
JOIN category ON subquery.category_id = category.category_id
GROUP BY category.name;

-- 6. Tell me each category name and the number of films for that category
SELECT category.name AS category_name, 
       COUNT(film.film_id) AS film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.category_id, category.name;

-- 7. Concatenate the film titles and length from the films table
SELECT CONCAT(title, ' (', length, ' min)') AS film_info
FROM film;

-- 8. Extract the customers email from the 5th character onwards
SELECT SUBSTRING(email, 5) AS email_substring
FROM customer;

-- 9. Tell me the customers first name in lower case and last name in upper case for each customer who have last name is "Smith"
SELECT LOWER(first_name) AS first_name_lower,
       UPPER(last_name) AS last_name_upper
FROM customer
WHERE last_name = 'Smith';

-- 10. Tell me the last 3 letters of each film title from the films table
SELECT RIGHT(title, 3) AS last_three_letters
FROM film;

-- 11. Concatenate the first three letters in the first name and last name columns together from the customers table
SELECT CONCAT(LEFT(first_name, 3), LEFT(last_name, 3)) AS name_concat
FROM customer;

-- 12. Which films are over 2 hours long?
SELECT title
FROM film
WHERE length > 120;

-- 13. Which category name had the most films?
SELECT category.name AS category_name, 
       COUNT(film.film_id) AS film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.category_id, category.name
ORDER BY film_count DESC
LIMIT 1;

-- 14. How many actors are in the film 'AFFAIR PREJUDICE'?
SELECT COUNT(actor.actor_id) AS actor_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.title = 'AFFAIR PREJUDICE';

-- 15. Which 5 customers made the most rentals?
SELECT customer.customer_id, 
       CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, 
       COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY rental_count DESC
LIMIT 5;

-- 16. Which films were shown in category 'Action'?
SELECT film.title
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Action';

-- 17. How many of the customers made a rental?
SELECT COUNT(DISTINCT customer_id) AS customers_with_rentals
FROM rental;

SELECT 
    (SELECT COUNT(film_id) FROM film_category GROUP BY category_id ORDER BY COUNT(film_id) DESC LIMIT 1) AS max_film_count,
    (SELECT COUNT(film_id) FROM film_category GROUP BY category_id ORDER BY COUNT(film_id) ASC LIMIT 1) AS min_film_count;
