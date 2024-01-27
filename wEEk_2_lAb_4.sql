# How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.name as CATEGORY, count(fc.film_id) as NUMBER_OF_FILMS
from sakila.category as c
join sakila.film_category as fc
on fc.category_id = c.category_id
group by fc.category_id
order by NUMBER_OF_FILMS desc;

# Display the total amount rung up by each staff member in August of 2005.
select s.first_name as FIRST_NAME, s.last_name as LAST_NAME, sum(p.amount) as AMOUNT_RUNG_AUGUST_2005
from sakila.staff as s
join sakila.payment as p
on s.staff_id = p.staff_id
where p.payment_date like "2005-05%"
group by s.staff_id
order by s.staff_id;

# Which actor has appeared in the most films?
select a.first_name as FIRST_NAME, a.last_name as LAST_NAME, count(fa.film_id) as NUMBER_OF_FILMS
from sakila.actor as a
join sakila.film_actor as fa
on a.actor_id = fa.actor_id
group by a.actor_id
order by NUMBER_OF_FILMS desc;


# Most active customer (the customer that has rented the most number of films)
select c.first_name as FIRST_NAME, c.last_name as LAST_NAME, count(r.rental_date) as RENTED_FILMS
from sakila.customer as c
join sakila.rental as r
on c.customer_id = r.customer_id
group by c.customer_id
order by RENTED_FILMS desc;

# Display the first and last names, as well as the address, of each staff member.
select s.first_name as FIRST_NAME, s.last_name as LAST_NAME,  a.address as ADDRESS
from sakila.staff as s
join sakila.address as a
on s.address_id = a.address_id
group by s.staff_id
order by s.first_name;

# List each film and the number of actors who are listed for that film.
select f.title as FILM, sum(fa.actor_id) as NUMBER_OF_ACTORS
from sakila.film as  f
join sakila.film_actor as fa
on f.film_id = fa.film_id
group by fa.film_id
order by fa.film_id;

# Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.first_name as FIRST_NAME, c.last_name as LAST_NAME, sum(p.amount) as TOTAL_PAID
from sakila.customer as c
join sakila.payment as p
on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name;

# List the titles of films per category.
select f.title as FILM_TITLE, c.name as FILM_CATEGORY
from sakila.film_category as fc
join sakila.film as f
on fc.film_id = f.film_id
join sakila.category as c
on c.category_id = fc.category_id
order by c.name;