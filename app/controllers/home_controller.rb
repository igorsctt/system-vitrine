class HomeController < ApplicationController
  def index
    @featured_products = Product.active.includes(:category, main_image_attachment: :blob).limit(6)
    @categories = Category.with_active_products.order(:name)
  end
end
