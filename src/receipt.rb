class Receipt
  @@total_price, @@total_tax = 0, 0
  def initialize items
    @items = items
  end

  # to crate a receipt
  def create_receipt
    begin
      line_items = parse_items_input
      line_items.each do | line_item |
        process_line_item line_item
      end
      puts "\n\nSales Taxes: #{@@total_tax.round ( 2 )}\nTotal: #{( @@total_price + @@total_tax ).round ( 2 )}"
    rescue
      puts "Invalid input. Please try again!"
    end
  end

  private

  def parse_items_input
    @items.split("\n")
  end

  # to process a specific line item and to update total receipt price and total applied tax
  def process_line_item line_item
    parsed_line_item = line_item.split(",")
    item = Item.new(parsed_line_item[0].strip.to_i, parsed_line_item[1].strip, parsed_line_item[2].strip.to_f)
    tax = Tax.new(item.is_exempted? ? 0 : 10, item.is_imported? ? 5 : 0)
    item_tax = tax.calculate_item_tax item
    @@total_price += item.price
    @@total_tax += item_tax
    item.price = ( item.price + item_tax ).round( 2 )
    puts "#{item.quantity}, #{item.product}, #{item.price}"
  end
end