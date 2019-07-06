CREATE DATABASE tudo_guloso_development;

CREATE TABLE "users"(
      "id" SERIAL PRIMARY KEY  NOT NULL,
      "name" VARCHAR NOT NULL,
      "email" VARCHAR UNIQUE NOT NULL,
      "city" VARCHAR,
      "street" VARCHAR,
      "age" DATE,
      "profile_pic" BYTEA,
      "password_digest" VARCHAR);

CREATE TABLE "match_types"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "match_type" VARCHAR);

CREATE TABLE "matches"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "match_type_id" INTEGER,
        FOREIGN KEY (match_type_id) REFERENCES "match_types" (id));

CREATE TABLE "messages"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "match_id" INTEGER,
        "message_content" VARCHAR,
        FOREIGN KEY (match_id) REFERENCES "matches" (id));

CREATE TABLE "dishes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR);

CREATE TABLE "user_dishes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "dish_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (dish_id) REFERENCES "dishes" (id));

CREATE TABLE "user_matches"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "match_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (match_id) REFERENCES "matches" (id));

CREATE TABLE "dietary_restritions"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "description" VARCHAR);

CREATE TABLE "user_dietary_restritions"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "dietary_restrition_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (dietary_restrition_id) REFERENCES "dietary_restritions" (id));

CREATE TABLE "recipes"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR,
        "photo_recipe" BYTEA,
        "instructions" VARCHAR,
        "user_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id));

CREATE TABLE "ingredients"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "name" VARCHAR);

CREATE TABLE "recipe_ingredients"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "recipe_id" INTEGER,
        "ingrediente" INTEGER,
        "qtd" VARCHAR,
        FOREIGN KEY (recipe_id) REFERENCES "recipes" (id),
        FOREIGN KEY (ingrediente) REFERENCES "ingredients" (id));

CREATE TABLE "comments"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "content" VARCHAR,
        "recipe_id" INTEGER,
        "user_id" INTEGER,
        FOREIGN KEY (recipe_id) REFERENCES "recipes" (id),
        FOREIGN KEY (user_id) REFERENCES "users" (id));

CREATE TABLE "favorites"(
        "id" SERIAL PRIMARY KEY  NOT NULL,
        "user_id" INTEGER,
        "recipe_id" INTEGER,
        FOREIGN KEY (user_id) REFERENCES "users" (id),
        FOREIGN KEY (recipe_id) REFERENCES "recipes" (id));

CREATE TABLE "categories"(
      "id" SERIAL PRIMARY KEY  NOT NULL,
      "name" VARCHAR NOT NULL); 