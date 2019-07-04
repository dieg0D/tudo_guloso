class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
    CREATE TABLE "categories"(
      "id" SERIAL PRIMARY KEY  NOT NULL,
      "name" VARCHAR NOT NULL);
    SQL
  end
end

