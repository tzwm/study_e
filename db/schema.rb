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

ActiveRecord::Schema.define(version: 20150718041122) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id", limit: 4,   null: false
    t.string   "title",       limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "lesson_questionnaire_relations", force: :cascade do |t|
    t.integer  "lesson_id",        limit: 4,   null: false
    t.integer  "questionnaire_id", limit: 4,   null: false
    t.string   "phase",            limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "lesson_questionnaire_relations", ["lesson_id", "phase"], name: "index_lesson_questionnaire_relations_on_lesson_id_and_phase", using: :btree
  add_index "lesson_questionnaire_relations", ["lesson_id"], name: "index_lesson_questionnaire_relations_on_lesson_id", using: :btree
  add_index "lesson_questionnaire_relations", ["phase"], name: "index_lesson_questionnaire_relations_on_phase", using: :btree
  add_index "lesson_questionnaire_relations", ["questionnaire_id"], name: "index_lesson_questionnaire_relations_on_questionnaire_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.boolean  "is_template", limit: 1,     default: false, null: false
    t.string   "title",       limit: 255,                   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "questionnaire_question_relations", force: :cascade do |t|
    t.integer  "questionnaire_id", limit: 4, null: false
    t.integer  "question_id",      limit: 4, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "questionnaire_question_relations", ["question_id"], name: "index_questionnaire_question_relations_on_question_id", using: :btree
  add_index "questionnaire_question_relations", ["questionnaire_id"], name: "index_questionnaire_question_relations_on_questionnaire_id", using: :btree

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4,   null: false
    t.string   "phase",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "questionnaires", ["lesson_id", "phase"], name: "index_questionnaires_on_lesson_id_and_phase", using: :btree
  add_index "questionnaires", ["lesson_id"], name: "index_questionnaires_on_lesson_id", using: :btree
  add_index "questionnaires", ["phase"], name: "index_questionnaires_on_phase", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
