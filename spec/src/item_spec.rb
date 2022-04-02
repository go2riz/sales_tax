require './src/item'

describe Item do

  describe "is_exempted?" do
    context "when item is not exempted from tax" do
      item = Item.new(1, "video game", 15.99)
      it "should return false" do
        expect(item.is_exempted?).to be false
      end
    end

    context "when item is exempted from tax" do
      item = Item.new(1, "stories book", 15.99)
      it "should return true" do
        expect(item.is_exempted?).to be true
      end
    end
  end

  describe "is_imported?" do
    context "when item is not imported" do
      item = Item.new(1, "shoes", 15.99)
      it "should return false" do
        expect(item.is_imported?).to be false
      end
    end

    context "when item is imported" do
      item = Item.new(1, "imported shoes", 15.99)
      it "should return true" do
        expect(item.is_imported?).to be true
      end
    end
  end

end
