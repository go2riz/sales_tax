require './src/item'
require './src/tax'

describe Tax do

  describe "calculate item tax" do
    it "tax when item is not exempted and not imported" do
      item = Item.new(1, "video game", 15.99)
      tax = Tax.new(10, 0)
      expect(tax.calculate_item_tax item).to eq 1.6
    end

    it "tax when item is not exempted and is imported" do
      item = Item.new(1, "imported shoes", 35.99)
      tax = Tax.new(10, 5)
      expect(tax.calculate_item_tax item).to eq 5.4
    end

    it "tax when item is exempted and not imported" do
      item = Item.new(1, "stories book", 12.99)
      tax = Tax.new(0, 0)
      expect(tax.calculate_item_tax item).to eq 0
    end

    it "tax when item is exempted and imported" do
      item = Item.new(1, "imported chocolate bar", 15.99)
      tax = Tax.new(0, 5)
      expect(tax.calculate_item_tax item).to eq 0.8
    end
  end

end
