/*Consulta 1*/

SELECT ci.city_id, ci.city, c.first_name, c.last_name, c.email, d.address FROM customer c
JOIN address d ON d.address_id = c.address_id
JOIN city ci ON ci.city_id = d.city_id
WHERE ci.city_id = 312;

/*Consulta 2*/

SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.category_id = 5;

/*Consulta 3*/

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) actor_name, f.film_id, f.title, f.description, f.release_year FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
WHERE a.actor_id = 5;

/*Consulta 4*/

SELECT c.store_id, ci.city_id, c.first_name, c.last_name, c.email, d.address FROM customer c
JOIN address d ON d.address_id = c.address_id
JOIN city ci ON ci.city_id = d.city_id
JOIN store s ON s.store_id = c.store_id
WHERE c.store_id = 1 AND ci.city_id IN (1, 42, 312, 459);

/*Consulta 5*/
SELECT f.title, f.description, f.release_year, f.rating, f.special_features FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
WHERE f.rating = 'G' AND f.special_features LIKE '%Behind the Scenes%' AND actor_id = 15;

/*Consulta 6*/

SELECT f.film_id, f.title, a.actor_id, CONCAT(a.first_name, ' ', a.last_name) FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE f.film_id = 369;

/*Consulta 7*/

SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name genre, f.rental_rate FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE f.rental_rate = 2.99 AND c.name = 'Drama';

/*Consulta 8*/

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) actor_name, f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name genre FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
JOIN actor a ON a.actor_id = fa.actor_id
/*El actor_id de Sandra Kilmer es 23*/
WHERE a.actor_id = 23 and c.name = 'Action';