require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  before :each do
    @cart = ShoppingCart.new("King Soopers", "30items")

    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2') 
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  describe '#initialize' do
    it "exists and has attributes" do
      expect(@cart).to be_an_instance_of ShoppingCart
      
      expect(@cart.name).to eq 'King Soopers'
      expect(@cart.name).to be_a String

      expect(@cart.capacity).to eq 30
      expect(@cart.capacity).to be_a Integer

      expect(@cart.products).to be_empty
      expect(@cart.products).to be_a Array
    end
  end

  describe '#add_products(product)' do
    it "can add a product to @products attribute" do
      @cart.add_product(@product1)
      @cart.add_product(@product2)

      expect(@cart.products).to eq([@product1, @product2])
    end
  end

  describe '#details' do
    it 'returns hash with the shopping cart details' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)

      expected = {
        name: "King Soopers", capacity: 30
      }
      expect(@cart.details).to eq expected
    end
  end

  describe '#total_number_of_products' do
    it 'returns hash with the shopping cart products' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)

      expect(@cart.total_number_of_products).to eq 13
    end
  end

  describe '#is_full?' do
    before :each do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
    end

    it 'returns false if @capacity is equal to total products' do
      expect(@cart.is_full?).to eq false
    end

    it 'returns false if @capacity is not equal to total products' do
      @cart.add_product(@product4)
      expect(@cart.is_full?).to eq true
    end
  end

  describe '#products_by_category(products)' do
    it 'can sort @products array by category' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      @cart.add_product(@product4)
      expect(@cart.products_by_category(:paper)).to be_a Array
      expect(@cart.products_by_category(:paper)).to eq [@product1, @product3]
    end
  end
    
end
