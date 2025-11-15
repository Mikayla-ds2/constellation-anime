-- head of table --
drop table if EXISTS anime;

create table if NOT EXISTS anime (
    animeID int,
    id int PRIMARY key,
    name VARCHAR(500),
    genres VARCHAR(5000),
    type VARCHAR(50),
    episodes int,
    status VARCHAR(50),
    airedFrom DATE,
    airedTo DATE,
    duration DECIMAL(4, 1),
    score DECIMAL(10, 2),
    ratingUsers int,
    rank int,
    rating VARCHAR(500),
    studios VARCHAR(500),
    producers VARCHAR(5000)
)

/copy anime(animeID, id, name, genres, type, episodes, status, airedFrom, airedTo, duration, score, ratingUsers, rank, rating, studios, producers)
from '/tmp/popularAnime.csv'
DELIMITER ','
csv header;

select * from anime