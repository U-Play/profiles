# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20131007173559) do

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "link"
    t.string   "image_url"
    t.date     "birth_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
    t.string   "gender"
  end

  create_table "experiences", :force => true do |t|
    t.string   "position"
    t.string   "team"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "ongoing",       :default => false
    t.integer  "sport_role_id",                    :null => false
    t.integer  "sport_id",                         :null => false
    t.integer  "user_id",                          :null => false
    t.datetime "deleted_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "experiences", ["sport_id"], :name => "index_experiences_on_sport_id"
  add_index "experiences", ["sport_role_id"], :name => "index_experiences_on_sport_role_id"
  add_index "experiences", ["user_id"], :name => "index_experiences_on_user_id"

  create_table "icons", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sport_roles", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.text     "achievements",  :default => ""
    t.date     "award_date"
    t.integer  "experience_id",                 :null => false
    t.datetime "deleted_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "icon_id"
    t.integer  "award_year",                    :null => false
    t.integer  "award_month"
  end

  add_index "tournaments", ["experience_id"], :name => "index_tournaments_on_experience_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "facebook_link"
    t.string   "twitter_handle"
    t.string   "country"
    t.string   "university"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "deleted_at"
    t.boolean  "profile_complete",       :default => false
    t.string   "token",                                     :null => false
    t.integer  "referral_views",         :default => 0,     :null => false
    t.integer  "referral_subscriptions", :default => 0,     :null => false
    t.string   "gender"
    t.string   "username",               :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
