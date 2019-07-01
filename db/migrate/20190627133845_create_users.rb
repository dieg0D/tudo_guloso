class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL 
      CREATE TABLE "users"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR NOT NULL,
        "email" VARCHAR UNIQUE NOT NULL,
        "city" VARCHAR,
        "street" VARCHAR,
        "age" INTEGER,
        "profile_pic" BYTEA,
        "password_digest" VARCHAR);
    SQL
  end
end
