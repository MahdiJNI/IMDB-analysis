use imdb;


--  grouping movies by year to see how many movies are in the list on each year
select count(movie_name) as movie_count, release_year
from imdb_cleaned_using_python
group by release_year
order by movie_count desc;


-- partitioning to have a visually better understanding of the results
select movie_rank, movie_name, release_year,
count(release_year) over (partition by release_year) as same_release_year_movie_count
from imdb_cleaned_using_python
order by movie_rank asc;


-- grouping movies by the season they were released to find out which season has the most movies
select count(movie_name) as movie_count, release_season
from imdb_cleaned_using_python
group by release_season
order by movie_count desc;


-- partitioning to see how many movies have the same rates
select movie_rank, movie_name, release_year, imdb_rate,
 count(imdb_rate) over (partition by imdb_rate) as rates
 from imdb_cleaned_using_python
 order by imdb_rate asc;


-- top 10 movies with the longest durations
select movie_rank, movie_name, duration_in_minute
from imdb_cleaned_using_python
order by duration_in_minute desc
limit 10;


-- to see all movies duration on each other in each season !!!  it's funny anyway
select sum(duration_in_minute) as movies_minutes_sum, release_season
from imdb_cleaned_using_python
group by release_season
order by movies_minutes_sum desc;


-- to see age group ratings from years ago to thesedays to find out age groups trends in the list
select movie_rank, movie_name, release_year, age_group_rate,
count(age_group_rate) over (partition by age_group_rate) as age_groups
from imdb_cleaned_using_python
order by age_group_rate asc;


select count(movie_name) as movie_count, age_group_rate
from imdb_cleaned_using_python
group by age_group_rate
order by movie_count asc;


-- to see the amount of counts for each imdb rate and to find out if there is any relation between the count amount and imdb rate
select sum(vote_count) as vote_count, imdb_rate
from imdb_cleaned_using_python
group by imdb_rate
order by vote_count desc;

-- to find top 10 of the best sellers based on release years
select sum(box_office) as box_office_sum, release_year
from imdb_cleaned_using_python
group by release_year
order by box_office_sum desc
limit 10;


-- to find out which release season has the highest sale in box office
select sum(box_office) as box_office_sum, release_season
from imdb_cleaned_using_python
group by release_season
order by release_season desc;


-- to see movies duration sum based on the imdb rates
select sum(duration_in_minute) as duration, imdb_rate
from imdb_cleaned_using_python
group by imdb_rate
order by duration desc;


-- to see imdb rate counts based on each age group rate
select count(imdb_rate) as ir, age_group_rate
from imdb_cleaned_using_python
group by age_group_rate;


-- to see the countries with the highest imdb rate
select max(imdb_rate) as rate, country
from imdb_cleaned_using_python
group by country
order by rate desc;


-- to see how many movies are there for each country
select count(movie_name) as movie_count, country
from imdb_cleaned_using_python
group by country
order by movie_count desc;


-- to see countries with the highest box office values in imdb
select sum(box_office) as box_office_sum, country
from imdb_cleaned_using_python
group by country
order by box_office_sum desc;


-- to see hom many movies are there in the list based on hte languages
select count(movie_name) as movie_count, language_
from imdb_cleaned_using_python
group by language_
order by movie_count desc;


-- to see how many records with specific rates are there for each language
select language_, imdb_rate,
count(imdb_rate) over (partition by imdb_rate) as rate
from imdb_cleaned_using_python
union
select language_, imdb_rate,
count(imdb_rate) over (partition by imdb_rate) as rate
from imdb_cleaned_using_python;


-- to find out how many release years are there for each genre
SELECT genre, COUNT(release_year) AS year_count
from (
SELECT movie_name, release_year, genre1 AS genre FROM imdb_cleaned_using_python
UNION
SELECT movie_name, release_year, genre2 AS genre FROM imdb_cleaned_using_python
UNION
SELECT movie_name, release_year, genre3 AS genre FROM imdb_cleaned_using_python
) as unified
GROUP BY genre
ORDER BY genre;


-- to see for each year how many of each genre exists in the table
SELECT release_year, genre, COUNT(*) AS genre_count
from (
SELECT movie_name, release_year, genre1 AS genre FROM imdb_cleaned_using_python
UNION
SELECT movie_name, release_year, genre2 AS genre FROM imdb_cleaned_using_python
UNION
SELECT movie_name, release_year, genre3 AS genre FROM imdb_cleaned_using_python
) as unified
GROUP BY release_year, genre
ORDER BY release_year, genre;


-- to see movies genres
SELECT movie_name, genre, COUNT(*) AS genre_count
from (
SELECT movie_name, genre1 AS genre FROM imdb_cleaned_using_python
UNION
SELECT movie_name, genre2 AS genre FROM imdb_cleaned_using_python
UNION
SELECT movie_name, genre3 AS genre FROM imdb_cleaned_using_python
) as unified
GROUP BY movie_name, genre
ORDER BY movie_name, genre;


-- to see genres count for each imdb rate
SELECT imdb_rate, genre, COUNT(*) AS genre_count
from (
SELECT imdb_rate, genre1 AS genre FROM imdb_cleaned_using_python
UNION
SELECT imdb_rate, genre2 AS genre FROM imdb_cleaned_using_python
UNION
SELECT imdb_rate, genre3 AS genre FROM imdb_cleaned_using_python
) as unified
GROUP BY imdb_rate, genre
ORDER BY imdb_rate, genre;


-- to see genres for age group rates
SELECT age_group_rate, genre, COUNT(*) AS genre_count
from (
SELECT age_group_rate, genre1 AS genre FROM imdb_cleaned_using_python
UNION
SELECT age_group_rate, genre2 AS genre FROM imdb_cleaned_using_python
UNION
SELECT age_group_rate, genre3 AS genre FROM imdb_cleaned_using_python
) as unified
GROUP BY age_group_rate, genre
ORDER BY age_group_rate, genre;


