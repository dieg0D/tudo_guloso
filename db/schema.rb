# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_03_195942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "content"
    t.integer "recipe_id"
    t.integer "user_id"
  end

  create_table "dietary_restritions", id: :serial, force: :cascade do |t|
    t.string "description"
  end

  create_table "dishes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
  end

  create_table "favorites", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
  end

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "match_types", id: :serial, force: :cascade do |t|
    t.string "match_type"
  end

  create_table "matches", id: :serial, force: :cascade do |t|
    t.integer "match_type_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.integer "match_id"
    t.string "message_content"
  end

  create_table "recipe_ingredients", id: :serial, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingrediente"
    t.string "qtd"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.binary "photo_recipe"
    t.string "instructions"
    t.integer "user_id"
    t.integer "dish_id"
  end

  create_table "user_dietary_restritions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dietary_restrition_id"
  end

  create_table "user_dishes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dish_id"
  end

  create_table "user_matches", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "match_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "city"
    t.string "street"
    t.date "age"
    t.binary "profile_pic"
    t.string "password_digest"
    t.index ["email"], name: "users_email_key", unique: true
  end

  add_foreign_key "comments", "recipes", name: "comments_recipe_id_fkey"
  add_foreign_key "comments", "users", name: "comments_user_id_fkey"
  add_foreign_key "dishes", "categories", name: "dishes_category_id_fkey"
  add_foreign_key "favorites", "recipes", name: "favorites_recipe_id_fkey"
  add_foreign_key "favorites", "users", name: "favorites_user_id_fkey"
  add_foreign_key "matches", "match_types", name: "matches_match_type_id_fkey"
  add_foreign_key "messages", "matches", name: "messages_match_id_fkey"
  add_foreign_key "recipe_ingredients", "ingredients", column: "ingrediente", name: "recipe_ingredients_ingrediente_fkey"
  add_foreign_key "recipe_ingredients", "recipes", name: "recipe_ingredients_recipe_id_fkey"
  add_foreign_key "recipes", "dishes", name: "recipes_dish_id_fkey"
  add_foreign_key "recipes", "users", name: "recipes_user_id_fkey"
  add_foreign_key "user_dietary_restritions", "dietary_restritions", name: "user_dietary_restritions_dietary_restrition_id_fkey"
  add_foreign_key "user_dietary_restritions", "users", name: "user_dietary_restritions_user_id_fkey"
  add_foreign_key "user_dishes", "dishes", name: "user_dishes_dish_id_fkey"
  add_foreign_key "user_dishes", "users", name: "user_dishes_user_id_fkey"
  add_foreign_key "user_matches", "matches", name: "user_matches_match_id_fkey"
  add_foreign_key "user_matches", "users", name: "user_matches_user_id_fkey"
end
