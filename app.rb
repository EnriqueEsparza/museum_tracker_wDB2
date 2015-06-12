
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

post("/") do
  name = params.fetch("name")
  museum = Museum.new({:name => name, :id => nil})
  museum.save()
  @museums = Museum.all
  @artworks = Artwork.all
  erb(:index)
end

# post("/") do
#   description = params.fetch("description")
#   artwork = Artwork.new({:description => description, :museum_id => nil})
#   artwork.save()
#   @museums = Museum.all
#   @artworks = Artwork.all
#   erb(:index)
# end

get("/museums/:id") do
  @museum = Museum.find(params.fetch("id").to_i())
  @artworks = Artwork.all
  erb(:museum)
end

patch("/museums/:id") do
  name = params.fetch("name")
  @museum = Museum.find(params.fetch("id").to_i())
  @museum.update({:name => name})
  erb(:museum)
end
