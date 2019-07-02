class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "messages"(
        "id" SERIAL PRIMARY KEY  NOT NULL);
    SQL
  end
end
