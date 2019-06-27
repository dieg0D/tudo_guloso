class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "users"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR NOT NULL,
        "email" VARCHAR UNIQUE NOT NULL,
        "password_digest" VARCHAR);
    SQL
  end
end
