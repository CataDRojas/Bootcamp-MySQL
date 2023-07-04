/*Consulta 1*/
SELECT 
    c.name, l.language, l.percentage
FROM
    countries c
        JOIN
    languages l ON l.country_id = c.id
WHERE
    l.language = 'Slovene'
ORDER BY l.percentage DESC;

/*Consulta 2*/
SELECT 
    c.name, COUNT(ci.id) total_cities
FROM
    countries c
        JOIN
    cities ci ON ci.country_id = c.id
GROUP BY c.name
ORDER BY total_cities DESC;

/*Consulta 3*/
SELECT 
    c.name, c.population, c.country_id
FROM
    cities c
WHERE
    c.country_id = 136
        AND c.population > 500000
ORDER BY c.population DESC;

/*Consulta 4*/
SELECT 
    c.name, l.language, l.percentage
FROM
    countries c
        JOIN
    languages l ON l.country_id = c.id
WHERE
    l.percentage >= 89
ORDER BY l.percentage DESC;

/*Consulta 5*/
SELECT 
    name, surface_area, population
FROM
    countries
WHERE
    surface_area < 501
        AND population > 100000;

/*Consulta 6*/
SELECT 
    name, government_form, capital, life_expectancy
FROM
    countries
WHERE
    government_form = 'Constitutional Monarchy'
        AND capital > 200
        AND life_expectancy > 75;

/*Consulta 7*/
SELECT 
    c.name country_name,
    ci.name city_name,
    ci.district,
    ci.population
FROM
    countries c
        JOIN
    cities ci ON ci.country_id = c.id
WHERE
    c.id = 9
        AND ci.district = 'Buenos Aires'
        AND ci.population > 500000;

/*Consulta 8*/
SELECT 
    region, COUNT(id) countries
FROM
    countries
GROUP BY region
ORDER BY countries DESC;


