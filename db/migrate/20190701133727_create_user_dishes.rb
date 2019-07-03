class CreateUserDishes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "user_dishes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "dish_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (dish_id) REFERENCES "dishes" (id));
    SQL
  end
end
