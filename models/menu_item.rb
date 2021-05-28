class MenuItem
  attr_reader :name, :price

  MENU_LIST_SPACING = 50

  def initialize(name, price)
      @name = name
      @price = price
  end

  def to_s
      spacing = MENU_LIST_SPACING
      "#{@name}".ljust(spacing / 2, '.') + "$#{sprintf("%.2f", @price)}".rjust(spacing / 2, '.')
  end
end