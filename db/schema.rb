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

ActiveRecord::Schema.define(version: 20150827211718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: true do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "changesets", force: true do |t|
    t.integer  "story_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["project_id", "user_id"], name: "index_memberships_on_project_id_and_user_id", unique: true, using: :btree
  add_index "memberships", ["project_id"], name: "index_memberships_on_project_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.text     "note"
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "point_scale",         default: "fibonacci"
    t.date     "start_date"
    t.integer  "iteration_start_day", default: 1
    t.integer  "iteration_length",    default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "default_velocity",    default: 10
    t.string   "slug"
    t.integer  "stories_count",       default: 0
    t.integer  "memberships_count",   default: 0
    t.datetime "archived_at"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "stories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "estimate"
    t.string   "story_type",        default: "feature"
    t.string   "state",             default: "unstarted"
    t.date     "accepted_at"
    t.integer  "requested_by_id"
    t.integer  "owned_by_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "position"
    t.string   "labels"
    t.string   "requested_by_name"
    t.string   "owned_by_name"
    t.string   "owned_by_initials"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",     limit: 128, default: "",    null: false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "initials"
    t.boolean  "email_delivery",                     default: true
    t.boolean  "email_acceptance",                   default: true
    t.boolean  "email_rejection",                    default: true
    t.datetime "reset_password_sent_at"
    t.string   "locale"
    t.boolean  "is_admin",                           default: false
    t.integer  "memberships_count",                  default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
