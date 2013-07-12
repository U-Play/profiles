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

ActiveRecord::Schema.define(:version => 20130702113353) do

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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "abbrv_iso"
    t.datetime "deleted_at"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "universities", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.text     "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "phone"
    t.text     "web_address"
    t.datetime "deleted_at"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "first_name",                           :default => "",    :null => false
    t.string   "last_name",                            :default => "",    :null => false
    t.date     "birth_date"
    t.text     "bio"
    t.string   "facebook_link"
    t.string   "twitter_handle"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "country_id"
    t.integer  "university_id"
    t.datetime "deleted_at"
    t.boolean  "profile_finished",                     :default => false
  end

  add_index "users", ["country_id"], :name => "index_users_on_country_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token", :unique => true
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["university_id"], :name => "index_users_on_university_id"

end
