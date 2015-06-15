
require "sinatra"
require "sinatra/reloader"
also_reload("lib/**/*.rb")
require "./lib/museum"
require "./lib/artwork"
require "pg"
require "pry"

DB = PG.connect({:dbname => "museum_tracker"})

get("/") do
  @museums = Museum.all
  @artworks = Artwork.all
  erb(:index)
end

get("/museum/new") do
  erb(:add_museum)
end

get("/artwork") do
  @artworks = Artwork.all
  erb(:all_art)
end

get("/artwork/:id") do
  artwork = (params.fetch("artwork_ids"))
  artwork.each() do |art|
    y = art.to_i
  x = Artwork.find(y)
  x.delete
end
  @artworks = Artwork.all
  erb(:all_art)
end

# delete("/artwork/:id") do
#   @artwork = Artwork.find(params.fetch("art_id").to_i())
#   @artwork.delete
#   @artworks = Artwork.all
#   redirect to '/artwork'
# end





post("/") do
  name = params.fetch("name")
  museum = Museum.new({:name => name, :id => nil})
  museum.save()
  @museums = Museum.all
  @artworks = Artwork.all
  erb(:index)
end

post("/museums/:id") do

  description = params.fetch("description")
  museum_id = params.fetch("museum_id").to_i()
  @artwork = Artwork.new({:id => nil, :description => description, :museum_id => museum_id})
  @artwork.save()
  @museum = Museum.find(params.fetch("museum_id").to_i())
  @museums = Museum.all
  @artworks = Artwork.all

  erb(:museum)
end

get("/museums/:id") do

  @museum = Museum.find(params.fetch("id").to_i())

  erb(:museum)
end

patch("/museums/:id") do
  name = params.fetch("name")
  @museum = Museum.find(params.fetch("id").to_i())
  @museum.update({:name => name})
  erb(:museum)
end

delete("/museums/:id") do
  @museum = Museum.find(params.fetch("id").to_i())
  @museum.delete()
  @museums = Museum.all()
  erb(:index)
end
