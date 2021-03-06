create table Actor(
    actor_id int generated by default as identity primary key ,
    name varchar(100) not null unique ,
    age int check ( age > 10 )
);

insert into actor (name, age)
values ('Harvey Keitel', 81),
       ('Robert De Niro', 77),
       ('Leonardo Dicaprio', 46),
       ('Jason Statham', 53),
       ('Joe Pesci', 77),
       ('Samuel L.Jackson', 72);

create table actor_movie (
    actor_id int references actor(actor_id),
    movie_id int references movie(movie_id),
    primary key (actor_id, movie_id)
);

insert into actor_movie values (1, 1),
                               (1, 2),
                               (2, 5),
                               (2, 6),
                               (3, 4),
                               (3, 7),
                               (3, 11),
                               (4, 8),
                               (4, 9),
                               (5, 6),
                               (6, 2),
                               (6, 3);

-- Joins
select actor.name, movie.name from
    actor join actor_movie  on actor.actor_id = actor_movie.actor_id
    join movie on actor_movie.movie_id = movie.movie_id;