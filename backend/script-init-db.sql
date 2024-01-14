delete from movie_movie;
delete from movie_actor;
delete from movie_actor_movies;
delete from movie_review;

-- Insert movies

INSERT INTO movie_movie (id, title, description) VALUES
(1, 'Movie 1', 'Description for Movie 1'),
(2, 'Movie 2', 'Description for Movie 2'),
(3, 'Movie 3', 'Description for Movie 3'),
(4, 'Movie 4', 'Description for Movie 4'),
(5, 'Movie 5', 'Description for Movie 5'),
(6, 'Movie 6', 'Description for Movie 6'),
(7, 'Movie 7', 'Description for Movie 7'),
(8, 'Movie 8', 'Description for Movie 8'),
(9, 'Movie 9', 'Description for Movie 9'),
(10, 'Movie 10', 'Description for Movie 10'),
(11, 'Movie 11', 'Description for Movie 11'),
(12, 'Movie 12', 'Description for Movie 12'),
(13, 'Movie 13', 'Description for Movie 13'),
(14, 'Movie 14', 'Description for Movie 14'),
(15, 'Movie 15', 'Description for Movie 15');

-- Insert actors


INSERT INTO movie_actor (id, first_name, last_name) VALUES
(1, 'Actor 1 First Name', 'Actor 1 Last Name'),
(2, 'Actor 2 First Name', 'Actor 2 Last Name'),
(3, 'Actor 3 First Name', 'Actor 3 Last Name'),
(4, 'Actor 4 First Name', 'Actor 4 Last Name'),
(5, 'Actor 5 First Name', 'Actor 5 Last Name'),
(6, 'Actor 6 First Name', 'Actor 6 Last Name'),
(7, 'Actor 7 First Name', 'Actor 7 Last Name'),
(8, 'Actor 8 First Name', 'Actor 8 Last Name'),
(9, 'Actor 9 First Name', 'Actor 9 Last Name'),
(10, 'Actor 10 First Name', 'Actor 10 Last Name'),
(11, 'Actor 11 First Name', 'Actor 11 Last Name'),
(12, 'Actor 12 First Name', 'Actor 12 Last Name'),
(13, 'Actor 13 First Name', 'Actor 13 Last Name'),
(14, 'Actor 14 First Name', 'Actor 14 Last Name'),
(15, 'Actor 15 First Name', 'Actor 15 Last Name');


-- Insert link between both actor and movie
-- Movie 1 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(1, 1),
(1, 2),
(1, 3);

-- Movie 2 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(2, 4),
(2, 5),
(2, 6);

-- Movie 3 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(3, 7),
(3, 8),
(3, 9);

-- Movie 4 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(4, 1),
(4, 2),
(4, 3);

-- Movie 5 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(5, 4),
(5, 5),
(5, 6);

-- Movie 6 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(6, 7),
(6, 8),
(6, 9);

insert into movie_review (id, grade, movie_id)
values  (1, 1, 1),
        (2, 5, 2),
        (3, 3, 2),
        (4, 3, 1),
        (5, 3, 1),
        (6, 5, 1),
        (7, 2, 5),
        (8, 2, 5);