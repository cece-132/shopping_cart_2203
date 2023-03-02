require './product'
require './shopping_cart'

class ShoppingCart

  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.scan(/\d+|\D+/).first.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {
      name: @name,
      capacity: @capacity
    }
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity.to_i
    end
  end

  def is_full?
    total_number_of_products >= 30
  end

  def products_by_category(category)
    @products.map do |product|
      product if product.category == category
    end.compact
  end

  def percentage_occupied
    ((total_number_of_products / @capacity.to_f)*100).round(2)
  end
end
