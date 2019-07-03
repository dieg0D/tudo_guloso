class CreateComments < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "comments"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "content" VARCHAR,
        "recipe_id" INTEGER,
        "user_id" INTEGER,
        FOREIGN KEY (recipe_id) REFERENCES "recipes" (id),
        FOREIGN KEY (user_id) REFERENCES "users" (id));
    SQL
  end
end
