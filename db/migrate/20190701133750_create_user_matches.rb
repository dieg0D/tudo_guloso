class CreateUserMatches < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "user_matches"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
