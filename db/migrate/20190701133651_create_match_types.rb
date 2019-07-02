class CreateMatchTypes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "match_types"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
