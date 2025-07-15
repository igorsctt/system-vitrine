class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.includes(:category).order(:name)
    @products = @products.where(active: params[:status] == 'active') if params[:status] == 'active'
    @products = @products.where(active: false) if params[:status] == 'inactive'
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.order(:name)
  end

  def create
    @product = Product.new(product_params)
    @categories = Category.order(:name)
    
    if @product.save
      redirect_to admin_products_path, notice: 'Produto criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.order(:name)
  end

  def update
    @categories = Category.order(:name)
    
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Produto atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Produto excluído com sucesso.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :active, :category_id, :main_image)
  end
end
