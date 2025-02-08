USE world;

-- EJ55: MUESTRA LA ESPERANZA DE VIDA MEDIA POR CONTINENTE
SELECT 
    Continent,
    AVG(LifeExpectancy) AS esperanza_media_continente
FROM country
GROUP BY Continent;

-- EJ56: MUESTRA LAS REGIONES Y LA SUPERFICIE TOTAL DE CADA REGIÓN
SELECT
    region,
    SUM(SurfaceArea) AS superficie_total
FROM country
GROUP BY region;

-- EJ57: MUESTRA EL AÑO DE INDEPENDENCIA PROMEDIO DE CADA CONTINENTE 
-- (SIN TENER EN CUENTA VALORES NULOS)
SELECT
    continent,
    AVG(IndepYear) AS independencia_media
FROM country
GROUP BY Continent
HAVING AVG(IndepYear) IS NOT NULL;

-- EJ58: MUESTRA LOS DISTRITOS DE ESPAÑA (TABLA CITY) 
-- Y LA POBLACIÓN TOTAL DE CADA UNO
SELECT
    district, 
    SUM(population)
from city
GROUP BY District
HAVING countrycode = 'ESP';

-- EJ59: SUMA EL PORCENTAJE TOTAL DE TODOS LOS IDIOMAS AGRUPANDO POR PAÍS
SELECT
    CountryCode,
    SUM(percentage) AS porcentaje_idiomas
from countrylanguage
group by countrycode;

-- EJ60: MUESTRA EL NOMBRE DE LAS REGIONES CON MÁS DE 10 MILLONES DE HABITANTES
SELECT
    region,
    SUM(population) AS poblacion_regiones
FROM country
GROUP BY Region
HAVING sum(Population) > 10000000;

-- EJ61: MUESTRA EL NOMBRE DE LAS REGIONES DE ASIA Y AMÉRICA CON MÁS 
-- DE 100 MILLONES DE HABITANTES
SELECT
    region As regiones,
    sum(Population)
from country
where continent = 'Asia' 
    OR continent = 'South America' 
    OR continent = 'North America'
group by Region
having SUM(population) > 100000000;

-- EJ62: MUESTRA LOS DISTRITOS DE EUROPA CON MÁS DE 3 MILLONES 
-- DE HABITANTES (TABLA CITY)
SELECT
    city.district
from city
where country.continent = 'Europe'
group by city.District
having sum(city.Population) > 3000000
inner join country on city.CountryCode = country.Code;

-- EJ63: MUESTRA UNA LISTA DE LOS CONTINENTES Y CUÁNTOS PAÍSES 
-- HAY EN CADA CONTINENTE
select
    continent,
    count(code) as numer_paises
from country
group by continent;

-- EJ64: MUESTRA UNA LISTA DE LAS REGIONES Y CUÁNTOS PAÍSES 
-- HAY EN CADA REGIÓN
select
    Region,
    count(code) AS numero_paises
from country
group by region; 