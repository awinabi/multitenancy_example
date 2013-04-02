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

ActiveRecord::Schema.define(:version => 20130402093352) do

  create_table "blogs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "tenant_id"
  end

  add_index "blogs", ["tenant_id"], :name => "index_blogs_on_tenant_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "tenant_id"
  end

  add_index "comments", ["tenant_id"], :name => "index_comments_on_tenant_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "blog_id"
    t.integer  "tenant_id"
  end

  add_index "posts", ["tenant_id"], :name => "index_posts_on_tenant_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tenants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "tenant_id"
  end

  add_index "tenants", ["tenant_id"], :name => "index_tenants_on_tenant_id"

  create_table "tenants_users", :id => false, :force => true do |t|
    t.integer "tenant_id"
    t.integer "user_id"
  end

  add_index "tenants_users", ["tenant_id"], :name => "index_tenants_users_on_tenant_id"
  add_index "tenants_users", ["user_id"], :name => "index_tenants_users_on_user_id"

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
    t.string   "twitter_url"
    t.string   "github_url"
    t.string   "name"
    t.integer  "tenant_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["tenant_id"], :name => "index_users_on_tenant_id"

end
