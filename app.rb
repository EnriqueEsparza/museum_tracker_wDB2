
require "sinatra"
require "sinatra/reloader"
also_reload("lib/**/*.rb")
require "./lib/museum"
require "./lib/artwork"
require "pg"

DB = PG.connect({:dbname => "museum_tracker"})

get("/") do
  @museums = Museum.all
  @artworks = Artwork.all
  erb(:index)
end

get("/museum/new") do
  erb(:add_museum)
end
get("/artwork/new") do
  erb(:add_art)
end
