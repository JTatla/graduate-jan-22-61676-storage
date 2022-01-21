-- Challenge Day 3

-- 1. Select the American directors ordered from oldest to youngest.
SELECT * 
FROM directors 
WHERE nationality = 'American' 
ORDER BY date_of_birth;
-- returns 16 rows

-- 2. Return the distinct nationalities from the directors table.
SELECT DISTINCT nationality 
FROM directors;
-- returns 11 rows

-- 3. Return the first names, last names and date of births of the 10 youngest female actors.
SELECT first_name, last_name, date_of_birth 
FROM actors 
WHERE gender = 'F' 
ORDER BY date_of_birth DESC 
LIMIT 10;
-- returns 10 rows
-- Could also include 'AND date_of_birth IS NOT NULL'

-- 4. Return the top 3 movies with the highest international takings.
SELECT movie_name, international_takings  
FROM movies 
NATURAL JOIN movie_revenues 
WHERE international_takings IS NOT NULL 
ORDER BY international_takings DESC 
LIMIT 3;
-- returns 3 rows
-- Could also use * instead

-- 5. Concatenate the first and last names of the directors spearated by a space, and call this new column full_name.
SELECT first_name || ' ' || last_name AS full_name 
FROM directors;
-- returns 37 rows
-- Could also alter table permanently

-- 6. Return the actors with missing first_names or date_of_births.
SELECT * 
FROM actors 
WHERE first_name IS NULL OR date_of_birth IS NULL;
-- returns 2 rows

-- 7. Count the number of actors born after the 1st January 1970.
SELECT COUNT(*) 
FROM actors 
WHERE date_of_birth > '1970-01-01';
-- returns 1 row (55)

-- 8. What was the highest and lowest domestic takings for a movie.
SELECT MIN(domestic_takings) AS "Domestic Takings Range" 
FROM movie_revenues 
UNION 
SELECT MAX(domestic_takings) 
FROM movie_revenues;
-- returns 2 rows (0.3, 659.2)
SELECT MAX(domestic_takings), MIN (domestic_takings) 
FROM movie_revenues;
-- returns 1 row (0.3, 659.2), much simpler

-- 9. What is the sum total movie length for movies rated 15.
SELECT SUM(movie_length) 
FROM movies 
WHERE age_certificate = '15';
-- returns 1 row (2184)

-- 10. How many Japanese directors are in the directors table.
SELECT COUNT(*) 
FROM directors 
WHERE nationality = 'Japanese';
--return 1 row (3)

-- 11. What is the average movie length for chinese movies.
SELECT AVG(movie_length) 
FROM movies 
WHERE movie_lang = 'Chinese';
-- return 1 row (121.8)

-- 12. How many directors are there per nationality?
SELECT nationality, COUNT(*) 
FROM directors 
GROUP BY nationality;
-- return 11 rows

-- 13. What is the sum total movie_length for each age certificate and movie language combination?
SELECT movie_lang, age_certificate, SUM(movie_length) 
FROM movies 
GROUP BY movie_lang, age_certificate 
ORDER BY movie_lang, age_certificate;
-- returns 15 rows

-- 14. Return the movie languages which have a sum total movie length of over 500 minutes.
SELECT movie_lang 
FROM movies 
GROUP BY movie_lang 
HAVING SUM(movie_length) > 500;
-- returns 2 rows (English, Chinese)

-- 15. Select the directors first and last names, the movie names, and release dates for all Chinese, Korean, and Japanese movies.
SELECT first_name, last_name, movie_name, release_date 
FROM movies 
NATURAL JOIN directors 
WHERE movie_lang IN ('Chinese', 'Korean', 'Japanese');
-- returns 10 rows

-- 16. Select the movie names, release dates & international takings of all English language movies.
SELECT movie_name, release_date, international_takings 
FROM movies 
NATURAL JOIN movie_revenues 
WHERE movie_lang = 'English';
-- returns 38 rows

-- 17. Select the movie names, domestic takings and international takings for all movies 
--     with either missing domestic takings or missing international takings and order the results by movie name.
SELECT movie_name, domestic_takings, international_takings 
FROM movies 
NATURAL JOIN movie_revenues 
WHERE domestic_takings IS NULL OR international_takings IS NULL 
ORDER BY movie_name;
-- returns 16 rows

-- 18. Use left join to select the first and last names of all British directors 
--     and the names and age certificates of the movies that they directed.
SELECT first_name, last_name, movie_name, age_certificate 
FROM directors 
LEFT JOIN movies USING (director_id) 
WHERE nationality = 'British';
-- returns 7 rows

-- 19. Count the number of movies that each director has directed.
SELECT first_name || ' ' || last_name AS full_name, COUNT(movie_id) 
FROM directors 
NATURAL JOIN movies 
GROUP BY director_id;
-- returns 37 rows

-- 20. Select the first names, last names and dates of birth from directors & actors table. Order the result by the date of birth.
SELECT first_name, last_name, date_of_birth 
FROM directors 
UNION 
SELECT first_name, last_name, date_of_birth 
FROM actors;
-- returns 182 rows

-- 21. Select the first and last names of all directors and actors born in the 1960s. Order the result by last name.
SELECT first_name, last_name 
FROM directors 
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31' 
UNION 
SELECT first_name, last_name 
FROM actors 
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31' 
ORDER BY last_name;
-- returns 40 rows