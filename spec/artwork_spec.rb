require "spec_helper"

describe(Artwork) do
  describe(".all") do
    it("is empty at first") do
      expect(Artwork.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds artwork to the array of saved artworks") do
      test_artwork = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      test_artwork.save()
      expect(Artwork.all()).to(eq([test_artwork]))
    end
  end

  describe("#==") do
    it("is the same artwork if it has the same description and museum ID") do
      artwork1 = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      artwork2 = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      expect(artwork1).to(eq(artwork2))
    end
  end

  describe("#id") do
    it("sets artworks ID when you save it") do
      artwork = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      artwork.save()
      expect(artwork.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns an artwork by its ID") do
      test_artwork = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      test_artwork.save()
      test_artwork2 = Artwork.new({:id => nil, :description => "Thinker", :museum_id => 3})
      test_artwork2.save()
      expect(Artwork.find(test_artwork2.id())).to(eq(test_artwork2))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_artwork = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      expect(test_artwork.description()).to(eq("Mona Lisa"))
    end
  end

  describe("#museum_id") do
    it("lets you read the museum ID out") do
      test_artwork = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => 1})
      expect(test_artwork.museum_id()).to(eq(1))
    end
  end

  describe("#delete") do
    it("deletes a museum's artworks from the database") do
      museum = Museum.new({:name => "MCA", :id => nil})
      museum.save()
      artwork = Artwork.new({:id => nil, :description => "Mona Lisa", :museum_id => museum.id()})
      artwork.save()
      artwork2 = Artwork.new({:id => nil, :description => "Thinker", :museum_id => museum.id()})
      artwork2.save()
      museum.delete()
      expect(Artwork.all()).to(eq([]))
    end
  end

end
