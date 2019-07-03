class CreateDietaryRestritions < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "dietary_restritions"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "description" VARCHAR);
    SQL
  end
end
