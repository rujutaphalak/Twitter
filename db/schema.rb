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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150917000538) do

  create_table "follows", id: false, force: :cascade do |t|
    t.integer "follower_id", limit: 8, null: false
    t.integer "followee_id", limit: 8, null: false
  end

  add_index "follows", ["follower_id"], name: "follower_id", using: :btree

  create_table "tweets", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 8,     null: false
    t.text    "post",    limit: 65535, null: false
  end

  add_index "tweets", ["user_id"], name: "user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "name",     limit: 50,  null: false
    t.string "username", limit: 100, null: false
    t.string "password", limit: 100, null: false
  end

  add_foreign_key "follows", "users", column: "follower_id", name: "follows_ibfk_1", on_delete: :cascade
  add_foreign_key "tweets", "users", name: "tweets_ibfk_1", on_delete: :cascade
end
