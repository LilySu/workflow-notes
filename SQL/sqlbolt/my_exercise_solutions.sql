-- 6-
SELECT movies.title,
       boxoffice.domestic_sales,
       boxoffice.international_sales
FROM   movies
       INNER JOIN boxoffice
               ON movies.id = boxoffice.movie_id;

SELECT movies.title,
       boxoffice.domestic_sales,
       boxoffice.international_sales
FROM   movies
       INNER JOIN boxoffice
               ON movies.id = boxoffice.movie_id
WHERE  boxoffice.domestic_sales < boxoffice.international_sales;

SELECT movies.title,
       boxoffice.domestic_sales,
       boxoffice.international_sales
FROM   movies
       INNER JOIN boxoffice
               ON movies.id = boxoffice.movie_id
ORDER  BY boxoffice.rating DESC;

-- 7
SELECT employees.building
FROM   employees
       INNER JOIN buildings
               ON buildings.building_name = employees.building
GROUP  BY building;

SELECT *
FROM   buildings;

SELECT DISTINCT building_name,
                role
FROM   buildings
       LEFT JOIN employees
              ON building_name = building;

-- 8
SELECT employees.NAME,
       employees.role
FROM   employees
WHERE  employees.building IS NULL;

----
SELECT DISTINCT buildings.building_name,
                employees.role
FROM   buildings
       LEFT JOIN employees
              ON buildings.building_name = employees.building;

-- 9 - Tasks
-- List all movies and their combined sales in millions of dollars
SELECT title,
       Cast(( domestic_sales + international_sales ) / 1000000 AS MILLIONS) AS
       combined_sales
FROM   movies
       LEFT JOIN boxoffice
              ON movies.id = boxoffice.movie_id;

SELECT title,
       Cast(rating * 10 AS VARCHAR(100)) + '%' AS Percent_Rating
FROM   movies
       LEFT JOIN boxoffice
              ON movies.id = boxoffice.movie_id;

SELECT title,
       year
FROM   movies
       LEFT JOIN boxoffice
              ON movies.id = boxoffice.movie_id
WHERE  year % 2 = 0;

-- 10
SELECT Max(years_employed)
FROM   employees;

SELECT role,
       Avg(years_employed)
FROM   employees
GROUP  BY role;

SELECT building,
       Sum(years_employed)
FROM   employees
GROUP  BY building;

-- 11
-- The HAVING clause constraints are written the same way as the WHERE clause constraints, and are applied to the grouped rows. With our examples, this might not seem like a particularly useful construct, but if you imagine data with millions of rows with different properties, being able to apply additional constraints is often necessary to quickly make sense of the data.
SELECT Count(*)
FROM   employees
WHERE  role = 'Artist';

SELECT role,
       Count(*)
FROM   employees
GROUP  BY role;

SELECT Sum(years_employed)
FROM   employees
WHERE  role = 'Engineer';

-- 12
SELECT director,
       Count(*)title
FROM   movies
GROUP  BY director;

SELECT director,
       Sum(domestic_sales)
       + Sum(international_sales) AS total_sales
FROM   movies
       LEFT JOIN boxoffice
              ON id = movie_id
GROUP  BY director;

-- 13
INSERT INTO movies
            (title,
             director,
             year,
             length_minutes)
VALUES      ('Toy Story 4',
             'John Lasseter',
             2000,
             92);

INSERT INTO movies
            (title,
             director,
             year,
             length_minutes)
VALUES      ('Toy Story 4',
             'John Lasseter',
             2000,
             92);