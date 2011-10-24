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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111024045809) do

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username",          :null => false
    t.string   "email"
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "nick_name"
  end

  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

  create_table "users_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.string   "state_province"
    t.string   "country"
    t.string   "zip_code"
    t.string   "zip_privacy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_educations", :force => true do |t|
    t.integer  "user_id"
    t.string   "high_school_institution"
    t.string   "college_university_institution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.boolean  "show_gender"
    t.date     "birthday_date"
    t.boolean  "show_birthday"
    t.string   "homepage"
    t.string   "hometown"
    t.string   "languages"
    t.string   "about_me"
    t.string   "relationship"
    t.string   "relationship_with"
    t.boolean  "relationship_confirmed"
    t.string   "interest"
    t.string   "religion"
    t.string   "religion_description"
    t.string   "political_views"
    t.string   "political_description"
    t.string   "people_who_inspire_you"
    t.string   "favorite_quotations"
    t.string   "music"
    t.string   "movies"
    t.string   "books"
    t.string   "television"
    t.string   "games"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_phones", :force => true do |t|
    t.integer  "user_id"
    t.string   "mobile_type"
    t.string   "mobile_number"
    t.string   "findeble"
    t.boolean  "visiblity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_profile_pictures", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users_settings", :force => true do |t|
    t.integer  "user_id"
    t.string   "timezone"
    t.string   "language"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_works", :force => true do |t|
    t.integer  "user_id"
    t.string   "employer"
    t.string   "position"
    t.string   "description"
    t.string   "city"
    t.string   "state_province"
    t.string   "country"
    t.boolean  "current_job"
    t.date     "start_in"
    t.date     "end_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
