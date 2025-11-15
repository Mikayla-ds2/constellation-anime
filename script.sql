-- head of table --
drop table if EXISTS anime;

create table if NOT EXISTS anime (
    animeID int,
    id int PRIMARY key,
    name VARCHAR(500),
    genres VARCHAR(5000),
    type VARCHAR(50),
    episodes FLOAT,
    status VARCHAR(50),
    airedFrom DATE,
    airedTo DATE,
    duration FLOAT,
    score FLOAT,
    ratingUsers FLOAT,
    rank FLOAT,
    rating VARCHAR(500),
    studios VARCHAR(500),
    producers VARCHAR(5000)
)

/copy anime(animeID, id, name, genres, type, episodes, status, airedFrom, airedTo, duration, score, ratingUsers, rank, rating, studios, producers)
from '/tmp/popularAnime.csv'
DELIMITER ','
csv header;

select * from anime

select name, episodes, rank from anime
where rank < 15
order by rank asc;

select * from anime 
where rating like '%violence%'

select name, rank, rating from anime
where genres like 'Hentai'