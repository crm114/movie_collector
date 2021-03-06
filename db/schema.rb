# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090623175149) do

  create_table "box_office_films", :force => true do |t|
    t.string   "title"
    t.text     "url"
    t.string   "amount"
    t.text     "ticket_url"
    t.integer  "position"
    t.date     "release_date"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "format"
    t.string   "asin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "thumbnail"
    t.text     "image"
    t.text     "image_link"
    t.date     "release_date"
    t.string   "genre"
    t.string   "upc"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "token",              :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.integer  "facebook_id",        :limit => 20
    t.string   "session_key"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id", :unique => true
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["token"], :name => "index_users_on_token"

  create_table "users_movies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "private"
    t.integer  "borrower_id"
  end

  add_index "users_movies", ["borrower_id"], :name => "index_users_movies_on_borrower_id"
  add_index "users_movies", ["movie_id"], :name => "index_users_movies_on_movie_id"
  add_index "users_movies", ["user_id"], :name => "index_users_movies_on_user_id"

end
