class Artwork
  attr_reader(:id, :description, :museum_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @museum_id = attributes.fetch(:museum_id).to_i
    @id = attributes.fetch(:id).to_i
  end

  define_singleton_method(:all) do
    returned_artworks = DB.exec("SELECT * FROM artworks;")
    artworks = []
    returned_artworks.each() do |artwork|
      description = artwork.fetch("description")
      museum_id = artwork.fetch("museum_id").to_i()
      id = artwork.fetch("id").to_i()
      artworks.push(Artwork.new({:id => id, :description => description, :museum_id => museum_id}))
    end
    artworks
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO artworks (description, museum_id) VALUES ('#{@description}', #{@museum_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_artwork|
    self.description().==(another_artwork.description())&(self.museum_id().==(another_artwork.museum_id()))
  end

  define_singleton_method(:find) do |id|
    found_artwork = nil
    Artwork.all().each() do |artwork|
      if artwork.id().==(id)
        found_artwork = artwork
      end
    end
    found_artwork
  end

  define_method(:delete) do
    DB.exec("DELETE FROM artworks WHERE id = #{self.id()};")
  end


end
