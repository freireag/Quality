# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100715133945) do

  create_table "admin_files", :force => true do |t|
    t.string   "title"
    t.string   "permission"
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_classes", :force => true do |t|
    t.time     "start_time"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "course_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.integer  "days_mask"
    t.integer  "number"
    t.time     "end_time"
    t.text     "observation"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "credit_hours"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", :force => true do |t|
    t.string   "exam_type"
    t.string   "name"
    t.integer  "exam_order"
    t.integer  "course_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequencies", :force => true do |t|
    t.date     "day"
    t.integer  "course_class_id"
    t.integer  "student_id"
    t.boolean  "presence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", :force => true do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.float    "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_classes", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "phone"
    t.string   "rg"
    t.string   "cpf",                                                 :null => false
    t.date     "birthdate"
    t.string   "birthplace"
    t.string   "marital_status"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
