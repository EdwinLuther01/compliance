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

ActiveRecord::Schema.define(version: 20180306165316) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "allowance_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "weight", precision: 10
    t.decimal "amount", precision: 10
    t.string "kind"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.integer "replaces_id"
    t.index ["fruit_id"], name: "index_allowance_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_allowance_seeds_on_issue_id"
  end

  create_table "allowances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "weight", precision: 10
    t.decimal "amount", precision: 10
    t.string "kind"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.index ["issue_id"], name: "index_allowances_on_issue_id"
    t.index ["person_id"], name: "index_allowances_on_person_id"
    t.index ["replaced_by_id"], name: "index_allowances_on_replaced_by_id"
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id"
    t.integer "attached_to_seed_id"
    t.string "attached_to_seed_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.integer "attached_to_fruit_id"
    t.string "attached_to_fruit_type"
    t.index ["person_id"], name: "index_attachments_on_person_id"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "author_id"
    t.string "title"
    t.text "meta"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domicile_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "street_address"
    t.string "street_number"
    t.string "postal_code"
    t.string "floor"
    t.string "apartment"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.integer "replaces_id"
    t.index ["fruit_id"], name: "index_domicile_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_domicile_seeds_on_issue_id"
  end

  create_table "domiciles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "street_address"
    t.string "street_number"
    t.string "postal_code"
    t.string "floor"
    t.string "apartment"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.index ["issue_id"], name: "index_domiciles_on_issue_id"
    t.index ["person_id"], name: "index_domiciles_on_person_id"
    t.index ["replaced_by_id"], name: "index_domiciles_on_replaced_by_id"
  end

  create_table "fundings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "amount", precision: 10
    t.string "kind"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.index ["issue_id"], name: "index_fundings_on_issue_id"
    t.index ["person_id"], name: "index_fundings_on_person_id"
    t.index ["replaced_by_id"], name: "index_fundings_on_replaced_by_id"
  end

  create_table "identification_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "issue_id"
    t.string "kind"
    t.string "number"
    t.string "issuer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.integer "replaces_id"
    t.index ["fruit_id"], name: "index_identification_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_identification_seeds_on_issue_id"
  end

  create_table "identifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number"
    t.string "kind"
    t.string "issuer"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.index ["issue_id"], name: "index_identifications_on_issue_id"
    t.index ["person_id"], name: "index_identifications_on_person_id"
    t.index ["replaced_by_id"], name: "index_identifications_on_replaced_by_id"
  end

  create_table "issues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.index ["person_id"], name: "index_issues_on_person_id"
  end

  create_table "legal_entity_docket_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "issue_id"
    t.string "industry"
    t.text "business_description"
    t.string "country"
    t.string "commercial_name"
    t.string "legal_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.index ["fruit_id"], name: "index_legal_entity_docket_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_legal_entity_docket_seeds_on_issue_id"
  end

  create_table "legal_entity_dockets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "industry"
    t.text "business_description"
    t.string "country"
    t.string "commercial_name"
    t.string "legal_name"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.index ["issue_id"], name: "index_legal_entity_dockets_on_issue_id"
    t.index ["person_id"], name: "index_legal_entity_dockets_on_person_id"
    t.index ["replaced_by_id"], name: "index_legal_entity_dockets_on_replaced_by_id"
  end

  create_table "natural_docket_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "issue_id"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "nationality"
    t.string "gender"
    t.string "marital_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.index ["fruit_id"], name: "index_natural_docket_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_natural_docket_seeds_on_issue_id"
  end

  create_table "natural_dockets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "nationality"
    t.string "gender"
    t.string "marital_status"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.index ["issue_id"], name: "index_natural_dockets_on_issue_id"
    t.index ["person_id"], name: "index_natural_dockets_on_person_id"
    t.index ["replaced_by_id"], name: "index_natural_dockets_on_replaced_by_id"
  end

  create_table "observation_reasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scope"
  end

  create_table "observations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.text "reply"
    t.bigint "observation_reason_id"
    t.integer "scope"
    t.string "aasm_state"
    t.index ["issue_id"], name: "index_observations_on_issue_id"
    t.index ["observation_reason_id"], name: "index_observations_on_observation_reason_id"
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: false, null: false
    t.integer "risk"
  end

  create_table "relationship_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "issue_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "related_person_id"
    t.integer "replaces_id"
    t.integer "fruit_id"
    t.index ["issue_id"], name: "index_relationship_seeds_on_issue_id"
    t.index ["related_person_id"], name: "index_relationship_seeds_on_related_person_id"
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "relationship_seed_id"
    t.bigint "person_id"
    t.bigint "related_person_id"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_relationships_on_person_id"
    t.index ["related_person_id"], name: "index_relationships_on_related_person_id"
    t.index ["relationship_seed_id"], name: "index_relationships_on_relationship_seed_id"
  end

  add_foreign_key "allowance_seeds", "allowances", column: "fruit_id"
  add_foreign_key "allowance_seeds", "issues"
  add_foreign_key "allowances", "allowances", column: "replaced_by_id"
  add_foreign_key "allowances", "issues"
  add_foreign_key "allowances", "people"
  add_foreign_key "attachments", "people"
  add_foreign_key "domicile_seeds", "domiciles", column: "fruit_id"
  add_foreign_key "domicile_seeds", "issues"
  add_foreign_key "domiciles", "domiciles", column: "replaced_by_id"
  add_foreign_key "domiciles", "issues"
  add_foreign_key "domiciles", "people"
  add_foreign_key "fundings", "fundings", column: "replaced_by_id"
  add_foreign_key "fundings", "issues"
  add_foreign_key "fundings", "people"
  add_foreign_key "identification_seeds", "identifications", column: "fruit_id"
  add_foreign_key "identification_seeds", "issues"
  add_foreign_key "identifications", "identifications", column: "replaced_by_id"
  add_foreign_key "identifications", "issues"
  add_foreign_key "identifications", "people"
  add_foreign_key "issues", "people"
  add_foreign_key "legal_entity_docket_seeds", "issues"
  add_foreign_key "legal_entity_docket_seeds", "legal_entity_dockets", column: "fruit_id"
  add_foreign_key "legal_entity_dockets", "issues"
  add_foreign_key "legal_entity_dockets", "legal_entity_dockets", column: "replaced_by_id"
  add_foreign_key "legal_entity_dockets", "people"
  add_foreign_key "natural_docket_seeds", "issues"
  add_foreign_key "natural_docket_seeds", "natural_dockets", column: "fruit_id"
  add_foreign_key "natural_dockets", "issues"
  add_foreign_key "natural_dockets", "natural_dockets", column: "replaced_by_id"
  add_foreign_key "natural_dockets", "people"
  add_foreign_key "observations", "issues"
  add_foreign_key "relationship_seeds", "issues"
  add_foreign_key "relationship_seeds", "people", column: "related_person_id"
  add_foreign_key "relationships", "people"
  add_foreign_key "relationships", "people", column: "related_person_id"
  add_foreign_key "relationships", "relationship_seeds"
end
