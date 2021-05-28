require_relative './cafe'

# Create an instance of cafe
menu = {"latte" => 4.00, "tea" => 3.00, "scone" => 5.00}
cafe = Cafe.new("Coder Academy", menu)

# Print welcome message
cafe.welcome

loop do
    # Print menu
    cafe.print_menu
    puts 
    puts "What would you like to order? When you are \nfinished, type 'done'."
    input = gets.strip.downcase

    # Break when 'done'
    if (input === 'done')
        break
    end

    # Check for valid menu item
    item = cafe.menu.validate_item(input)

    # If item is valid, add to order
    if (item)
        puts "How many would you like?"
        quantity = gets.strip.to_i

        # Add to order if quantity more than 0
        if (quantity > 0)
            cafe.add_to_order(item, quantity)
        end
    end
end

# Print the order summary
cafe.print_order