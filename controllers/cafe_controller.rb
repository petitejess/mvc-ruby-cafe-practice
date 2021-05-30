class CafeController
  def initialize(cafe_model, cafe_view)
    @cafe_model = cafe_model
    @cafe_view = cafe_view
  end

  def run
    # Print welcome message
    @cafe_view.welcome
    
    loop do
      # Print menu
      @cafe_view.print_menu
      input = @cafe_view.place_order
      
      # Break when 'done'
      if (input === 'done')
          break
      end
  
      # Check for valid menu item
      item = @cafe_model.validate_item(input)
  
      # If item is valid, add to order
      if (item)
        quantity = @cafe_view.get_quantity

        # Add to order if quantity more than 0
        if (quantity > 0)
            @cafe_model.add_to_order(item, quantity)
        end
      else
        @cafe_view.invalid_input
      end
    end
    
    # Print the order summary
    @cafe_view.print_order
  end
end