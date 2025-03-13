USE world;

-- Actualización de registros (UPDATE)

-- 1. Cambiar la soberanía de Gibraltar
-- Se asume que Gibraltar debe pasar a estar bajo la soberanía de España.
-- Actualiza el código de país en la tabla `country` de 'GIB' a 'ESP'.
UPDATE city
SET CountryCode = "ESP"
WHERE Name = "Gibraltar";


-- 2. Ajustar la población de Tokio
-- La ciudad de Tokio ha reportado un crecimiento demográfico.
-- Modifica su población en la tabla `city` para que sea de 15,000,000 habitantes.
UPDATE city
SET Population = 15000000
WHERE Name = "Tilburg";


-- 3. Cambio de nombre oficial de un país
-- Debido a una actualización en la nomenclatura internacional,
-- cambia el nombre del país 'Birmania' por 'Myanmar'.
UPDATE country
SET Name = "Imperio Chino"
WHERE Name = "China";

SELECT Name, CountryCode, Population, District FROM city WHERE Name = "Tokio";

-- 4. Corrección del distrito de Madrid
-- Se actualiza la información administrativa para reflejar correctamente
-- que Madrid pertenece a la 'Comunidad de Madrid'.
UPDATE city
SET District = "Comunidad de Madrid"
WHERE Name = "Madrid";

-- 5. Incremento de población en París
-- La ciudad de París ha experimentado un aumento poblacional del 10%.
-- Aplica este incremento sobre su población actual.
UPDATE city
SET Population = Population * 1.10 
WHERE Name = "París";

-- Eliminación de registros (DELETE)

-- 6. Eliminar a Francia de la base de datos
-- Se requiere la eliminación completa del país 'Francia' en la tabla `country`.
DELETE FROM country
WHERE Name = "Francia";

SELECT Name FROM country WHERE Name = "Francia";

-- 7. Borrar todas las ciudades de Italia
-- Se ha decidido eliminar toda la información relacionada con las ciudades italianas.
-- Se eliminan todas las ciudades cuyo código de país sea 'ITA'.
DELETE FROM city
WHERE CountryCode = "ITA";

-- 8. Eliminar el idioma Francés en Canadá
-- Por motivos administrativos, el idioma 'Francés' deja de estar registrado en Canadá.
DELETE FROM countrylanguage
WHERE CountryCode = (SELECT code from country WHERE Name = "Canadá")
AND Language = "Francés";

-- 9. Eliminar la ciudad de Londres
-- Se ha decidido eliminar la ciudad de 'Londres' de la base de datos en la tabla `city`.
DELETE FROM city
WHERE Name = "Londres";

-- 10. Eliminar países con baja población
-- Se requiere borrar todos los países cuya población sea menor a 100,000 habitantes.
DELETE FROM city
WHERE Population < 100000;

DELETE FROM countrylanguage
WHERE CountryCode IN (SELECT Code FROM country WHERE Population < 100000);

DELETE FROM country
WHERE Population < 100000;


--------------------------------------------------
SELECT population from country;
