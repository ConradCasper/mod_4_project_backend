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

ActiveRecord::Schema.define(version: 2019_08_20_164935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string "official_name"
    t.string "slogan", default: "Git Rich or Die Pryin'"
    t.string "start_date"
    t.string "end_date"
    t.string "location"
    t.string "image", default: "https://media.glassdoor.com/sqll/964142/flatiron-school-squarelogo-1479222088421.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course"
  end

  create_table "user_cohorts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_user_cohorts_on_cohort_id"
    t.index ["user_id"], name: "index_user_cohorts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio", default: "Flatiron School Alum."
    t.string "avatar", default: "https://pbs.twimg.com/profile_images/1149340751265980417/s0j8V4p3.png"
    t.string "location"
    t.string "project_1"
    t.string "project_2"
    t.string "github"
    t.string "twitter"
    t.string "facebook"
    t.string "linkedIn"
    t.string "email"
    t.string "current_employer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "user_cohorts", "cohorts"
  add_foreign_key "user_cohorts", "users"
end
