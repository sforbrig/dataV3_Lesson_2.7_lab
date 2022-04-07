USE sakila;
-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
SELECT
	COUNT(fc.film_id) AS 'number_of_films'
    ,fc.category_id
    ,c.name
FROM film_category fc
	JOIN category c ON c.category_id = fc.category_id
    GROUP BY fc.category_id
    ORDER BY number_of_films DESC
    ;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT
	SUM(p.amount) AS 'total_amount'
    ,s.staff_id
    ,s.first_name
    ,s.last_name
FROM payment p
	JOIN staff s ON s.staff_id = p.staff_id
    WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
    GROUP BY s.staff_id
    ;

-- 3. Which actor has appeared in the most films?
SELECT
	a.actor_id
	,a.first_name
    ,a.last_name
    ,COUNT(fa.film_id) AS 'amount_of_films'
FROM actor a
	JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id
ORDER BY amount_of_films DESC
;

-- 4.Most active customer (the customer that has rented the most number of films)
SELECT
	c.customer_id
	,c.first_name
    ,c.last_name
    ,COUNT(r.customer_id) AS 'amount_of_rents'
FROM rental r
	JOIN customer c ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY amount_of_rents DESC
;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT
	s.first_name
    ,s.last_name
    ,a.address
    ,a.address2
    ,a.district
    ,a.postal_code
    ,c.city
FROM staff s	
	JOIN address a ON a.address_id = s.address_id
    JOIN city c ON c.city_id = a.city_id
    ;

-- 6. List each film and the number of actors who are listed for that film.
SELECT
	f.title
    ,COUNT(a.actor_id) AS 'number_of_listed_actors'
FROM film f
	LEFT JOIN film_actor a ON a.film_id = f.film_id
    GROUP BY f.film_id
    ORDER BY number_of_listed_actors DESC
    ;
    
-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT
	c.customer_id
    ,c.last_name
    ,c.first_name
    ,SUM(p.amount) AS 'total_paid'
FROM customer c
	JOIN payment p ON p.customer_id = c.customer_id
    GROUP BY c.customer_id
    ORDER BY c.last_name
    ;

-- 8. List number of films per category.
SELECT
	COUNT(fc.film_id) AS 'number_of_films'
    ,fc.category_id
    ,c.name
FROM film_category fc
	JOIN category c ON c.category_id = fc.category_id
    GROUP BY fc.category_id
    ORDER BY number_of_films DESC
    ;
    