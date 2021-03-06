class CreateUserMatches < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "user_matches"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "match_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (match_id) REFERENCES "matches" (id));
    SQL
  end
end
