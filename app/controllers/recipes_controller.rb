class RecipesController < ApplicationController
  before_action :authorize
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.new.all_recipes
  end

  def show
  end

  def new
    @dishes = Dish.new.all_dishes
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.create_recipe
      redirect_to recipes_path, notice: "Receita criada com sucesso"
    else
      render action: :new
    end
  end

  def edit
    @dishes = Dish.new.all_dishes
    @recipes = Recipe.new.all_recipes
  end

  def update
    if @recipe.update_recipe(params[:recipe][:name], params[:recipe][:photo_recipe], params[:recipe][:instructions], params[:recipe][:dishe_id], params[:recipe][:user_id], @recipe.id)
      respond_to recipe_path(@recipe.id)
    else
      render action: :edit
    end
  end

  def destroy
    @recipe.delete_recipe(@recipe.id)
    redirect_to recipes_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.new().find_recipe(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :photo_recipe, :instructions, :dish_id, :user_id)
    end
end
