class Order
  def initialize
      @order_items = Hash.new(0)  # A trick to create hash with default 0 as key, so can add value to already recorded key AND create key if none exist previously
  end

  def add(name, quantity)
      @order_items[name] += quantity
  end

  def items
      @order_items
  end

  def display
      spacing = MenuItem::MENU_LIST_SPACING
      order_title = "YOUR ORDER"
      puts "\n"
      puts "=" * spacing
      puts order_title.center(spacing, " ")
      puts "-" * spacing
      if @order_items.empty?
          return nil
      else
          return @order_items.each do |item, qty|
              puts "#{item}".ljust(spacing / 2, '.') + "x #{qty}".rjust(spacing / 2, '.')
          end
      end
  end
end