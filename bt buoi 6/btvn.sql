USE mavenmovies;

-- 1.Lấy danh sách tên các diễn viên (actors) có họ bắt đầu bằng chữ “S”.
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE 'S%';

-- 2.Lấy danh sách các bộ phim (films) được phát hành trong khoảng từ năm 2000 đến năm 2010.
SELECT title 
FROM film 
WHERE release_year BETWEEN 2000 AND 2010;

-- 3.Lấy danh sách các bộ phim (films) có rating là “PG” hoặc “PG-13”.
SELECT title 
FROM film 
WHERE rating IN ('PG', 'PG-13');

-- 4.Lấy danh sách diễn viên (actors) và số lượng bộ phim (films) mà họ tham gia, sắp xếp theo số lượng bộ phim giảm dần.
SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
GROUP BY actor.actor_id
ORDER BY film_count DESC;

-- 5.Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
SELECT film.title, category.name 
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;

-- 6.Lấy danh sách các bộ phim (films) và tổng số diễn viên (actors) tham gia trong mỗi bộ phim, sắp xếp theo tổng số diễn viên giảm dần.
SELECT film.title, COUNT(film_actor.actor_id) AS actor_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY actor_count DESC;

-- 7.Lấy danh sách các diễn viên (actors) có số lượng bộ phim (films) tham gia lớn hơn 30.
SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
HAVING COUNT(film_actor.film_id) > 30;

-- 8.Lấy danh sách các diễn viên (actors) không tham gia trong bất kỳ bộ phim nào.
SELECT first_name, last_name 
FROM actor
WHERE actor_id NOT IN (SELECT DISTINCT actor_id FROM film_actor);

-- 9.Lấy danh sách bộ phim (films) và tổng doanh thu (revenue) của từng bộ phim, sắp xếp theo tổng doanh thu giảm dần.
SELECT film.title, SUM(payment.amount) AS total_revenue
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.film_id
ORDER BY total_revenue DESC;

-- 10.Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng, với điều kiện mỗi bộ phim thuộc thể loại “Horror”.
SELECT film.title, category.name 
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Horror';
