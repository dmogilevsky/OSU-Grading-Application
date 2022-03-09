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

ActiveRecord::Schema.define(version: 2022_03_09_000302) do

  create_table "courses", force: :cascade do |t|
    t.integer "CourseID"
    t.text "subject"
    t.integer "CourseNumber"
    t.text "CourseName"
    t.integer "Units"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "SectionID"
    t.integer "CourseID"
    t.integer "SectionNumber"
    t.text "Campus"
    t.integer "Year"
    t.text "Term"
  end

end
