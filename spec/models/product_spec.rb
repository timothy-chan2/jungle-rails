require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully if name, price, quantity, and category are set' do
      @category = Category.new(name: 'Cat1')
      @product = Product.new(name: 'Item 1', price: 26.00, quantity: 5, category: @category)
      # Use bang here b/c we want our spec to fail if save fails (due to validations)
      @product.save!

      expect(@product.id).to be_present
    end

    it 'should not save if the name is not entered' do
      @category = Category.new(name: 'Cat1')
      @product = Product.new(price: 26.00, quantity: 5, category: @category)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should not save if the price is not entered' do
      @category = Category.new(name: 'Cat1')
      @product = Product.new(name: 'Item 1', quantity: 5, category: @category)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'should not save if the quantity is not entered' do
      @category = Category.new(name: 'Cat1')
      @product = Product.new(name: 'Item 1', price: 26.00, category: @category)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should not save if the category is not entered' do
      @product = Product.new(name: 'Item 1', price: 26.00, quantity: 5)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end
  end
end
