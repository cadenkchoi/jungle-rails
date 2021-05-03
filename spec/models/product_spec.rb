require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with valid attributes' do
      @category = Category.new
        params = {
        name: 'rock',
        description: 'big rock',
        quantity: 5,
        category: @category,
        price_cents: 1000
        }
      expect(Product.new(params)).to be_valid
    end

    it 'is valid with valid name' do
      @category = Category.new
      params = {
        name: nil,
        description: 'small rock',
        quantity: 4,
        category: @category,
        price_cents: 2000
      }
      expect(Product.new(params)).to_not be_valid
    end

    it 'is valid with valid price' do
      @category = Category.new
      params = {
        name: 'John',
        description: 'medium rock',
        quantity: 7,
        category: @category,
        price_cents: nil
      }
      expect(Product.new(params)).to_not be_valid
    end

    it 'is valid with valid quantity' do
      @category = Category.new
      params = {
        name: 'John',
        description: 'tiny rock',
        quantity: nil,
        category: @category,
        price_cents: 1500
      }
      expect(Product.new(params)).to_not be_valid
    end

    it 'is valid with valid category' do
      @category = Category.new
      params = {
        name: 'John',
        description: 'BIG rock',
        quantity: 7,
        category: nil,
        price_cents: 1500
      }
      expect(Product.new(params)).to_not be_valid
    end

  end
end