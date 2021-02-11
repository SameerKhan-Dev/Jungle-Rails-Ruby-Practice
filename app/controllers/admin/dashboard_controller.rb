class Admin::DashboardController < ApplicationController
  before_filter :authorize 
  puts http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def show
    @totalProductsCount = Product.count
    @totalCategoriesCount = Category.count
  end
end
