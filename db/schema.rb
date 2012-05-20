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

ActiveRecord::Schema.define(:version => 20120520025509) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "project_id", :null => false
    t.string   "message",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["project_id"], :name => "index_comments_on_project_id"

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "follows", ["project_id"], :name => "index_follows_on_project_id"
  add_index "follows", ["user_id", "project_id"], :name => "index_follows_on_user_id_and_project_id", :unique => true

  create_table "mobli_profiles", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "atoken"
    t.string   "asecret"
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mobli_profiles", ["key"], :name => "index_mobli_profiles_on_key", :unique => true
  add_index "mobli_profiles", ["user_id"], :name => "index_mobli_profiles_on_user_id", :unique => true

  create_table "occupations", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_tags", :force => true do |t|
    t.integer "project_id", :null => false
    t.integer "tag_id",     :null => false
  end

  add_index "project_tags", ["project_id", "tag_id"], :name => "index_project_tags_on_project_id_and_tag_id", :unique => true
  add_index "project_tags", ["project_id"], :name => "index_project_tags_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "summary",                                 :null => false
    t.text     "details"
    t.integer  "owner_id",                                :null => false
    t.boolean  "active",                :default => true, :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_last_updated_at"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "key",  :null => false
    t.string "name", :null => false
  end

  add_index "roles", ["key"], :name => "index_roles_on_key", :unique => true
  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "role_id", :null => false
  end

  add_index "user_roles", ["user_id", "role_id"], :name => "index_user_roles_on_user_id_and_role_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email",                                                                   :null => false
    t.string   "hashed_password"
    t.boolean  "active",                                                :default => true, :null => false
    t.decimal  "latitude",              :precision => 15, :scale => 10
    t.decimal  "longitude",             :precision => 15, :scale => 10
    t.datetime "last_position_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_last_updated_at"
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.integer  "occupation_id"
    t.string   "salt"
  end

end
