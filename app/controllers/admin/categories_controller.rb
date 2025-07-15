class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.includes(:products).order(:name)
  end

  def show
    @products = @category.products.order(:name)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to admin_categories_path, notice: 'Categoria criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Categoria atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.products.any?
      redirect_to admin_categories_path, alert: 'Não é possível excluir categoria com produtos associados.'
    else
      @category.destroy
      redirect_to admin_categories_path, notice: 'Categoria excluída com sucesso.'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
