require './lib/product'

RSpec.describe Product do

  before :each do
    @product = Product.new(:paper, 'toilet paper', 3.70, 10)
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@product).to be_an_instance_of Product
    end

    it 'has attributes' do
      expect(@product.category).to eq :paper
      expect(@product.category).to be_a Symbol

      expect(@product.name).to eq 'toilet paper'
      expect(@product.name).to be_a String

      expect(@product.unit_price).to eq 3.70
      expect(@product.unit_price).to be_a Float

      expect(@product.quantity).to eq 10
      expect(@product.quantity).to be_a Integer

      expect(@product.hoarded).to eq false
    end
  end

  describe '#total_price' do
    it 'multiplies unit_price and quantity to get total' do
      expect(@product.total_price).to eq 37.0
      expect(@product.total_price).to be_a Float

      expect(@product2.total_price).to eq 9.0
      expect(@product2.total_price).to be_a Float
    end
  end

  describe '#is_hoarded?' do
    it 'returns boolean, determines if product hoard' do
      expect(@product.is_hoarded?).to eq false

      @product.hoard

      expect(@product.is_hoarded?).to eq true
    end
  end
end
