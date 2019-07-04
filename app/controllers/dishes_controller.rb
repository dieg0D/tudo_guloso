class DishesController < ApplicationController
  before_action :authorize
  before_action :set_dish, only: [:edit, :show, :update, :destroy]

  def index
    @dishes = Dish.new.all_dishes
  end

  def show
  
  end

  def new
    @categories = Category.new.all_categories
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.create_dish
      redirect_to dishes_path, notice: "Usuário foi criado com sucesso!"
    else 
      render action: :new
    end
  end

  def edit
    @categories = Category.new.all_categories
  end

  def update
    if @dish.update_dish(params[:dish][:name], params[:dish][:category_id], @dish.id)
      redirect_to dish_path(@dish.id)
    else
      render action: :edit
    end
  end

  def destroy
    @dish.delete_dish(@dish.id)
    redirect_to dishes_path
  end

  private
  
    def set_dish
      @dish = Dish.new().find_dish(params[:id]) 
    end

    def dish_params
      params.require(:dish).permit(:name, :category_id)
    end
end
