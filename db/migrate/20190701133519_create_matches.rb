class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "matches"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "match_type_id" INTEGER,
        FOREIGN KEY (match_type_id) REFERENCES "match_types" (id));
    SQL
  end
end
