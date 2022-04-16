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
    t.text "Subject"
    t.integer "CourseNumber"
    t.text "CourseName"
    t.text "Campus"
    t.text "Career"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "student_id"
    t.integer "instructor_id"
    t.text "Recommendation"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id"
    t.integer "SectionNumber"
    t.integer "MaxGraders", default: 1
    t.text "Term"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.binary "approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "recommendations", "users", column: "instructor_id"
  add_foreign_key "recommendations", "users", column: "student_id"
end
