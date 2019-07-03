class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "recipe_ingredients"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "recipe_id" INTEGER,
        "ingrediente" INTEGER,
        "qtd" VARCHAR,
        FOREIGN KEY (recipe_id) REFERENCES "recipes" (id),
        FOREIGN KEY (ingrediente) REFERENCES "ingredients" (id));
    SQL
  end
end
