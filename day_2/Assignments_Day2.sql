-- Assignments Day 2

-- 1. Select the movie_name & release_date of every movie.
SELECT movie_name, release_date FROM movies;
-- returns 53 rows

-- 2. Select the first and last names of all American directors.
SELECT first_name, last_name FROM directors 
WHERE nationality = 'American';
-- returns 16 rows

-- 3. Select all male actors born after the 1st of January 1970.
SELECT * FROM actors 
WHERE gender = 'M' AND date_of_birth > '1970-01-01';
-- returns 31 rows

-- 4. Select the names of all movies which are over 90 minutes long and movie language is English.
SELECT movie_name FROM movies 
WHERE movie_length > 90 AND movie_lang = 'English';
-- returns 37 rows

-- 5. Select the movie names & movie language of all movies with a movie language of English, Spanish, or Korean.
SELECT movie_name, movie_lang FROM movies 
WHERE movie_lang IN ('English', 'Spanish', 'Korean');
-- returns 40 rows

-- 6. Select the first and last names of the actors whose last name begins with M and were born between 01/01/1940 and 31/12/1969.
SELECT first_name, last_name FROM actors 
WHERE (last_name LIKE 'M%') AND (date_of_birth BETWEEN '1940-01-01' AND '1969-12-31');
-- returns 6 rows

-- 7. Select the first and last names of the directors with natioanlity of British, French or German born between 01/01/1950 and 31/12/1980.
SELECT first_name, last_name FROM directors 
WHERE (nationality IN ('British', 'French', 'German')) AND (date_of_birth BETWEEN '1950-01-01' AND '1980-12-31');
-- returns 4 rows