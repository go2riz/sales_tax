require './src/item'
require './src/tax'
require './src/receipt'

describe Tax do

  describe "create receipt" do
    it "should create a receipt" do
      expect do
        items = "1, book, 12.49\n1, music cd, 14.99\n1, chocolate bar, 0.85"
        Receipt.new(items).create_receipt
      end.to output("1, book, 12.49\n1, music cd, 16.49\n1, chocolate bar, 0.85\n\n\nSales Taxes: 1.5\nTotal: 29.83\n").to_stdout
    end

    it "should not create a receipt" do
      expect do
        items1 = "xyz"
        Receipt.new(items1).create_receipt
      end.to output("Invalid input. Please try again!\n").to_stdout
    end
  end

end
