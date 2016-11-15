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

ActiveRecord::Schema.define(version: 20161115162509) do

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "image"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "school_id"
    t.index ["imageable_type", "imageable_id"], name: "index_albums_on_imageable_type_and_imageable_id", using: :btree
    t.index ["school_id"], name: "index_albums_on_school_id", using: :btree
  end

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "time"
    t.boolean  "present",         default: false
    t.integer  "daily_report_id"
    t.integer  "student_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "group_id"
    t.index ["daily_report_id"], name: "index_attendances_on_daily_report_id", using: :btree
    t.index ["group_id"], name: "index_attendances_on_group_id", using: :btree
    t.index ["student_id"], name: "index_attendances_on_student_id", using: :btree
  end

  create_table "daily_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.datetime "day"
    t.integer  "student_id"
    t.index ["group_id"], name: "index_daily_reports_on_group_id", using: :btree
    t.index ["student_id"], name: "index_daily_reports_on_student_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "level_id"
    t.integer  "school_id"
    t.index ["level_id"], name: "index_groups_on_level_id", using: :btree
    t.index ["school_id"], name: "index_groups_on_school_id", using: :btree
  end

  create_table "health_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "health_problem"
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "student_id"
  end

  create_table "levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_levels_on_school_id", using: :btree
  end

  create_table "my_days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "student_id"
    t.integer  "daily_report_id"
    t.index ["daily_report_id"], name: "index_my_days_on_daily_report_id", using: :btree
    t.index ["student_id"], name: "index_my_days_on_student_id", using: :btree
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",        limit: 65535
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.index ["imageable_type", "imageable_id"], name: "index_news_on_imageable_type_and_imageable_id", using: :btree
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "our_days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "student_id"
    t.integer  "group_id"
    t.integer  "daily_report_id"
    t.index ["daily_report_id"], name: "index_our_days_on_daily_report_id", using: :btree
    t.index ["group_id"], name: "index_our_days_on_group_id", using: :btree
    t.index ["student_id"], name: "index_our_days_on_student_id", using: :btree
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "album_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["album_id"], name: "index_photos_on_album_id", using: :btree
  end

  create_table "report_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.time     "start"
    t.time     "end"
    t.integer  "attendance_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["attendance_id"], name: "index_report_times_on_attendance_id", using: :btree
  end

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "contact_phone"
    t.string   "admin_fname"
    t.string   "admin_lname"
    t.string   "admin_email"
    t.string   "admin_contact_phone"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "additionalinfo",      limit: 65535
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "contact_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "school_id"
    t.integer  "group_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
    t.index ["school_id"], name: "index_students_on_school_id", using: :btree
  end

  create_table "students_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_students_users_on_parent_id", using: :btree
    t.index ["student_id"], name: "index_students_users_on_student_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_phone"
    t.string   "type"
    t.integer  "school_id"
    t.integer  "group_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["school_id"], name: "index_users_on_school_id", using: :btree
  end

  add_foreign_key "albums", "schools"
  add_foreign_key "groups", "levels"
  add_foreign_key "groups", "schools"
  add_foreign_key "levels", "schools"
  add_foreign_key "my_days", "daily_reports"
  add_foreign_key "my_days", "students"
  add_foreign_key "news", "users"
  add_foreign_key "our_days", "daily_reports"
  add_foreign_key "our_days", "groups"
  add_foreign_key "our_days", "students"
  add_foreign_key "photos", "albums"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "schools"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "schools"
end
