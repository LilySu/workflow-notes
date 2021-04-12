-- 2

SELECT title
FROM   movies
WHERE  id = 6;

SELECT title
FROM   movies
WHERE  year >= 2000
AND    year <= 2010;

SELECT title
FROM   movies
WHERE  year NOT BETWEEN 2000 AND    2010;SELECT title,
       year
FROM   movies
LIMIT  5;

-- 3

SELECT *
FROM   movies
WHERE  title LIKE '%Toy Story%';

SELECT *
FROM   movies
WHERE  director = 'John Lasseter';

SELECT *
FROM   movies
WHERE  director != 'John Lasseter';

SELECT *
FROM   movies
WHERE  title LIKE '%WALL-%';

-- 4

SELECT DISTINCT director
FROM            movies
ORDER BY        director;

SELECT   title
FROM     movies
ORDER BY year DESC
LIMIT    4;

SELECT   title
FROM     movies
ORDER BY title
LIMIT    5;

SELECT   title
FROM     movies
ORDER BY title
LIMIT    5
offset   5;

-- 5

SELECT city,
       population
FROM   north_american_cities
WHERE  country = 'Canada';SELECT   city
FROM     north_american_cities
WHERE    country = 'United States'
ORDER BY latitude DESC;

SELECT   city,
         longitude
FROM     north_american_cities
WHERE    longitude <
         (
                SELECT longitude
                FROM   north_american_cities
                WHERE  city = 'Chicago')
ORDER BY longitude ASC;

SELECT   city
FROM     north_american_cities
WHERE    country = 'Mexico'
ORDER BY population DESC
LIMIT    2;

SELECT   city
FROM     north_american_cities
WHERE    country = 'United States'
ORDER BY population DESC
LIMIT    2
OFFSET   2;

-- 6

SELECT     movies.title,
           boxoffice.domestic_sales,
           boxoffice.international_sales
FROM       movies
INNER JOIN boxoffice
ON         movies.id = boxoffice.movie_id;

SELECT     movies.title,
           boxoffice.domestic_sales,
           boxoffice.international_sales
FROM       movies
INNER JOIN boxoffice
ON         movies.id = boxoffice.movie_id
WHERE      boxoffice.domestic_sales < boxoffice.international_sales;

SELECT     movies.title,
           boxoffice.domestic_sales,
           boxoffice.international_sales
FROM       movies
INNER JOIN boxoffice
ON         movies.id = boxoffice.movie_id
ORDER BY   boxoffice.rating DESC;

-- 7

SELECT     employees.building
FROM       employees
INNER JOIN buildings
ON         buildings.building_name = employees.building
GROUP BY   building;

SELECT *
FROM   buildings;SELECT DISTINCT building_name,
                role
FROM            buildings
LEFT JOIN       employees
ON              building_name = building;

-- 8

SELECT employees.name,
       employees.role
FROM   employees
WHERE  employees.building IS NULL;

SELECT    *
FROM      buildings
LEFT JOIN employees
ON        buildings.building_name = employees.building
WHERE     name IS NULL;

SELECT DISTINCT buildings.building_name,
                employees.role
FROM            buildings
LEFT JOIN       employees
ON              buildings.building_name = employees.building;

-- 9 - Tasks
-- List all movies and their combined sales in millions of dollars

SELECT    title,
          cast(( domestic_sales + international_sales )
          / 1000000 AS millions)
          AS combined_sales
FROM      movies
LEFT JOIN boxoffice
ON        movies.id = boxoffice.movie_id;

SELECT    title,
          cast(rating * 10 AS varchar(100)) + '%' AS percent_rating
FROM      movies
LEFT JOIN boxoffice
ON        movies.id = boxoffice.movie_id;

SELECT    title,
          year
FROM      movies
LEFT JOIN boxoffice
ON        movies.id = boxoffice.movie_id
WHERE     year % 2 = 0;

-- 10

SELECT Max(years_employed)
FROM   employees;

-- or

SELECT   years_employed
FROM     employees
ORDER BY years_employed DESC
LIMIT    1;

SELECT   role,
         Avg(years_employed)
FROM     employees
GROUP BY role;

SELECT   building,
         Sum(years_employed)
FROM     employees
GROUP BY building;

-- 11
-- The HAVING clause constraints are written the same way as the WHERE clause constraints, and are applied to the grouped rows. With our examples, this might not seem like a particularly useful construct, but if you imagine data with millions of rows with different properties, being able to apply additional constraints is often necessary to quickly make sense of the data.

SELECT Count(*)
FROM   employees
WHERE  role = 'Artist';SELECT   role,
         Count(*)
FROM     role
GROUP BY role;SELECT Sum(years_employed)
FROM   employees
WHERE  role = 'Engineer';

-- 12

SELECT   director,
         Count(*)title
FROM     movies
GROUP BY director;

-- or

SELECT     movies.director,
           Count(boxoffice.movie_id) AS number_of_movies
FROM       movies
INNER JOIN boxoffice
ON         movies.id = boxoffice.movie_id
GROUP BY   movies.director;

SELECT    director,
          Sum(domestic_sales) + Sum(international_sales) AS total_sales
FROM      movies
LEFT JOIN boxoffice
ON        id = movie_id
GROUP BY  director;


-- 13

INSERT INTO movies
    (
                title,
                director,
                year,
                length_minutes
    )
    VALUES
    (
                'Toy Story 4',
                'John Lasseter',
                2000,
                92
    );

INSERT INTO boxoffice
    (
                movie_id,
                rating,
                domestic_sales,
                international_sales
    )
    VALUES
    (
                4,
                8.7,
                340000000,
                270000000
    );

-- 14

UPDATE movies
SET    director = "john lasseter"
WHERE  title = "a bug's life";

UPDATE movies
SET    year = 1999
WHERE  title = "toy story 2";

UPDATE movies
SET    title = "toy story 3",
       director = "lee unkrich"
WHERE  title = "toy story 8";

-- 15

DELETE FROM   movies
WHERE  year < 2005;DELETE
FROM   movies
WHERE  director = "Andrew Stanton"

--16

create TABLE DATABASE
    (
                id INTEGER PRIMARY KEY,
                name text,
                version FLOAT,
                download_count INTEGER
    );

-- 17

ALTER TABLE movies
ADD aspect_ratio
FLOAT optionaltableconstraint
DEFAULT default_value;

ALTER TABLE movies ADD
language text optionaltableconstraint
DEFAULT english;

-- 18

DROP TABLE  movies;
DROP TABLE  boxoffice;