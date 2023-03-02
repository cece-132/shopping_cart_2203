require './product'
require './shopping_cart'

class ShoppingCart

  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = 30
    @products = []
  end

  def add_product(product)
    products << product
  end

  def details
    {
      name: @name,
      capacity: @capacity
    }
  end

  def total_number_of_products
    total = 0
    products.each do |product|
      product.quantity += total
    end
    # (quantity)
    # @products.count * quantity = total_number_of_products
    # return total_number_of_products
  end

  def is_full?
    if total_number_of_products == 30
      true
    end
  end
end