-- to see the average of movies duration for each year
select avg(duration_in_minute) as duration, release_year
from imdb_cleaned_using_python
group by release_year
order by release_year asc;


-- to see the average of movies duration for release season
select avg(duration_in_minute) as duration, release_season
from imdb_cleaned_using_python
group by release_season
order by duration desc;


-- to see the average of movies duration for each imdb rate
select avg(duration_in_minute) as duration, imdb_rate
from imdb_cleaned_using_python
group by imdb_rate
order by imdb_rate asc;


-- to see the average of movies duration for each age group
select avg(duration_in_minute) as duration, age_group_rate
from imdb_cleaned_using_python
group by age_group_rate
order by duration desc;


-- to see the average of movies duration for each language_
select avg(duration_in_minute)as duration, language_
from imdb_cleaned_using_python
group by language_
order by duration desc;


-- to see the average of movies duration for each country
select avg(duration_in_minute) as duration, country
from imdb_cleaned_using_python
group by country
order by duration desc;


-- to see the average of movies duration for each genre 
SELECT genre, 
       AVG(duration_in_minute) AS avg_duration
FROM (
    SELECT duration_in_minute, genre1 AS genre FROM imdb_cleaned_using_python
    UNION
    SELECT duration_in_minute, genre2 AS genre FROM imdb_cleaned_using_python
    UNION
    SELECT duration_in_minute, genre3 AS genre FROM imdb_cleaned_using_python
) AS unified
GROUP BY genre
ORDER BY avg_duration DESC;


-- to see the average of imdb rates for each release year
select round(avg(imdb_rate), 2) as rate, release_year
from imdb_cleaned_using_python
group by release_year
order by rate asc;


-- to see the average of movies imdb rate for each release season 
select round(avg(imdb_rate), 2) as rate, release_season
from imdb_cleaned_using_python
group by release_season
order by rate desc;

-- to see the average of movies imdb rate for each country 
select round(avg(imdb_rate), 2) as rate, country
from imdb_cleaned_using_python
group by country
order by rate desc;


-- to see the average of movies imdb rate for each language 
select round(avg(imdb_rate), 2) as rate, language_
from imdb_cleaned_using_python
group by language_
order by rate desc;


-- to see the average of movies imdb rate for each age group rate 
select round(avg(imdb_rate), 2) as rate, age_group_rate
from imdb_cleaned_using_python
group by age_group_rate
order by rate desc;


-- to see the average of box office for each imdb rate
select avg(box_office) as box_office, imdb_rate
from imdb_cleaned_using_python
group by imdb_rate
order by box_office desc;


-- to see the average of imdb rate for each genre
SELECT genre, 
       round(AVG(imdb_rate), 2) AS avg_rate
FROM (
    SELECT imdb_rate, genre1 AS genre FROM imdb_cleaned_using_python
    UNION
    SELECT imdb_rate, genre2 AS genre FROM imdb_cleaned_using_python
    UNION
    SELECT imdb_rate, genre3 AS genre FROM imdb_cleaned_using_python
) AS unified
GROUP BY genre
ORDER BY avg_rate DESC;


-- the movie's duration average
select avg(duration_in_minute) as duration_average
from imdb_cleaned_using_python;


-- the movie's imdb rate average
select round(avg(imdb_rate), 2) as rate_average
from imdb_cleaned_using_python;


-- the movie's vote count average
select round(avg(vote_count), 2) as vote_count_average
from imdb_cleaned_using_python;


-- the movie's box office average
select avg(box_office) as box_office_average_in_dollar
from imdb_cleaned_using_python;


-- -------------------------------------
-- -------------------------------------
-- release years min and max
select min(release_year) as minimum_year, max(release_year) as maximum_year
from imdb_cleaned_using_python;


-- to see the release season of min and max duration of the list
select movie_name, release_season, duration_in_minute
from imdb_cleaned_using_python
where duration_in_minute = (select max(duration_in_minute) from imdb_cleaned_using_python)
	or duration_in_minute = (select min(duration_in_minute) from imdb_cleaned_using_python);


-- to see min and max of vote count in the list
select movie_name, movie_rank, imdb_rate, vote_count
from imdb_cleaned_using_python
where vote_count = (select max(vote_count) from imdb_cleaned_using_python)
	or vote_count = (select min(vote_count) from imdb_cleaned_using_python);


-- to see movies with min and max of imdb rates 
select movie_name, movie_rank, imdb_rate
from imdb_cleaned_using_python
where imdb_rate = (select max(imdb_rate) from imdb_cleaned_using_python)
	or imdb_rate = (select min(imdb_rate) from imdb_cleaned_using_python);


-- to see movie's release season based on imdb rates min and max
select movie_name, movie_rank, release_season, imdb_rate
from imdb_cleaned_using_python
where imdb_rate = (select max(imdb_rate) from imdb_cleaned_using_python)
	or imdb_rate = (select min(imdb_rate) from imdb_cleaned_using_python);



-- to see movie's age group rates based on imdb rates min and max
select movie_name, movie_rank, age_group_rate, imdb_rate
from imdb_cleaned_using_python
where imdb_rate = (select max(imdb_rate) from imdb_cleaned_using_python)
	or imdb_rate = (select min(imdb_rate) from imdb_cleaned_using_python);



-- to see movie's box office based on imdb rates min and max
select movie_name, movie_rank, box_office, imdb_rate
from imdb_cleaned_using_python
where imdb_rate = (select max(imdb_rate) from imdb_cleaned_using_python)
	or imdb_rate = (select min(imdb_rate) from imdb_cleaned_using_python);