require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save successfully when all fields are set" do
        @category = Category.new(name: 'Test')
        @product = Product.new(name: 'Product Name', price: 10.99, quantity: 5, category: @category)
        expect(@product).to be_valid
    end

    it 'should not save without a name' do
      @category = Category.new(name: 'Test Category')
      @product = Product.new(price: 10.99, quantity: 5, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save without a price' do
      category = Category.new(name: 'Test Category')
      product = Product.new(name: 'Product Name', quantity: 5, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save without a quantity' do
      category = Category.new(name: 'Test Category')
      product = Product.new(name: 'Product Name', price: 10.99, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save without a category' do
      product = Product.new(name: 'Product Name', price: 10.99, quantity: 5)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
