class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def show
    @product_count = Product.select('id', 'name', 'quantity')
    puts 'PRODUCT COUNT -------', @product_count.inspect
    @category_count = Category.select('id', 'name')
    puts 'CATEGORY COUNT --------', @category_count.inspect
  end
end
