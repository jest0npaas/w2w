# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_24_000252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "already_watched_movies_by_users", force: :cascade do |t|
    t.float "personal_rating"
    t.string "remarks"
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_already_watched_movies_by_users_on_movie_id"
    t.index ["user_id"], name: "index_already_watched_movies_by_users_on_user_id"
  end

  create_table "favorite_movies_by_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_favorite_movies_by_users_on_movie_id"
    t.index ["user_id"], name: "index_favorite_movies_by_users_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "api_movie_id"
    t.float "api_rating"
    t.date "watch_date"
    t.string "remarks"
    t.float "personal_rating"
    t.string "poster"
    t.boolean "is_favorite"
    t.boolean "is_soon_to_watch"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "soon_to_watch_movies_by_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_soon_to_watch_movies_by_users_on_movie_id"
    t.index ["user_id"], name: "index_soon_to_watch_movies_by_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "already_watched_movies_by_users", "movies"
  add_foreign_key "already_watched_movies_by_users", "users"
  add_foreign_key "favorite_movies_by_users", "movies"
  add_foreign_key "favorite_movies_by_users", "users"
  add_foreign_key "movies", "users"
  add_foreign_key "soon_to_watch_movies_by_users", "movies"
  add_foreign_key "soon_to_watch_movies_by_users", "users"
end
