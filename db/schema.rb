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

ActiveRecord::Schema.define(version: 2021_01_21_153855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holiday_homes", force: :cascade do |t|
    t.string "title", null: false
    t.string "owner", default: ""
    t.string "manager", default: ""
    t.text "address", null: false
    t.string "image_url", default: ""
    t.text "description"
    t.string "email", default: ""
    t.string "phone", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.integer "price"
    t.integer "rating"
  end

end
