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

ActiveRecord::Schema.define(version: 20150118103307) do

  create_table "addresses", force: :cascade do |t|
    t.string   "type"
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "town"
    t.string   "county"
    t.string   "country"
    t.string   "post_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "employee_id"
  end

  add_index "addresses", ["employee_id"], name: "index_addresses_on_employee_id"

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "grade"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "competencies", ["employee_id"], name: "index_competencies_on_employee_id"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "service_no"
    t.date     "date_of_birth"
    t.string   "gender"
    t.date     "service_start_date"
    t.string   "substantive_rank"
    t.date     "promotion_date"
    t.string   "passport_number"
    t.date     "passport_expiry"
    t.string   "passport_country_of_origin"
    t.string   "nationality"
    t.string   "national_insurance"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                      default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "activation_digest"
    t.boolean  "activated",                  default: false
    t.datetime "activated_at"
    t.string   "email"
  end

  add_index "employees", ["service_no"], name: "index_employees_on_service_no", unique: true

  create_table "next_of_kins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "contact_number"
    t.string   "relation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "employee_id"
  end

  add_index "next_of_kins", ["employee_id"], name: "index_next_of_kins_on_employee_id"

  create_table "notes", force: :cascade do |t|
    t.text     "comment"
    t.date     "date"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notes", ["employee_id"], name: "index_notes_on_employee_id"

  create_table "phones", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "phones", ["employee_id"], name: "index_phones_on_employee_id"

  create_table "qualifications", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "grade"
    t.date     "end_date"
    t.string   "status"
    t.string   "school"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id"

  create_table "roles", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "PID"
    t.string   "description"
    t.string   "ancestry"
    t.string   "section"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "roles", ["ancestry"], name: "index_roles_on_ancestry"
  add_index "roles", ["employee_id"], name: "index_roles_on_employee_id"

  create_table "spouses", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.date     "anniversary"
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
