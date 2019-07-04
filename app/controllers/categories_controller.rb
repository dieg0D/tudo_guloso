class CategoriesController < ApplicationController
  before_action :authorize
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.new.all_categories
  end

  def show
  
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.create_category
      redirect_to categories_path, notice: "Usuário foi criado com sucesso!"
    else 
      render action: :new
    end
  end

  def edit
  end

  def update
    if @category.update_category(params[:category][:name], @category.id)
      redirect_to category_path(@category.id)
    else
      render action: :edit
    end
  end

  def destroy
    @category.delete_category(@category.id)
    redirect_to categories_path
  end

  private
  
    def set_category
      @category = Category.new().find_category(params[:id]) 
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
