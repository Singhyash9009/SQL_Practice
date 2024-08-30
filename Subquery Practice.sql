use world;

select Language from countrylanguage where CountryCode=( select code from country where Name='FINLand');

select Name, 100*(Population/(select Sum(population) from country)) PCT_OF_WORLD_POP from Country;

select co.Name,count(c.district) Cities, count(cl.Language) Languages from Country co join
countrylanguage cl on cl.CountryCode=co.Code
join city c on c.CountryCode= co.Code
group by co.Name;

SELECT 
    Name,
    (SELECT 
            COUNT(district)
        FROM
            city
        WHERE
            countrycode = code) Cities,
    (SELECT 
            COUNT(language)
        FROM
            countrylanguage
        WHERE
            countrycode = code) Languages
FROM
    Country;
    
select Continent,round(avg(Pop) over(partition by  Continent order by Pop desc),2) Average_pop_Cont from 
(select Continent,sum(Population) as Pop from Country group by Continent) a;

select * from city where countrycode in( select code from country where continent='Asia');
select * from city where countrycode in( select code from country where countrycode='IND');

-- giving country name where city name is same
SELECT 
    *
FROM
    city
WHERE
    (countrycode , Name) IN (SELECT 
            code, Name
        FROM
            country
        WHERE
            continent = 'Asia');

select * from city where exists ( select capital from country where capital=id);

-- remove all and see gives one row if provide all checks everytime and return multiple rows
select * from country where population > all (select population from city);
