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

ActiveRecord::Schema.define(version: 20180515063544) do

  create_table "answers", force: :cascade do |t|
    t.string "name"
    t.boolean "choose_status", default: false
    t.boolean "correct_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories_courses", force: :cascade do |t|
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_categories_courses_on_course_id"
    t.index ["user_id"], name: "index_categories_courses_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "dateDay"
    t.boolean "is_delete", default: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wordlist_id"
    t.index ["wordlist_id"], name: "index_questions_on_wordlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: ""
    t.boolean "role", default: false
    t.boolean "sex", default: false
    t.string "phone", default: ""
    t.string "address", default: ""
    t.string "name", default: ""
    t.boolean "is_delete", default: false
    t.datetime "dateOfbirth"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wordlists", force: :cascade do |t|
    t.string "name"
    t.string "from_translator"
    t.boolean "is_delete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_wordlists_on_course_id"
  end

end
