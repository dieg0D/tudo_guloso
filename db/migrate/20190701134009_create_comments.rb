class CreateComments < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "comments"(
        "id" SERIAL PRIMARY KEY  NOT NULL
    SQL
    end
  end
end
