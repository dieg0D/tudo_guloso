class PagesController < ApplicationController
  before_action :authorize, except: [:about]
  def index
    @recipes = Recipe.new.all_recipes
    @categories = Category.new.all_categories
    @objeto = Category.new.category_view
  end

  def about
  end

end
