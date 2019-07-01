class CreateUserDishes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "user_dishes"(
        "id" SERIAL PRIMARY KEY  NOT NULL
    SQL
    end
  end
end
