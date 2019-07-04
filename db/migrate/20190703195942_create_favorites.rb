class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "favorites"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "recipe_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (recipe_id) REFERENCES "recipes" (id));
    SQL
  end
end
