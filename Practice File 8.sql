use world;

select Continent,avg(Pop) over(partition by Continent) from 
(select sum(population) Pop ,Continent from country
group by Continent)a;

select c.name,cl.language from country c
join countrylanguage cl
on c.Code=cl.countrycode
where c.continent="Europe" and cl.language='french';

select Name,Continent,max(Pop) over(partition by Continent) from 
(select max(population) Pop ,Continent,name from country
group by Continent)a;

SELECT 
    c.continent, name, c.population
FROM
    country c
        JOIN
    (SELECT 
        continent, MAX(population) AS pop
    FROM
        country
    GROUP BY continent) AS a ON c.continent = a.continent
        AND c.population = a.pop
GROUP BY c.continent
ORDER BY 3 DESC;

use sakila;
select
case
    when c.name like '%doc%' or c.name like '%family%' or c.name like '%sports%' then 'Actual Incidents'
	when c.name like '%fore%' or c.name like '%feminism%' then 'Political Issues'
    when c.name like '%horror%' or c.name like '%drama%' then 'Mystery'
    when c.name like '%sci-fi%' or c.name like '%animation%' or c.name like '%travel%' then 'Fiction'
end as 'Movie_Category',
sum(p.amount) as 'Total Revenue Amount' from category c 
join film_category fa on fa.category_id=c.category_id
join inventory i on i.film_id=fa.film_id
join rental r on r.inventory_id=i.inventory_id
join payment  p on p.rental_id=r.rental_id
group by Movie_Category
order by 1 desc ;