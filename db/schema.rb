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

ActiveRecord::Schema.define(version: 2019_01_14_175540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admin_users_tags", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.bigint "tag_id"
    t.index ["admin_user_id"], name: "index_admin_users_tags_on_admin_user_id"
    t.index ["tag_id"], name: "index_admin_users_tags_on_tag_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.bigint "offer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_comments_on_offer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "original_price"
    t.float "actual_price"
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "offers_tags", force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "tag_id"
    t.index ["offer_id"], name: "index_offers_tags_on_offer_id"
    t.index ["tag_id"], name: "index_offers_tags_on_tag_id"
  end

  create_table "offers_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "offer_id"
    t.index ["offer_id"], name: "index_offers_users_on_offer_id"
    t.index ["user_id"], name: "index_offers_users_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tag_id"
    t.index ["tag_id"], name: "index_tags_users_on_tag_id"
    t.index ["user_id"], name: "index_tags_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "offers"
  add_foreign_key "comments", "users"
  add_foreign_key "offers", "users"
end
