require 'pry'
class Product

  attr_reader :category, :name, 
              :quantity, :unit_price,
              :hoarded

  def initialize(category,name,unit_price,quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
    @hoarded = false
  end 

  def total_price
    total_price = unit_price * quantity.to_f
  end

  def is_hoarded?
    @hoarded
  end

  def hoard
    @hoarded = true
  end

end
