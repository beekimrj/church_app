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

ActiveRecord::Schema[8.0].define(version: 2026_03_01_154545) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attendance_members", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "attendance_id", null: false
    t.datetime "arrived_at"
    t.datetime "departed_at"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_id", "member_id"], name: "index_attendance_members_on_attendance_id_and_member_id", unique: true
    t.index ["attendance_id"], name: "index_attendance_members_on_attendance_id"
    t.index ["member_id"], name: "index_attendance_members_on_member_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "status"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
  end

  create_table "church_services", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.bigint "church_service_id", null: false
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "recurrence"
    t.time "default_start_time"
    t.time "default_end_time"
    t.integer "capacity"
    t.index ["church_service_id"], name: "index_events_on_church_service_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.date "date_of_birth"
    t.string "code"
    t.string "gender"
    t.string "marital_status"
    t.date "baptism_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendance_members", "attendances"
  add_foreign_key "attendance_members", "members"
  add_foreign_key "attendances", "events"
  add_foreign_key "events", "church_services"
end
