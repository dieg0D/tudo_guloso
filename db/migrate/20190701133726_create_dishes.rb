class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "dishes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR,
        "category_id" INTEGER,
        FOREIGN KEY (category_id) REFERENCES "categories" (id));
    SQL
  end
end
