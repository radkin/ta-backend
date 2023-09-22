# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_22_225721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coordinates", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dobs", force: :cascade do |t|
    t.string "date"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postcode"
    t.bigint "coordinates_id", null: false
    t.bigint "timezone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinates_id"], name: "index_locations_on_coordinates_id"
    t.index ["timezone_id"], name: "index_locations_on_timezone_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "uuid"
    t.string "username"
    t.string "password"
    t.string "salt"
    t.string "md5"
    t.string "sha1"
    t.string "sha256"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "names", force: :cascade do |t|
    t.string "title"
    t.string "first"
    t.string "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "large"
    t.string "medium"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "random_users", force: :cascade do |t|
    t.string "gender"
    t.bigint "name_id", null: false
    t.bigint "location_id", null: false
    t.string "email"
    t.bigint "login_id", null: false
    t.bigint "dob_id", null: false
    t.bigint "registered_id", null: false
    t.string "phone"
    t.string "cell"
    t.bigint "ruid_id", null: false
    t.bigint "picture_id", null: false
    t.string "nat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dob_id"], name: "index_random_users_on_dob_id"
    t.index ["location_id"], name: "index_random_users_on_location_id"
    t.index ["login_id"], name: "index_random_users_on_login_id"
    t.index ["name_id"], name: "index_random_users_on_name_id"
    t.index ["picture_id"], name: "index_random_users_on_picture_id"
    t.index ["registered_id"], name: "index_random_users_on_registered_id"
    t.index ["ruid_id"], name: "index_random_users_on_ruid_id"
  end

  create_table "registereds", force: :cascade do |t|
    t.string "date"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruids", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streets", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timezones", force: :cascade do |t|
    t.string "offset"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "locations", "coordinates", column: "coordinates_id"
  add_foreign_key "locations", "timezones"
  add_foreign_key "random_users", "dobs"
  add_foreign_key "random_users", "locations"
  add_foreign_key "random_users", "logins"
  add_foreign_key "random_users", "names"
  add_foreign_key "random_users", "pictures"
  add_foreign_key "random_users", "registereds"
  add_foreign_key "random_users", "ruids"
end
