require "base64"

class Recipe < ApplicationRecord
  def all_recipes
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "recipes";
    SQL
    result = JSON.parse(result.to_json)
    @recipes = []
    result.each do |recipe|
      @recipes.push(Recipe.new(id: recipe["id"], name: recipe["name"], photo_recipe: recipe["photo_recipe"], instructions: recipe["instructions"]))
    end
    return @recipes
  end
  
  def create_recipe
    @image   = Base64.strict_encode64(self.photo_recipe.read.to_s)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    INSERT INTO "recipes" (name, photo_recipe, instructions, dish_id, user_id) VALUES ('#{self.name}', '#{@image}', '#{self.instructions}', '#{self.dish_id}', '#{self.user_id}');
    SQL
    return true
  end

  def find_recipe(id)
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "recipes" WHERE id = '#{id}';
    SQL
    result = JSON.parse(result.to_json)[0]
    return Recipe.new(id: result["id"], name: result["name"], photo_recipe: result["photo_recipe"], instructions: result["instructions"])
  end

  def update_recipe(name, photo_recipe, instructions, dish_id, user_id, id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    UPDATE "recipes" SET name = '#{name}', photo_recipe = '#{photo_recipe}', instructions = '#{instructions}', dish_id = '#{dish_id}', user_id = '#{user_id}' WHERE id = '#{id}';
    SQL
  end

  def delete_recipe(id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    DELETE FROM "recipes" WHERE id = '#{id}';
    SQL
  end
end
