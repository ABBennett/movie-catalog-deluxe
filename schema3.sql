SELECT actors.name AS actor_name, cast_members.character, movies.title
FROM actors
JOIN cast_members
ON actors.id = cast_members.actor_id
JOIN movies
ON cast_members.movie_id = movies.id
