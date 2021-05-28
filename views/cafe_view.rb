require 'artii'

class CafeView
  SPACING = 50

  def initialize(cafe)
    @cafe = cafe
  end

  def welcome
    message = Artii::Base.new
    puts "\n"
    puts message.asciify("Welcome to")
    puts message.asciify("#{@cafe.name}!")
    nil
  end
  
  def print_menu
    spacing = SPACING
    @cafe.menu.display
    puts "=" * spacing
    nil
  end

  def place_order
    puts 
    puts "What would you like to order? When you are \nfinished, type 'done'."
    return gets.strip.downcase
  end

  def invalid_input
    puts "The item you selected is not in the menu. Please choose again, or enter 'done' if you are finished."
  end

  def get_quantity
    puts "How many would you like?"
    return gets.to_i
  end

  def order_summary
    spacing = SPACING
    order_items = @cafe.get_order.items
    order_title = "YOUR ORDER"
    puts "\n"
    puts "=" * spacing
    puts order_title.center(spacing, " ")
    puts "-" * spacing
    if order_items.empty?
      return nil
    else
      return order_items.each do |item, qty|
        puts "#{item}".ljust(spacing / 2, '.') + "x #{qty}".rjust(spacing / 2, '.')
      end
    end
end

def print_order
  spacing = SPACING
    message = Artii::Base.new
    order = @cafe.get_order
    if order
      order_summary
      puts "-" * spacing
      puts "TOTAL:".ljust(spacing / 2) + "$#{sprintf("%.2f", @cafe.order_total)}".rjust(spacing / 2)
    else
      puts
      puts "x" * spacing
      puts "Your order is empty.".center(spacing)
    end
    puts "=" * spacing
    puts
    puts message.asciify("Thank you")
    puts message.asciify("for coming!")
  end
end