--Write a SQL query to count the number of characters except the spaces for each actor.
 Return first 10 actors name length along with their name;

select concat(first_name,' ',last_name)as full_name,length(concat(first_name,last_name))as num_char
from actor;

select actor_id,concat(first_name,'  ',last_name) as full_name,
length(concat(first_name,last_name)) as name_length
from actor where actor_id<=10;


--List all Oscar awardees(Actors who received Oscar award)
 with their full names and length of their names;

select concat(first_name,' ',last_name)as full_name,
length(concat(first_name,last_name))as full_length
from actor_award where awards='oscar';


--Find the actors who have acted in the film ‘Frost Head’;

select distinct concat(actor.first_name,'  ',actor.last_name) as full_name,film.title
from actor inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film_actor.film_id=film.film_id
where title ='frost head';



--Pull all the films acted by the actor ‘Will Wilson’;

select distinct concat(actor.first_name,'  ',actor.last_name) as full_name,film.title
from actor inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film_actor.film_id=film.film_id
where first_name like'wi%' and last_name like 'wi%';


--Pull all the films which were rented and return in the month of May;

select distinct film.title,rental.rental_date,rental.return_date
from film 
inner join inventory on film.film_id=inventory.film_id
inner join rental on inventory.inventory_id=rental.inventory_id
where monthname(rental_date)='may'
and monthname(return_date)='may';


--Pull all the films with ‘Comedy’ category;

select distinct film.title films,category.name movie_type
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where category.name = 'Comedy';

