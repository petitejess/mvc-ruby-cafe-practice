require_relative './menu_item'

class Menu
    def initialize
        @menu_items = []
    end

    def add_item(name, price)
        menu_item = MenuItem.new(name, price)
        @menu_items << menu_item
    end

    def get_price(name)
        item = @menu_items.find { |menu_item| menu_item.name === name }
        item.price
    end

    def get_items()
        @menu_items
    end

    def display
        spacing = MenuItem::MENU_LIST_SPACING
        menu_title = "MENU"
        puts "\n"
        puts "=" * spacing
        puts menu_title.center(spacing, " ")
        puts "=" * spacing
        @menu_items.each { |item| puts item }
        nil
    end

    def validate_item(name)
        @menu_items.each do |menu_item|
            if menu_item.name === name
                return name
            end
        end
        nil
    end
end