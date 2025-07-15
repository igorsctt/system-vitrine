class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.active.includes(:category, main_image_attachment: :blob)
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @categories = Category.with_active_products.order(:name)
    @current_category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def show
    # Produtos relacionados da mesma categoria
    @related_products = Product.active
                              .where(category: @product.category)
                              .where.not(id: @product.id)
                              .includes(:category, main_image_attachment: :blob)
                              .limit(4)
  end

  private

  def set_product
    @product = Product.active.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: 'Produto não encontrado.'
  end
end
