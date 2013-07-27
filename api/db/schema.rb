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

ActiveRecord::Schema.define(:version => 20130727030220) do

  create_table "chains", :force => true do |t|
    t.integer  "goal_id"
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "goals", :force => true do |t|
    t.text     "description"
    t.text     "name",        :null => false
    t.datetime "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "chain_id"
    t.datetime "begin"
    t.integer  "duration"
    t.datetime "completed_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end