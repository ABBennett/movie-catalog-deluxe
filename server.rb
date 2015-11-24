require "sinatra"
require "pg"
require "pry"

set :views, File.join(File.dirname(__FILE__), "/views")

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get '/actors' do

  db_connection do |conn|
    @actors = conn.exec("SELECT name FROM actors")
  end

  erb :'actors/index'
end

get '/actors/:id' do
  @actor = nil
  db_connection do |conn|
    sql_query = "SELECT  movies.title, actors.name AS actor_name, cast_members.character
    FROM movies
    JOIN cast_members
    ON movies.id = cast_members.movie_id
    JOIN actors
    ON actors.id = cast_members.actor_id
    WHERE actors.name = $1"

    data = [params["id"]]
    @actor = conn.exec_params(sql_query, data)
    
  end
  erb :'actors/show'
end
