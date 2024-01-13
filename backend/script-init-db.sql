-- Insert movies

INSERT INTO movie_movie (title, description) VALUES
('Movie 1', 'Description for Movie 1'),
('Movie 2', 'Description for Movie 2'),
('Movie 3', 'Description for Movie 3'),
('Movie 4', 'Description for Movie 4'),
('Movie 5', 'Description for Movie 5'),
('Movie 6', 'Description for Movie 6'),
('Movie 7', 'Description for Movie 7'),
('Movie 8', 'Description for Movie 8'),
('Movie 9', 'Description for Movie 9'),
('Movie 10', 'Description for Movie 10'),
('Movie 11', 'Description for Movie 11'),
('Movie 12', 'Description for Movie 12'),
('Movie 13', 'Description for Movie 13'),
('Movie 14', 'Description for Movie 14'),
('Movie 15', 'Description for Movie 15');

-- Insert actors

INSERT INTO movie_actor (first_name, last_name) VALUES
('Actor 1 First Name', 'Actor 1 Last Name'),
('Actor 2 First Name', 'Actor 2 Last Name'),
('Actor 3 First Name', 'Actor 3 Last Name'),
('Actor 4 First Name', 'Actor 4 Last Name'),
('Actor 5 First Name', 'Actor 5 Last Name'),
('Actor 6 First Name', 'Actor 6 Last Name'),
('Actor 7 First Name', 'Actor 7 Last Name'),
('Actor 8 First Name', 'Actor 8 Last Name'),
('Actor 9 First Name', 'Actor 9 Last Name'),
('Actor 10 First Name', 'Actor 10 Last Name'),
('Actor 11 First Name', 'Actor 11 Last Name'),
('Actor 12 First Name', 'Actor 12 Last Name'),
('Actor 13 First Name', 'Actor 13 Last Name'),
('Actor 14 First Name', 'Actor 14 Last Name'),
('Actor 15 First Name', 'Actor 15 Last Name');


-- Insert link between both actor and movie
-- Movie 1 actors
INSERT INTO movie_actor_movies (movie_id, actor_id) VALUES
(1, 1),
(1, 2),
(1, 3),

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