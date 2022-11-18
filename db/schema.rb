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

ActiveRecord::Schema.define(version: 2022_11_18_200329) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "lecturer_answers", force: :cascade do |t|
    t.integer "lecturer_question_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecturer_question_id"], name: "index_lecturer_answers_on_lecturer_question_id"
  end

  create_table "lecturer_questionnaires", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "level"
    t.integer "semester"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturer_questions", force: :cascade do |t|
    t.integer "lecturer_questionnaire_id", null: false
    t.string "name"
    t.integer "question_type"
    t.boolean "required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecturer_questionnaire_id"], name: "index_lecturer_questions_on_lecturer_questionnaire_id"
  end

  create_table "lecturer_responses", force: :cascade do |t|
    t.integer "lecturer_questionnaire_id", null: false
    t.json "answers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecturer_questionnaire_id"], name: "index_lecturer_responses_on_lecturer_questionnaire_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "level"
    t.integer "semester"
    t.text "description"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.string "name"
    t.integer "question_type"
    t.boolean "required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.json "answers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["questionnaire_id"], name: "index_responses_on_questionnaire_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "matric_number"
    t.boolean "admin"
    t.string "level"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "lecturer_answers", "lecturer_questions"
  add_foreign_key "lecturer_questions", "lecturer_questionnaires"
  add_foreign_key "lecturer_responses", "lecturer_questionnaires"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "responses", "questionnaires"
end
