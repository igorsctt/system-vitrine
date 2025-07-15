class Admin::DashboardController < Admin::BaseController
  def show
    @total_products = Product.count
    @active_products = Product.active.count
    @inactive_products = Product.inactive.count
    @total_categories = Category.count
    @categories_with_products = Category.joins(:products).distinct.count
    @top_categories = Category.joins(:products)
                             .group('categories.name')
                             .order('COUNT(products.id) DESC')
                             .limit(5)
                             .count
  end
end
