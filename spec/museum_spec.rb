require "spec_helper"

describe(Museum) do
  describe(".all") do
    it("starts off with no museums") do
      expect(Museum.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save museums to the database") do
      museum = Museum.new({:name => "MCA", :id => nil})
      museum.save()
      expect(Museum.all()).to(eq([museum]))
    end
  end

  describe("#==") do
    it("is the same museum if it has the same name") do
      museum1 = Museum.new({:name => "MCA", :id => nil})
      museum2 = Museum.new({:name => "MCA", :id => nil})
      expect(museum1).to(eq(museum2))
    end
  end

  describe("#name") do
    it("tells you museums name") do
      museum = Museum.new({:name => "MCA", :id => nil})
      expect(museum.name()).to(eq("MCA"))
    end
  end

  describe("#id") do
    it("sets museums ID when you save it") do
      museum = Museum.new({:name => "MCA", :id => nil})
      museum.save()
      expect(museum.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a museum by its ID") do
      test_museum = Museum.new({:name => "MCA", :id => nil})
      test_museum.save()
      test_museum2 = Museum.new({:name => "Art Institute", :id => nil})
      test_museum2.save()
      expect(Museum.find(test_museum2.id())).to(eq(test_museum2))
    end
  end

end
