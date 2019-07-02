class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "dishes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR);
    SQL
  end
end