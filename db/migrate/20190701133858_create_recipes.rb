class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "recipes"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
