class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "ingredients"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR);
    SQL
  end
end
