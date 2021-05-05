require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @product = Product.new(
        name: 'Snakeskin Fedora',
        price: 300,
        quantity: 5,
        category: Category.new(
          name: 'Apparel'
        )
      )
    end

    it 'is valid with all fields present' do
      expect(@product).to be_valid
    end

    it 'is invalid if name is not present' do
      @product.name = nil
      @product.save

      expect(@product).to be_invalid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'is invalid if price is not present' do
      @product.price_cents = nil
      @product.save

      expect(@product).to be_invalid
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it 'is invalid if quantity is not present' do
      @product.quantity = nil
      @product.save

      expect(@product).to be_invalid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'is invalid if cateogory is not present' do
      @product.category = nil
      @product.save

      expect(@product).to be_invalid
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end
    
  end
end
