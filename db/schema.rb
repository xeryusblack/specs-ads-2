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

ActiveRecord::Schema.define(version: 20150315063859) do

  create_table "acquired_quota_points", force: true do |t|
    t.decimal "amount",               precision: 10, scale: 0, default: 0,            null: false
    t.date    "date_conducted",                                default: '2015-03-15', null: false
    t.integer "training_activity_id",                                                 null: false
  end

  add_index "acquired_quota_points", ["training_activity_id"], name: "index_acquired_quota_points_on_training_activity_id", using: :btree

  create_table "activity_members", force: true do |t|
    t.integer  "varsity_member_id"
    t.integer  "acquired_quota_point_id"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_debts", force: true do |t|
    t.string  "source_of_debt",                                         null: false
    t.decimal "debt_amount",       precision: 10, scale: 0, default: 0, null: false
    t.integer "competition_id",                                         null: false
    t.integer "varsity_member_id",                                      null: false
  end

  add_index "competition_debts", ["competition_id"], name: "index_competition_debts_on_competition_id", using: :btree
  add_index "competition_debts", ["varsity_member_id"], name: "index_competition_debts_on_varsity_member_id", using: :btree

  create_table "competitions", force: true do |t|
    t.string  "name",                                                                        null: false
    t.integer "number_of_contingent",                                                        null: false
    t.decimal "arqp_contingent_debater",     precision: 10, scale: 0,                        null: false
    t.decimal "arqp_contingent_adjudicator", precision: 10, scale: 0,                        null: false
    t.decimal "arqp_non_contingent",         precision: 10, scale: 0,                        null: false
    t.string  "status",                                                                      null: false
    t.date    "start_date",                                           default: '2015-03-15', null: false
    t.date    "end_date",                                             default: '2015-03-15', null: false
    t.decimal "quota_point_monetary_value",  precision: 10, scale: 0, default: 0,            null: false
  end

  create_table "contingents", force: true do |t|
    t.string  "debater_position",  default: "Non-contingent", null: false
    t.integer "varsity_member_id",                            null: false
    t.integer "competition_id",                               null: false
  end

  add_index "contingents", ["competition_id"], name: "index_contingents_on_competition_id", using: :btree
  add_index "contingents", ["varsity_member_id"], name: "index_contingents_on_varsity_member_id", using: :btree

  create_table "debt_settlements", force: true do |t|
    t.decimal "amount_paid",       precision: 10, scale: 0, default: 0,            null: false
    t.date    "date_paid",                                  default: '2015-03-15', null: false
    t.integer "varsity_member_id",                                                 null: false
    t.integer "officer_id",                                                        null: false
  end

  add_index "debt_settlements", ["officer_id"], name: "index_debt_settlements_on_officer_id", using: :btree
  add_index "debt_settlements", ["varsity_member_id"], name: "index_debt_settlements_on_varsity_member_id", using: :btree

  create_table "officer_in_charges", force: true do |t|
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
    t.string   "name"
    t.string   "office"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "officer_in_charges", ["email"], name: "index_officer_in_charges_on_email", unique: true, using: :btree
  add_index "officer_in_charges", ["reset_password_token"], name: "index_officer_in_charges_on_reset_password_token", unique: true, using: :btree

  create_table "officers", force: true do |t|
    t.string "name", null: false
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_activities", force: true do |t|
    t.string  "name",                                                   null: false
    t.decimal "quota_point_value", precision: 10, scale: 0, default: 0, null: false
  end

  create_table "tryout_intents", force: true do |t|
    t.date    "date",              default: '2015-03-15', null: false
    t.string  "debater_position",                         null: false
    t.integer "varsity_member_id"
  end

  create_table "varsity_members", force: true do |t|
    t.integer  "vm_id",                                                                           null: false
    t.string   "first_name",                                                                      null: false
    t.string   "last_name",                                                                       null: false
    t.integer  "year",                                                                            null: false
    t.string   "course",                                                                          null: false
    t.string   "email_address",                                                                   null: false
    t.string   "contact_number",                                                                  null: false
    t.string   "varsity_track",                                                                   null: false
    t.string   "debater_position",                                     default: "Non-contingent", null: false
    t.decimal  "total_debt",                  precision: 10, scale: 0, default: 0
    t.integer  "total_acquired_quota_points",                          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
