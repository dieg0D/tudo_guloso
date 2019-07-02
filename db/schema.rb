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

ActiveRecord::Schema.define(version: 2019_07_01_134009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :serial, force: :cascade do |t|
  end

  create_table "dietary_restritions", id: :serial, force: :cascade do |t|
  end

  create_table "dishes", id: :serial, force: :cascade do |t|
  end

  create_table "ingredients", id: :serial, force: :cascade do |t|
  end

  create_table "match_types", id: :serial, force: :cascade do |t|
  end

  create_table "matches", id: :serial, force: :cascade do |t|
  end

  create_table "messages", id: :serial, force: :cascade do |t|
  end

  create_table "recipe_ingredients", id: :serial, force: :cascade do |t|
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
  end

  create_table "user_dietary_restritions", id: :serial, force: :cascade do |t|
  end

  create_table "user_dishes", id: :serial, force: :cascade do |t|
  end

  create_table "user_matches", id: :serial, force: :cascade do |t|
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "city"
    t.string "street"
    t.integer "age"
    t.binary "profile_pic"
    t.string "password_digest"
    t.index ["email"], name: "users_email_key", unique: true
  end

end
