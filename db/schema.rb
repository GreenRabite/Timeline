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

ActiveRecord::Schema.define(version: 20181201231255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "family_trees", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "family_image"
    t.index ["user_id"], name: "index_family_trees_on_user_id"
  end

  create_table "location_records", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "location", null: false
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.date "birthday"
    t.date "deathday"
    t.integer "family_tree_id"
    t.string "gender"
    t.string "profile_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "middle_name"
    t.index ["family_tree_id"], name: "index_people_on_family_tree_id"
    t.index ["first_name"], name: "index_people_on_first_name"
    t.index ["last_name"], name: "index_people_on_last_name"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "alpha_id", null: false
    t.integer "beta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "relationship_type"
    t.index ["alpha_id"], name: "index_relationships_on_alpha_id"
    t.index ["beta_id"], name: "index_relationships_on_beta_id"
  end

end
