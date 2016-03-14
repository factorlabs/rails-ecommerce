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

ActiveRecord::Schema.define(version: 20160314000049) do

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products_tags", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "product_id"
  end

  add_index "products_tags", ["product_id"], name: "index_products_tags_on_product_id"
  add_index "products_tags", ["tag_id"], name: "index_products_tags_on_tag_id"

  create_table "search_indices", force: :cascade do |t|
    t.string  "word"
    t.integer "product_id"
  end

  add_index "search_indices", ["product_id"], name: "index_search_indices_on_product_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
