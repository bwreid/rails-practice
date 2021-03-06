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

ActiveRecord::Schema.define(:version => 20130315180417) do

  create_table "administrators", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "role"
    t.string   "ssn"
    t.string   "phone"
  end

  create_table "subscribers", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "tagline"
    t.string   "bio"
    t.string   "preferences"
    t.integer  "age"
    t.string   "gender"
    t.string   "occupation"
    t.string   "location"
    t.string   "status"
    t.string   "ethnicity"
    t.string   "interests"
    t.decimal  "income"
    t.integer  "subscription_id"
    t.date     "expires"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "plan"
    t.integer  "duration"
    t.decimal  "cost"
    t.integer  "num_photos", :default => 0
    t.integer  "num_emails", :default => 0
    t.integer  "num_texts",  :default => 0
    t.boolean  "is_alist",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "userable_id"
    t.string   "userable_type"
  end

end
