class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "matches"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
