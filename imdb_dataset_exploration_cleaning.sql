--                            here we specify the database that we want to work on

use imdb;
set sql_safe_updates = 0;


--                             finding then removing    duplicates across the dataset

select *
FROM imdb_db im
JOIN imdb_db im2
ON im.movie_rank = im2.movie_rank and im.movie_rank > im2.movie_rank;


delete im
FROM imdb_db im
JOIN imdb_db im2
ON im.movie_rank = im2.movie_rank and im.movie_rank > im2.movie_rank;


--                              ckecking columns datatypes  to make sure they're correct for further steps
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'imdb_db';

ALTER TABLE imdb_db
MODIFY COLUMN release_date int;

ALTER TABLE imdb_db
MODIFY COLUMN imdb_rate float;


--                              renaming columns

ALTER TABLE imdb_db 
RENAME COLUMN lang TO language_;


alter table imdb_db
rename column age to age_group_rate;


alter table imdb_db
rename column movie to movie_name;


alter table imdb_db
rename column release_date to release_year;



--                               finding missing values among columns, one by one

select * from imdb_db where movie_name Is null;
select * from imdb_db where release_year Is null;
select * from imdb_db where release_season Is null;
select * from imdb_db where duration Is null;
select * from imdb_db where imdb_rate Is null;
select * from imdb_db where genre1 Is null;
select * from imdb_db where genre2 Is null;
select * from imdb_db where genre3 Is null;
select * from imdb_db where coutry Is null;
select * from imdb_db where language_ Is null;
select * from imdb_db where box_office Is null;
select * from imdb_db where age_group_rate Is null;

--                               finding the values out of context

select distinct release_season 
from imdb_db;

-- a value was found in release_season as March whic is not a season name so it shold be replace with a correct value



update imdb_db
set release_season = replace(release_season, 'march', 'spring')
where release_season = 'march';


select distinct genre1 
from imdb_db;

--       here there are some genres that need to get corrected, like music to musical, misspelled words and some random exploration on columns

update imdb_db
set genre1 = replace(genre1, 'music', 'musical')
where genre1 = 'music';


update imdb_db
set genre1 = replace(genre1, 'sci-fic', 'sci-fi')
where genre1 = 'sci-fic';


select distinct genre2 
from imdb_db;


update imdb_db
set genre2 = replace(genre2, 'traged', 'tragedy')
where genre2 = 'traged';


update imdb_db
set genre2 = replace(genre2, 'music', 'musical')
where genre2 = 'music';


select distinct genre3
from imdb_db;


update imdb_db
set genre3 = replace(genre3, 'prison_drama', 'prison drama')
where genre3 = 'prison_drama';


update imdb_db
set genre3 = replace(genre3, 'music', 'musical')
where genre3 = 'music';


update imdb_db
set genre3 = replace(genre3, 'boxing', 'sport')
where genre3 = 'boxing';


select distinct language_
from imdb_db;


update imdb_db
set language_ = replace(language_, 'british', 'english')
where language_ = 'english';

-- -------------------------
select distinct genre3
from imdb_db
order by genre3 asc;

update imdb_db
set genre3 = replace(genre3, 'adventrue', 'adventure')
where genre3 = 'adventrue';

-- -------------------------
select * from imdb_db
where language_ = 'british';

update imdb_db
set language_ = replace(language_, 'british', 'english')
where language_ = 'british';

-- -------------------------
select * from imdb_db
where language_ = 'english-italian';

update imdb_db
set language_ = replace(language_, 'english-italian', 'english italian')
where language_ = 'english-italian';








