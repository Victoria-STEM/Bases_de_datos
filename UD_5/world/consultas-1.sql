USE world;

-- Consulta 1: Lista de ciudades con su país correspondiente
SELECT
    city.name,
    country.name 
FROM city
JOIN country ON city.CountryCode = country.code;

-- Consulta 2: Muestra las ciudades de Francia con su población
SELECT
    city.name,
    city.population,
    country.name 
FROM city
JOIN country ON city.CountryCode = country.code
WHERE country.code = "FRA";

-- Consulta 3: Lista de países y sus capitales
SELECT
    country.name,
    city.name
FROM country
JOIN city ON country.capital = city.id;

-- Consulta 4: Muestra el nombre de la ciudad y 
-- el distrito al que pertenece Y EL PAIS
SELECT
    city.name,
    city.district,
    country.name
FROM city
JOIN country ON city.countryCode = country.Code;

-- Consulta 6: Muestra los países y el idioma oficial 
-- que se habla en cada uno
SELECT
    country.name,
    countrylanguage.Language
From country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.IsOfficial = "T";

-- Consulta 7: Lista de ciudades junto con el idioma oficial de su país
SELECT
    city.name,
    countrylanguage.Language
FROM city
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = "T";

-- Consulta 8: Muestra el nombre del país y 
-- la cantidad de ciudades que tiene registradas
SELECT
    country.name,
    COUNT(city.name) AS numero_ciudades
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.name;

-- Consulta 9: Muestra los países que tienen más de 5 ciudades registradas
SELECT
    country.name,
    COUNT(city.name) AS numero_ciudades
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.name
HAVING COUNT(city.name) > 5;

-- Consulta 10: Lista de ciudades con su país e idioma principal
SELECT
    city.name,
    country.name,
    countrylanguage.language 
FROM city
JOIN country ON city.CountryCode = country.Code
JOIN countrylanguage ON country.code = countrylanguage.CountryCode
WHERE IsOfficial = "T";


-- EJ71 - MUESTRA UNA LISTA DE LAS CIUDADES DE ESPAÑA, 
-- SU POBLACIÓN, LA POBLACIÓN DEL PAÍS Y 
-- EL PORCENTAJE DE POBLACIÓN DEL PAÍS QUE VIVE EN ESA CIUDAD (2 DECIMALES)
SELECT 
    city.name AS city_name,
    city.Population AS city_population,
    country.Population AS country_population,
    ROUND((city.Population * 100) / country.Population, 2) AS porcentaje_ciudad
FROM city
JOIN country ON city.CountryCode = country.code
WHERE country.name = "Spain";


-- EJ72 - MUESTRA UNA LISTA DE LOS DISTRITOS DE ESPAÑA, SU POBLACIÓN, 
-- LA POBLACIÓN DEL PAÍS Y EL PORCENTAJE DE POBLACIÓN DEL PAÍS QUE VIVE EN ESE DISTRITO 
-- (2 DECIMALES).
SELECT
    city.district,
    sum(city.population) as POBLACION_DISTRITO,
    MAX(country.Population),
    ROUND(sum(city.Population) / max(COUNTRY.Population) * 100, 2) AS poblacion_distrito
FROM city
JOIN country ON city.CountryCode = country.code
WHERE country.NAME = "SPAIN"
GROUP BY city.District;

-- EJ73 - MUESTRA UNA LISTA DE LOS NOMBRES DE LAS CAPITALES EUROPEAS.
SELECT
    CITY.NAME
FROM COUNTRY
JOIN CITY ON COUNTRY.CODE = CITY.CountryCode
WHERE COUNTRY.Continent = "europe";

-- EJ74 - ¿CUÁL ES LA CAPITAL DEL MUNDO MÁS POBLADA?
-- NO SALE
SELECT
    city.name
from city
JOIN country ON city.id = country.capital
ORDER BY city.Population DESC
LIMIT 1;

-- EJ75 - MUESTRA UNA LISTA CON EL NOMBRE DE LOS PAÍSES Y 
-- LA CANTIDAD DE IDIOMAS QUE SE HABLAN EN DICHO PAÍS.
SELECT
    country.name,
    COUNT(countrylanguage.Language) as numero_idiomas
from country
JOIN countrylanguage on country.code = countrylanguage.countrycode
group BY country.name;

-- EJ76 - MUESTRA UNA LISTA CON EL NOMBRE DE LOS PAÍSES Y LA CANTIDAD DE IDIOMAS OFICIALES QUE SE HABLAN EN DICHO PAÍS.
SELECT
    country.name,
    COUNT(countrylanguage.Language) as numero_idiomas
FROM country
JOIN countrylanguage on country.code = countrylanguage.countrycode
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY country.name;

-- EJ77 - MUESTRA UNA LISTA CON EL NOMBRE DE TODOS LOS PAÍSES Y 
-- LA CANTIDAD DE CIUDADES DE CADA PAÍS DISPONIBLES EN LA BASE DE DATOS.
SELECT
    country.name,
    COUNT(city.id) AS numero_ciudades 
FROM country 
JOIN city ON country.code = city.CountryCode
GROUP BY country.name;

-- EJ78 - MUESTRA EL NOMBRE DE LOS PAÍSES SIN CIUDADES REGISTRADAS.
SELECT
    country.name
FROM country
JOIN city ON country.code = city.CountryCode
GROUP BY country.name
WHERE COUNT(city.name) = 0;

-- EJ79 - MUESTRA UNA LISTA CON EL NOMBRE DE LOS PAÍSES, LOS IDIOMAS HABLADOS Y LA CANTIDAD DE PERSONAS QUE HABLAN CADA IDIOMA EN CADA PAÍS.

-- EJ80 - MUESTRA UNA LISTA CON EL NOMBRE DE LA CAPITAL DE LOS PAÍSES CON ESPAÑOL COMO IDIOMA OFICIAL.

-- EJ81 - MUESTRA EL PORCENTAJE DE LA POBLACIÓN MUNDIAL QUE HABLA ESPAÑOL.

-- EJ82 - MUESTRA UNA LISTA CON LOS IDIOMAS Y EL PORCENTAJE DE LA POBLACIÓN MUNDIAL QUE HABLA CADA IDIOMA (ORDENA DE MAYOR A MENOR).

-- EJ83 - MUESTRA TODAS LAS CIUDADES QUE NO SON CAPITALES.