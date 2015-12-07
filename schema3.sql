SELECT actors.name AS actor_name, cast_members.character, movies.title
FROM actors
JOIN cast_members
ON actors.id = cast_members.actor_id
JOIN movies
ON cast_members.movie_id = movies.id


"SELECT  movies.title, actors.name AS actor_name, cast_members.character
FROM movies
JOIN cast_members
ON movies.id = cast_members.movie_id
JOIN actors
ON actors.id = cast_members.actor_id
WHERE actors.name = $1"

SELECT  movies.title, actors.name AS actor_name, cast_members.character, movies.year, movies.rating
FROM movies
JOIN cast_members
ON movies.id = cast_members.movie_id
JOIN actors
ON actors.id = cast_members.actor_id
JOIN genres
ON movies.genre_id = genres.id
WHERE movies.title = $1
