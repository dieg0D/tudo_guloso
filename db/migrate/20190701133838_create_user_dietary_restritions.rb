class CreateUserDietaryRestritions < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "user_dietary_restritions"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
