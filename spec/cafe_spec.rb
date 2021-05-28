require_relative '../models/menu_item'
require_relative '../models/menu'
require_relative '../models/order'
require_relative '../models/cafe'
require_relative '../views/cafe_view'

describe MenuItem do
  it 'should create a menu item with name and price' do
    name = "latte"
    price = 4.00
    item = MenuItem.new(name, price)
    expect(item.name).to eq(name)
    expect(item.price).to eq(price)
  end

    # it 'should return the price of the item' do
    #     name = "latte"
    #     price = 4.00
    #     menu_item = MenuItem.new(name, price)
    #     expect(menu_item.price).to eq(price)
    # end

    # it 'should return the name of the item' do
    #     name = "latte"
    #     price = 4.00
    #     menu_item = MenuItem.new(name, price)
    #     expect(menu_item.name).to eq(name)
    # end
end

describe Menu do
  it 'should add an item to the menu' do
    menu = Menu.new
    name = "latte"
    price = 4.00  
    menu.add_item(name, price)
    expect(menu.get_items.length).to be(1)
  end
  
  it 'item should have expected price' do
    menu = Menu.new
    name = "latte"
    price = 4.00
    menu.add_item(name, price)
    expect(menu.get_price(name)).to eq(price)
  end

    

    # it 'should return the item name for a valid item' do
    #     name = "latte"
    #     price = 4.00
    #     menu = Menu.new
    #     menu.add_item(name, price)
    #     expect(menu.validate_item(name)).to eq(name)
    # end

    # it 'should return nil for an invalid item' do
    #     name = "latte"
    #     price = 4.00
    #     menu = Menu.new
    #     menu.add_item(name, price)
    #     expect(menu.validate_item("tea")).to eq(nil)
    # end
end

describe Order do
  it 'should add an item to the order' do
    order = Order.new
    name = "latte"
    quantity = 2
    order.add(name, quantity)
    expect(order.items().length).to be(1)
  end

  # it 'should update the quantity of the order' do
  #   order = Order.new
  #   name = "latte"
  #   quantity = 2
  #   quantity_add = 3
  #   order.add_item(name, quantity)
  #   order.add_item(name, quantity_add)
  #   expect(order.get_items()[name]).to be(quantity + quantity_add)
  # end
end

describe Cafe do
  it 'should create a cafe with a name' do
    name = "My Cafe"
    menu_items = {}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.name).to eq(name)
  end

  it 'should create a cafe with a menu' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.menu.get_items.length).to be (2)
  end

  it 'should add an item to order' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    item = "latte"
    quantity = 1
    cafe.add_to_order(item, quantity)
    expect(cafe.get_order.items.length).to be(1)
  end

  it 'should validate a valid menu item' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.validate_item("latte")).to eq("latte")
  end

  it 'should return nil for an invalid menu item' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.validate_item("scone")).to eq(nil)
  end

  it 'should return the order total' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    item = "latte"
    quantity = 1
    cafe.add_to_order(item, quantity)
    # item = "latte"
    # quantity = 2
    # cafe.add_to_order(item, quantity)
    # expect(cafe.order_total).to be(12.00)
  end
end

describe CafeView do
  it 'should print a welcome to the cafe' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    cafe_view = CafeView.new(cafe)
    expect(cafe_view.welcome).to be(nil)
  end

  it 'should print the menu for the cafe' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    cafe_view = CafeView.new(cafe)
    expect(cafe_view.print_menu).to eq(nil)
  end

  it 'should print a message that item is invalid' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    cafe_view = CafeView.new(cafe)
    expect(cafe_view.invalid_input).to eq(nil)
  end

  it 'should print the order summary for an empty order' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    cafe_view = CafeView.new(cafe)

    expect(cafe_view.print_order).to eq(nil)
  end

  it 'should print the order summary with an order item' do
    name = "My Cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    cafe_view = CafeView.new(cafe)
    item = "latte"
    quantity = 1
    cafe.add_to_order(item, quantity)
    expect(cafe_view.print_order).to eq(nil)
  end
end