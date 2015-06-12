require "spec_helper"

describe(Museum) do
  describe(".all") do
    it("starts off with no museums") do
      expect(Museum.all()).to(eq([]))
    end
  end

end
