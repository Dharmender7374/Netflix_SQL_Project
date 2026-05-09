-- 15 Business Problems & Solutions

-- 1.Count the number of Movies vs TV Show.
SELECT 
	type,COUNT(*) AS total_content
FROM netflix
GROUP BY type;


-- 2.Find the most common rating for movies and TV Show.
SELECT type,rating,common_rating
FROM(
SELECT type,rating,COUNT(*) AS common_rating,RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS rnk 
FROM netflix
GROUP BY type,rating
) AS t1
WHERE rnk = 1;

-- 3.List all movies released in a specific year(e.g 2020).


SELECT title,release_year
FROM netflix
WHERE type = 'Movie' 
	AND release_year = 2020
ORDER BY title ASC;

-- 4.Find the top 5 Countries with the most content on netflix.
SELECT * FROM netflix;

SELECT 
    TRIM(UNNEST(STRING_TO_ARRAY(country, ','))) AS country,
    COUNT(show_id) AS total_content
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;

--5.Identify the longest movie and TV show duration.

SELECT *
FROM (
    SELECT 
        type,
        title,
        duration,
        RANK() OVER(
            PARTITION BY type
            ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INT) DESC
        ) AS rnk
    FROM netflix
    WHERE duration IS NOT NULL
) t
WHERE rnk = 1;

--6.Find content added in the last 5 years.

SELECT *
FROM netflix
WHERE date_added IS NOT NULL
AND TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';


--7.Find all the movies/TV shows by director 'Rajiv Chilaka'.
SELECT type,director
FROM netflix
WHERE type IN ('Movie','TV Show')
AND director ILIKE '%Rajiv Chilaka%';


-- 8.List all TV show with more than 5 seasons.

SELECT title, type, duration
FROM netflix
WHERE type = 'TV Show'
AND CAST(SPLIT_PART(duration, ' ', 1) AS INT) > 5
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INT) DESC;

--cte VERSION

WITH show_data AS (
    SELECT 
        title,
        type,
        duration,
        CAST(SPLIT_PART(duration, ' ', 1) AS INT) AS seasons
    FROM netflix
    WHERE type = 'TV Show'
)

SELECT *
FROM show_data
WHERE seasons > 5
ORDER BY seasons DESC;

-- 9.Count the number of content items in each genre.

SELECT UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1;


"""10.Find each year and the average numbers of content release in india on netflix
return top 5 year with highest avg content release."""

SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
    COUNT(*) AS total_content
FROM netflix
WHERE country = 'India'
AND date_added IS NOT NULL
GROUP BY 1
ORDER BY total_content DESC
LIMIT 5;
	
--With Percentage
SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD, YYYY')) AS year,
    COUNT(*) AS yearly_content,
    ROUND(
        COUNT(*)::numeric /
        (SELECT COUNT(*) 
         FROM netflix 
         WHERE country = 'India') * 100,
    2) AS percentage_contribution
FROM netflix
WHERE country = 'India'
AND date_added IS NOT NULL
GROUP BY 1
ORDER BY percentage_contribution DESC
LIMIT 5;

-- 11.List all movies that are documentries.

SELECT type,listed_in
FROM netflix
WHERE type = 'Movie' AND listed_in ILIKE '%documentaries%';

-- 12.Find all content without a director.
SELECT show_id, title
FROM netflix
WHERE director IS NULL
   OR director = '';


13.Find how many movies actor 'Salman Khan' appeared in last 10 years!.
SELECT 
    title,
    release_year,
    country
FROM netflix
WHERE type = 'Movie'
  AND casts ILIKE '%Salman Khan%'
  AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10
ORDER BY release_year DESC;


14.Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT 
UNNEST(STRING_TO_ARRAY(casts,',')) AS Actors,
COUNT(*) AS total_content
FROM netflix
WHERE country ILIKE '%india%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.

WITH new_table
AS
(
SELECT *,
	CASE
	WHEN description ILIKE '%kill%' OR
	     description ILIKE '%violence%' THEN 'Bad_Content'
		 ELSE 'Good Content'
	END category
FROM netflix
)
SELECT 
	category,
	COUNT(*) AS total_content
FROM new_table
GROUP BY 1;





