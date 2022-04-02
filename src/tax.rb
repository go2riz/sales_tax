class Tax

  def initialize tax_rate, import_duty
    @tax_rate, @import_duty = tax_rate, import_duty
  end

  # to calculate tax on an item
  def calculate_item_tax item
    total_applicable_tax_on_item = @tax_rate + @import_duty
    ceil_to ( item.price * total_applicable_tax_on_item ) / 100
  end

  private


  # to round up to nearest 0.05
  def ceil_to float_num
    ( float_num * 20 ).ceil.to_f / 20
  end

end