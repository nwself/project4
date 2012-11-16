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

ActiveRecord::Schema.define(:version => 20121115030206) do

  create_table "bugs", :force => true do |t|
    t.string   "title"
    t.string   "task_or_bug"
    t.string   "status"
    t.string   "priority"
    t.float    "percentage_completed"
    t.date     "due_date"
    t.date     "estimated_date"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "project_resource_rels", :force => true do |t|
    t.integer  "project_id"
    t.integer  "resource_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.string   "permissions"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "task_bugs", :force => true do |t|
    t.string   "title"
    t.string   "status"
    t.string   "priority"
    t.date     "due_date"
    t.date     "estimated_date"
    t.float    "percentage_completed"
    t.string   "task_or_bug"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "task_user_proj_rels", :force => true do |t|
    t.integer  "task_bug_id"
    t.integer  "user_project_rel_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "task_user_proj_rels", ["task_bug_id"], :name => "index_task_user_proj_rels_on_task_bug_id"
  add_index "task_user_proj_rels", ["user_project_rel_id"], :name => "index_task_user_proj_rels_on_user_project_rel_id"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.string   "task_or_bug"
    t.string   "status"
    t.string   "priority"
    t.float    "percentage_completed"
    t.date     "due_date"
    t.date     "estimated_date"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "user_project_rels", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_project_rels", ["project_id"], :name => "index_user_project_rels_on_project_id"
  add_index "user_project_rels", ["user_id"], :name => "index_user_project_rels_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
