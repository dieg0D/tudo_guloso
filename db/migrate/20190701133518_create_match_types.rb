class CreateMatchTypes < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "match_types"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "match_type" VARCHAR);
    SQL
  end
end
