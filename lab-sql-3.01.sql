### Activity 1

use sakila;

-- 1. Drop column `picture` from `staff`.
select * from staff;

Alter table sakila.staff
drop column picture ;


-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from sakila.customer;
select * from sakila.customer 
where first_name = 'TAMMY' and last_name = 'SANDERS';

select * from staff;

delete from staff 
where first_name = 'TAMMY';

insert into staff(first_name, last_name, address_id, email, store_id, active, username, password, last_update ) 
VALUES
('TAMMY','SANDERS', 79 , 'TAMMY.SANDERS@sakilacustomer.org', 1, 1, 'TAMMY', 'skkldfkslsll', now());

select * from sakila.staff;

-- (we can also remove tammy from customer)



-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the `rental_date` column in the `rental` table.
-- **Hint**: Check the columns in the table rental and see what information you would need to add there.
--  You can query those pieces of information. For eg., you would notice that you need `customer_id` information as well. 
-- To get that you can use the following query:
-- Use similar method to get `inventory_id`, `film_id`, and `staff_id`.

select * from sakila.customer;
select c.customer_id, c.store_id from sakila.customer c
join inventory i on c.store_id = i.store_id
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select * from inventory;

select * from store;

select * from rental;

select * from staff
where first_name = 'Mike' and last_name = 'Hillyer';
select f.film_id, f.title, s.store_id, i.inventory_id
from inventory i join store s on i.store_id = s.store_id
join film f on i.film_id = f.film_id
where f.title = 'Academy Dinosaur' and s.store_id = 1;

insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (now(), 1, 130, '2023-01-29 22:04:30', 1, now());

select * from rental
where customer_id = 130;



-