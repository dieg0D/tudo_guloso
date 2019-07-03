class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "messages"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "match_id" INTEGER,
        "message_content" VARCHAR,
        FOREIGN KEY (match_id) REFERENCES "matches" (id));
    SQL
  end
end
