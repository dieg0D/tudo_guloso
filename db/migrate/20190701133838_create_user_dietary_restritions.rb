class CreateUserDietaryRestritions < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "user_dietary_restritions"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "dietary_restrition_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (dietary_restrition_id) REFERENCES "dietary_restritions" (id));
    SQL
  end
end
