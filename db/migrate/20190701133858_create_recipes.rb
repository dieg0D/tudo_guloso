class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "recipes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR,
        "photo_recipe" BYTEA,
        "instructions" VARCHAR,
        "user_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id));
    SQL
  end
end
