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
    producers VARCHAR(5000),
    episodes_category VARCHAR(500)
)

/copy anime(animeID, id, name, genres, type, episodes, status, airedFrom, airedTo, duration, score, ratingUsers, rank, rating, studios, producers, episodes_category)
from '/tmp/popularanime.csv'
DELIMITER ','
csv header;

select * from anime

select name, episodes, rank from anime
where rank < 15
order by rank asc;

select * from anime 
where rating like '%violence%'

select DISTINCT(type), count(animeID) as type_count from anime
group by type
order by type_count desc;

select animeID, id, name, type, episodes, status from anime
where not type = 'TV' and name not like '%Season%'

select animeID, name, episodes, episodes_category from anime
where episodes_category = '1 - 12 Episodes'
order by episodes desc;
-- top episode count is 440 --

select animeID, name, episodes, episodes_category from anime
where episodes_category = '13 - 25 Episodes'
order by episodes desc;
-- from 475 to 726 (only 4 animes) --

select animeID, name, episodes, episodes_category from anime
where episodes_category = '100+ Episodes'
order by episodes desc;

select animeID, name, episodes from anime
where episodes > 0 and episodes < 50
order by episodes desc;

select count(episodes) as episodeCount, type from anime
where episodes > 0 and episodes < 50
group by type
order by episodeCount desc;