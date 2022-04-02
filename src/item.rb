class Item
  attr_accessor :quantity, :product, :price

  # script will work according to following food items, books and medicine types!
  # some known food items
  FOOD_ITEMS = %w{water juice liquid wheat flour corn vegetable milk chocolate candy toffee biscuit sugar tea coffee chicken beef mutton bread snacks pasta}

  # some known types of reading materials
  BOOKS = %w{book journal paper}

  # some main types of medicines
  MEDICINES = %w{tablet pill capsule syrup injection supplement ointment}

  EXEMPTED_ITEMS = ((FOOD_ITEMS.zip BOOKS).zip MEDICINES).flatten.compact

  def initialize quantity, product, price
    @quantity, @product, @price = quantity, product, price
  end

  def is_exempted?
    EXEMPTED_ITEMS.any? { |s| @product.include?(s) }
  end

  # for imported products, I assume that product name will contain "import" word in product name!
  def is_imported?
    @product.include? ( "import" )
  end
end