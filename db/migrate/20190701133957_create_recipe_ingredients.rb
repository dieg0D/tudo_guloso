class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "recipe_ingredients"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
