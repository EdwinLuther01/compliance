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

ActiveRecord::Schema.define(version: 2023_03_14_195347) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "namespace"
    t.text "body", limit: 4294967295
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

  create_table "admin_user_taggings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "admin_user_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id", "tag_id"], name: "index_admin_user_taggings_on_admin_user_id_and_tag_id", unique: true
    t.index ["admin_user_id"], name: "index_admin_user_taggings_on_admin_user_id"
    t.index ["tag_id"], name: "index_admin_user_taggings_on_tag_id"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
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
    t.string "api_token"
    t.string "otp_secret_key"
    t.boolean "otp_enabled", default: false
    t.integer "max_people_allowed"
    t.integer "admin_role_id", default: 7, null: false
    t.boolean "active", default: true, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "affinities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "affinity_seed_id"
    t.bigint "person_id"
    t.bigint "related_person_id"
    t.integer "affinity_kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.date "archived_at"
    t.index ["affinity_seed_id"], name: "index_affinities_on_affinity_seed_id"
    t.index ["archived_at"], name: "index_affinities_on_archived_at"
    t.index ["person_id"], name: "index_affinities_on_person_id"
    t.index ["related_person_id"], name: "index_affinities_on_related_person_id"
    t.index ["replaced_by_id"], name: "index_affinities_on_replaced_by_id"
  end

  create_table "affinity_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issue_id"
    t.integer "affinity_kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "related_person_id"
    t.integer "replaces_id"
    t.integer "fruit_id"
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.index ["archived_at"], name: "index_affinity_seeds_on_archived_at"
    t.index ["fruit_id"], name: "index_affinity_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_affinity_seeds_on_issue_id"
    t.index ["related_person_id"], name: "index_affinity_seeds_on_related_person_id"
    t.index ["replaces_id"], name: "index_affinity_seeds_on_replaces_id"
  end

  create_table "allowance_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.decimal "weight", precision: 10
    t.decimal "amount", precision: 10
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.integer "replaces_id"
    t.boolean "copy_attachments"
    t.integer "kind_id"
    t.date "expires_at"
    t.date "archived_at"
    t.integer "tpi"
    t.index ["archived_at"], name: "index_allowance_seeds_on_archived_at"
    t.index ["fruit_id"], name: "index_allowance_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_allowance_seeds_on_issue_id"
    t.index ["replaces_id"], name: "index_allowance_seeds_on_replaces_id"
  end

  create_table "allowances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.decimal "weight", precision: 10
    t.decimal "amount", precision: 10
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.integer "kind_id"
    t.date "archived_at"
    t.integer "tpi"
    t.index ["archived_at"], name: "index_allowances_on_archived_at"
    t.index ["issue_id"], name: "index_allowances_on_issue_id"
    t.index ["person_id"], name: "index_allowances_on_person_id"
    t.index ["replaced_by_id"], name: "index_allowances_on_replaced_by_id"
  end

  create_table "argentina_invoicing_detail_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "vat_status_id"
    t.string "tax_id"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaces_id"
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.integer "tax_id_kind_id", null: false
    t.integer "receipt_kind_id", null: false
    t.string "full_name", null: false
    t.string "address"
    t.string "country", null: false
    t.date "expires_at"
    t.date "archived_at"
    t.string "tax_id_normalized"
    t.index ["address"], name: "index_argentina_invoicing_detail_seeds_on_address"
    t.index ["archived_at"], name: "index_argentina_invoicing_detail_seeds_on_archived_at"
    t.index ["country"], name: "index_argentina_invoicing_detail_seeds_on_country"
    t.index ["fruit_id"], name: "index_argentina_invoicing_detail_seeds_on_fruit_id"
    t.index ["full_name"], name: "index_argentina_invoicing_detail_seeds_on_full_name"
    t.index ["issue_id"], name: "index_argentina_invoicing_detail_seeds_on_issue_id"
    t.index ["receipt_kind_id"], name: "index_argentina_invoicing_detail_seeds_on_receipt_kind_id"
    t.index ["replaces_id"], name: "index_argentina_invoicing_detail_seeds_on_replaces_id"
    t.index ["tax_id"], name: "index_argentina_invoicing_detail_seeds_on_tax_id"
    t.index ["tax_id_kind_id"], name: "index_argentina_invoicing_detail_seeds_on_tax_id_kind_id"
    t.index ["tax_id_normalized"], name: "index_argentina_invoicing_detail_seeds_on_tax_id_normalized"
    t.index ["vat_status_id"], name: "index_argentina_invoicing_detail_seeds_on_vat_status_id"
  end

  create_table "argentina_invoicing_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "vat_status_id"
    t.string "tax_id"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.integer "tax_id_kind_id", null: false
    t.integer "receipt_kind_id", null: false
    t.string "full_name", null: false
    t.string "address"
    t.string "country", null: false
    t.date "archived_at"
    t.string "tax_id_normalized"
    t.index ["address"], name: "index_argentina_invoicing_details_on_address"
    t.index ["archived_at"], name: "index_argentina_invoicing_details_on_archived_at"
    t.index ["country"], name: "index_argentina_invoicing_details_on_country"
    t.index ["full_name"], name: "index_argentina_invoicing_details_on_full_name"
    t.index ["issue_id"], name: "index_argentina_invoicing_details_on_issue_id"
    t.index ["person_id"], name: "index_argentina_invoicing_details_on_person_id"
    t.index ["receipt_kind_id"], name: "index_argentina_invoicing_details_on_receipt_kind_id"
    t.index ["replaced_by_id"], name: "index_argentina_invoicing_details_on_replaced_by_id"
    t.index ["tax_id"], name: "index_argentina_invoicing_details_on_tax_id"
    t.index ["tax_id_kind_id"], name: "index_argentina_invoicing_details_on_tax_id_kind_id"
    t.index ["tax_id_normalized"], name: "index_argentina_invoicing_details_on_tax_id_normalized"
    t.index ["vat_status_id"], name: "index_argentina_invoicing_details_on_vat_status_id"
  end

  create_table "attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
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
    t.index ["attached_to_fruit_type", "attached_to_fruit_id"], name: "attached_to_fruit"
    t.index ["attached_to_fruit_type"], name: "index_attachments_on_attached_to_fruit_type"
    t.index ["attached_to_seed_type", "attached_to_seed_id"], name: "attached_to_seed"
    t.index ["attached_to_seed_type"], name: "index_attachments_on_attached_to_seed_type"
    t.index ["person_id"], name: "index_attachments_on_person_id"
  end

  create_table "chile_invoicing_detail_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "tax_id"
    t.string "giro"
    t.string "ciudad"
    t.string "comuna"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaces_id"
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.integer "vat_status_id"
    t.date "expires_at"
    t.date "archived_at"
    t.string "tax_id_normalized"
    t.index ["archived_at"], name: "index_chile_invoicing_detail_seeds_on_archived_at"
    t.index ["comuna"], name: "index_chile_invoicing_detail_seeds_on_comuna"
    t.index ["fruit_id"], name: "index_chile_invoicing_detail_seeds_on_fruit_id"
    t.index ["giro"], name: "index_chile_invoicing_detail_seeds_on_giro"
    t.index ["issue_id"], name: "index_chile_invoicing_detail_seeds_on_issue_id"
    t.index ["replaces_id"], name: "index_chile_invoicing_detail_seeds_on_replaces_id"
    t.index ["tax_id"], name: "index_chile_invoicing_detail_seeds_on_tax_id"
    t.index ["tax_id_normalized"], name: "index_chile_invoicing_detail_seeds_on_tax_id_normalized"
    t.index ["vat_status_id"], name: "index_chile_invoicing_detail_seeds_on_vat_status_id"
  end

  create_table "chile_invoicing_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "tax_id"
    t.string "giro"
    t.string "ciudad"
    t.string "comuna"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.integer "vat_status_id"
    t.date "archived_at"
    t.string "tax_id_normalized"
    t.index ["archived_at"], name: "index_chile_invoicing_details_on_archived_at"
    t.index ["comuna"], name: "index_chile_invoicing_details_on_comuna"
    t.index ["giro"], name: "index_chile_invoicing_details_on_giro"
    t.index ["issue_id"], name: "index_chile_invoicing_details_on_issue_id"
    t.index ["person_id"], name: "index_chile_invoicing_details_on_person_id"
    t.index ["replaced_by_id"], name: "index_chile_invoicing_details_on_replaced_by_id"
    t.index ["tax_id"], name: "index_chile_invoicing_details_on_tax_id"
    t.index ["tax_id_normalized"], name: "index_chile_invoicing_details_on_tax_id_normalized"
    t.index ["vat_status_id"], name: "index_chile_invoicing_details_on_vat_status_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "author_id"
    t.string "title"
    t.text "meta", limit: 4294967295
    t.text "body", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domicile_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
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
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.index ["archived_at"], name: "index_domicile_seeds_on_archived_at"
    t.index ["city"], name: "index_domicile_seeds_on_city"
    t.index ["country"], name: "index_domicile_seeds_on_country"
    t.index ["fruit_id"], name: "index_domicile_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_domicile_seeds_on_issue_id"
    t.index ["postal_code"], name: "index_domicile_seeds_on_postal_code"
    t.index ["replaces_id"], name: "index_domicile_seeds_on_replaces_id"
    t.index ["state"], name: "index_domicile_seeds_on_state"
    t.index ["street_address", "street_number"], name: "index_domicile_seeds_on_street_address_and_street_number"
    t.index ["street_address"], name: "index_domicile_seeds_on_street_address"
    t.index ["street_number"], name: "index_domicile_seeds_on_street_number"
  end

  create_table "domiciles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
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
    t.date "archived_at"
    t.index ["archived_at"], name: "index_domiciles_on_archived_at"
    t.index ["city"], name: "index_domiciles_on_city"
    t.index ["country"], name: "index_domiciles_on_country"
    t.index ["issue_id"], name: "index_domiciles_on_issue_id"
    t.index ["person_id"], name: "index_domiciles_on_person_id"
    t.index ["postal_code"], name: "index_domiciles_on_postal_code"
    t.index ["replaced_by_id"], name: "index_domiciles_on_replaced_by_id"
    t.index ["state"], name: "index_domiciles_on_state"
    t.index ["street_address", "street_number"], name: "index_domiciles_on_street_address_and_street_number"
    t.index ["street_address"], name: "index_domiciles_on_street_address"
    t.index ["street_number"], name: "index_domiciles_on_street_number"
  end

  create_table "email_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "address"
    t.integer "email_kind_id"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaces_id"
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.index ["address"], name: "index_email_seeds_on_address"
    t.index ["archived_at"], name: "index_email_seeds_on_archived_at"
    t.index ["email_kind_id"], name: "index_email_seeds_on_email_kind_id"
    t.index ["fruit_id"], name: "index_email_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_email_seeds_on_issue_id"
    t.index ["replaces_id"], name: "index_email_seeds_on_replaces_id"
  end

  create_table "emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "address"
    t.integer "email_kind_id"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.date "archived_at"
    t.index ["address"], name: "index_emails_on_address"
    t.index ["archived_at"], name: "index_emails_on_archived_at"
    t.index ["email_kind_id"], name: "index_emails_on_email_kind_id"
    t.index ["issue_id"], name: "index_emails_on_issue_id"
    t.index ["person_id"], name: "index_emails_on_person_id"
    t.index ["replaced_by_id"], name: "index_emails_on_replaced_by_id"
  end

  create_table "event_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "entity_id"
    t.string "entity_type"
    t.text "raw_data", limit: 4294967295
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "verb_id"
    t.index ["admin_user_id"], name: "index_event_logs_on_admin_user_id"
    t.index ["created_at"], name: "index_event_logs_on_created_at"
    t.index ["entity_id", "entity_type"], name: "index_event_logs_on_entity_id_and_entity_type"
    t.index ["entity_id"], name: "index_event_logs_on_entity_id"
    t.index ["entity_type"], name: "index_event_logs_on_entity_type"
    t.index ["verb_id"], name: "index_event_logs_on_verb_id"
  end

  create_table "fund_deposits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.decimal "amount", precision: 20, scale: 8, null: false
    t.integer "currency_id", null: false
    t.integer "deposit_method_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.string "external_id", null: false
    t.decimal "exchange_rate_adjusted_amount", precision: 20, scale: 8, null: false
    t.datetime "deposit_date", null: false
    t.string "country", null: false
    t.index ["person_id", "country"], name: "index_fund_deposits_on_person_id_and_country"
    t.index ["person_id"], name: "index_fund_deposits_on_person_id"
    t.index ["replaced_by_id"], name: "index_fund_deposits_on_replaced_by_id"
  end

  create_table "fund_transfers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "source_person_id", null: false
    t.bigint "target_person_id", null: false
    t.decimal "amount", precision: 20, scale: 8, null: false
    t.datetime "transfer_date", null: false
    t.decimal "exchange_rate_adjusted_amount", precision: 20, scale: 8, null: false
    t.integer "currency_id", null: false
    t.string "external_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_person_id"], name: "index_fund_transfers_on_source_person_id"
    t.index ["target_person_id"], name: "index_fund_transfers_on_target_person_id"
  end

  create_table "fund_withdrawals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.decimal "amount", precision: 20, scale: 8, null: false
    t.integer "currency_id", null: false
    t.decimal "exchange_rate_adjusted_amount", precision: 20, scale: 8, null: false
    t.datetime "withdrawal_date", null: false
    t.string "country", null: false
    t.string "external_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id", "country"], name: "index_fund_withdrawals_on_person_id_and_country"
    t.index ["person_id"], name: "index_fund_withdrawals_on_person_id"
  end

  create_table "fundings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
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

  create_table "identification_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issue_id"
    t.integer "identification_kind_id"
    t.string "number"
    t.string "issuer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.integer "replaces_id"
    t.string "public_registry_authority"
    t.string "public_registry_book"
    t.string "public_registry_extra_data"
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.string "number_normalized"
    t.index ["archived_at"], name: "index_identification_seeds_on_archived_at"
    t.index ["fruit_id"], name: "index_identification_seeds_on_fruit_id"
    t.index ["identification_kind_id"], name: "index_identification_seeds_on_identification_kind_id"
    t.index ["issue_id"], name: "index_identification_seeds_on_issue_id"
    t.index ["issuer"], name: "index_identification_seeds_on_issuer"
    t.index ["number"], name: "index_identification_seeds_on_number"
    t.index ["number_normalized"], name: "index_identification_seeds_on_number_normalized"
    t.index ["replaces_id"], name: "index_identification_seeds_on_replaces_id"
  end

  create_table "identifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "number"
    t.integer "identification_kind_id"
    t.string "issuer"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.string "public_registry_authority"
    t.string "public_registry_book"
    t.string "public_registry_extra_data"
    t.date "archived_at"
    t.string "number_normalized"
    t.index ["archived_at"], name: "index_identifications_on_archived_at"
    t.index ["identification_kind_id"], name: "index_identifications_on_identification_kind_id"
    t.index ["issue_id"], name: "index_identifications_on_issue_id"
    t.index ["issuer"], name: "index_identifications_on_issuer"
    t.index ["number"], name: "index_identifications_on_number"
    t.index ["number_normalized"], name: "index_identifications_on_number_normalized"
    t.index ["person_id"], name: "index_identifications_on_person_id"
    t.index ["replaced_by_id"], name: "index_identifications_on_replaced_by_id"
  end

  create_table "issue_taggings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id", "tag_id"], name: "index_issue_taggings_on_issue_id_and_tag_id", unique: true
    t.index ["issue_id"], name: "index_issue_taggings_on_issue_id"
    t.index ["tag_id"], name: "index_issue_taggings_on_tag_id"
  end

  create_table "issue_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "token", null: false
    t.bigint "issue_id", null: false
    t.datetime "valid_until", null: false
    t.index ["issue_id"], name: "index_issue_tokens_on_issue_id"
  end

  create_table "issues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.boolean "fill_with_previous_info", default: false
    t.date "defer_until", null: false
    t.integer "reason_id", null: false
    t.boolean "locked", default: false, null: false
    t.bigint "lock_admin_user_id"
    t.datetime "lock_expiration"
    t.integer "priority", default: 0, null: false
    t.index ["aasm_state"], name: "index_issues_on_aasm_state"
    t.index ["lock_admin_user_id"], name: "index_issues_on_lock_admin_user_id"
    t.index ["person_id"], name: "index_issues_on_person_id"
    t.index ["priority", "id"], name: "index_issues_on_priority_and_id"
  end

  create_table "legal_entity_docket_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issue_id"
    t.string "industry"
    t.text "business_description", limit: 4294967295
    t.string "country"
    t.string "commercial_name"
    t.string "legal_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.boolean "regulated_entity", default: false, null: false
    t.boolean "operations_with_third_party_funds", default: false, null: false
    t.index ["archived_at"], name: "index_legal_entity_docket_seeds_on_archived_at"
    t.index ["commercial_name"], name: "index_legal_entity_docket_seeds_on_commercial_name"
    t.index ["country"], name: "index_legal_entity_docket_seeds_on_country"
    t.index ["fruit_id"], name: "index_legal_entity_docket_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_legal_entity_docket_seeds_on_issue_id"
    t.index ["legal_name"], name: "index_legal_entity_docket_seeds_on_legal_name"
  end

  create_table "legal_entity_dockets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "industry"
    t.text "business_description", limit: 4294967295
    t.string "country"
    t.string "commercial_name"
    t.string "legal_name"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.date "archived_at"
    t.boolean "regulated_entity", default: false, null: false
    t.boolean "operations_with_third_party_funds", default: false, null: false
    t.index ["archived_at"], name: "index_legal_entity_dockets_on_archived_at"
    t.index ["commercial_name"], name: "index_legal_entity_dockets_on_commercial_name"
    t.index ["country"], name: "index_legal_entity_dockets_on_country"
    t.index ["issue_id"], name: "index_legal_entity_dockets_on_issue_id"
    t.index ["legal_name"], name: "index_legal_entity_dockets_on_legal_name"
    t.index ["person_id"], name: "index_legal_entity_dockets_on_person_id"
    t.index ["replaced_by_id"], name: "index_legal_entity_dockets_on_replaced_by_id"
  end

  create_table "natural_docket_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issue_id"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "nationality"
    t.bigint "gender_id"
    t.bigint "marital_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fruit_id"
    t.string "job_title"
    t.text "job_description", limit: 4294967295
    t.boolean "politically_exposed"
    t.text "politically_exposed_reason", limit: 4294967295
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.decimal "expected_investment", precision: 20, scale: 8
    t.index ["archived_at"], name: "index_natural_docket_seeds_on_archived_at"
    t.index ["birth_date"], name: "index_natural_docket_seeds_on_birth_date"
    t.index ["first_name", "last_name"], name: "index_natural_docket_seeds_on_first_name_and_last_name"
    t.index ["first_name"], name: "index_natural_docket_seeds_on_first_name"
    t.index ["fruit_id"], name: "index_natural_docket_seeds_on_fruit_id"
    t.index ["gender_id"], name: "index_natural_docket_seeds_on_gender_id"
    t.index ["issue_id"], name: "index_natural_docket_seeds_on_issue_id"
    t.index ["last_name"], name: "index_natural_docket_seeds_on_last_name"
    t.index ["marital_status_id"], name: "index_natural_docket_seeds_on_marital_status_id"
    t.index ["nationality"], name: "index_natural_docket_seeds_on_nationality"
  end

  create_table "natural_dockets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "nationality"
    t.bigint "gender_id"
    t.bigint "marital_status_id"
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.string "job_title"
    t.text "job_description", limit: 4294967295
    t.boolean "politically_exposed"
    t.text "politically_exposed_reason", limit: 4294967295
    t.date "archived_at"
    t.decimal "expected_investment", precision: 20, scale: 8
    t.index ["archived_at"], name: "index_natural_dockets_on_archived_at"
    t.index ["birth_date"], name: "index_natural_dockets_on_birth_date"
    t.index ["first_name", "last_name"], name: "index_natural_dockets_on_first_name_and_last_name"
    t.index ["first_name"], name: "index_natural_dockets_on_first_name"
    t.index ["gender_id"], name: "index_natural_dockets_on_gender_id"
    t.index ["issue_id"], name: "index_natural_dockets_on_issue_id"
    t.index ["last_name"], name: "index_natural_dockets_on_last_name"
    t.index ["marital_status_id"], name: "index_natural_dockets_on_marital_status_id"
    t.index ["nationality"], name: "index_natural_dockets_on_nationality"
    t.index ["person_id"], name: "index_natural_dockets_on_person_id"
    t.index ["replaced_by_id"], name: "index_natural_dockets_on_replaced_by_id"
  end

  create_table "note_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body", limit: 4294967295
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaces_id"
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.boolean "public", default: false, null: false
    t.date "archived_at"
    t.index ["archived_at"], name: "index_note_seeds_on_archived_at"
    t.index ["fruit_id"], name: "index_note_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_note_seeds_on_issue_id"
    t.index ["replaces_id"], name: "index_note_seeds_on_replaces_id"
    t.index ["title"], name: "index_note_seeds_on_title"
  end

  create_table "notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body", limit: 4294967295
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.boolean "public", default: false, null: false
    t.date "archived_at"
    t.index ["archived_at"], name: "index_notes_on_archived_at"
    t.index ["issue_id"], name: "index_notes_on_issue_id"
    t.index ["person_id"], name: "index_notes_on_person_id"
    t.index ["replaced_by_id"], name: "index_notes_on_replaced_by_id"
    t.index ["title"], name: "index_notes_on_title"
  end

  create_table "observation_reasons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "subject_en"
    t.text "body_en", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scope"
    t.string "subject_es"
    t.text "body_es", limit: 4294967295
    t.string "subject_pt"
    t.text "body_pt", limit: 4294967295
    t.index ["scope"], name: "index_observation_reasons_on_scope"
    t.index ["subject_en"], name: "index_observation_reasons_on_subject_en"
    t.index ["subject_es"], name: "index_observation_reasons_on_subject_es"
    t.index ["subject_pt"], name: "index_observation_reasons_on_subject_pt"
  end

  create_table "observations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note", limit: 4294967295
    t.text "reply", limit: 4294967295
    t.bigint "observation_reason_id"
    t.integer "scope"
    t.string "aasm_state"
    t.string "observable_type"
    t.bigint "observable_id"
    t.index ["aasm_state"], name: "index_observations_on_aasm_state"
    t.index ["issue_id"], name: "index_observations_on_issue_id"
    t.index ["observable_type", "observable_id"], name: "index_observations_on_observable_type_and_observable_id"
    t.index ["observation_reason_id"], name: "index_observations_on_observation_reason_id"
    t.index ["scope"], name: "index_observations_on_scope"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: false, null: false
    t.integer "risk"
    t.integer "regularity_id", default: 1, null: false
    t.string "aasm_state", default: "new", null: false
    t.integer "tpi", default: 0, null: false
    t.index ["aasm_state"], name: "index_people_on_aasm_state"
  end

  create_table "person_taggings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id", "tag_id"], name: "index_person_taggings_on_person_id_and_tag_id", unique: true
    t.index ["person_id"], name: "index_person_taggings_on_person_id"
    t.index ["tag_id"], name: "index_person_taggings_on_tag_id"
  end

  create_table "phone_seeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "number"
    t.integer "phone_kind_id"
    t.string "country"
    t.boolean "has_whatsapp", default: false, null: false
    t.boolean "has_telegram", default: false, null: false
    t.text "note", limit: 4294967295
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaces_id"
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.date "expires_at"
    t.date "archived_at"
    t.index ["archived_at"], name: "index_phone_seeds_on_archived_at"
    t.index ["country"], name: "index_phone_seeds_on_country"
    t.index ["fruit_id"], name: "index_phone_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_phone_seeds_on_issue_id"
    t.index ["number"], name: "index_phone_seeds_on_number"
    t.index ["phone_kind_id"], name: "index_phone_seeds_on_phone_kind_id"
    t.index ["replaces_id"], name: "index_phone_seeds_on_replaces_id"
  end

  create_table "phones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "number"
    t.integer "phone_kind_id"
    t.string "country"
    t.boolean "has_whatsapp", default: false, null: false
    t.boolean "has_telegram", default: false, null: false
    t.text "note", limit: 4294967295
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.bigint "issue_id"
    t.date "archived_at"
    t.index ["archived_at"], name: "index_phones_on_archived_at"
    t.index ["country"], name: "index_phones_on_country"
    t.index ["issue_id"], name: "index_phones_on_issue_id"
    t.index ["number"], name: "index_phones_on_number"
    t.index ["person_id"], name: "index_phones_on_person_id"
    t.index ["phone_kind_id"], name: "index_phones_on_phone_kind_id"
    t.index ["replaced_by_id"], name: "index_phones_on_replaced_by_id"
  end

  create_table "risk_score_seeds", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "score"
    t.string "provider"
    t.text "extra_info", limit: 16777215
    t.text "external_link", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "replaces_id"
    t.bigint "fruit_id"
    t.boolean "copy_attachments"
    t.bigint "issue_id"
    t.date "expires_at"
    t.date "archived_at"
    t.index ["archived_at"], name: "index_risk_score_seeds_on_archived_at"
    t.index ["fruit_id"], name: "index_risk_score_seeds_on_fruit_id"
    t.index ["issue_id"], name: "index_risk_score_seeds_on_issue_id"
    t.index ["replaces_id"], name: "index_risk_score_seeds_on_replaces_id"
  end

  create_table "risk_scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "score"
    t.string "provider"
    t.text "extra_info", limit: 16777215
    t.text "external_link", limit: 4294967295
    t.bigint "issue_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "replaced_by_id"
    t.date "archived_at"
    t.index ["archived_at"], name: "index_risk_scores_on_archived_at"
    t.index ["issue_id"], name: "index_risk_scores_on_issue_id"
    t.index ["person_id"], name: "index_risk_scores_on_person_id"
    t.index ["replaced_by_id"], name: "index_risk_scores_on_replaced_by_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.integer "tag_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_type", "name"], name: "index_tags_on_tag_type_and_name", unique: true
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "workflow_id"
    t.string "aasm_state"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_retries", default: 0
    t.integer "current_retries", default: 0
    t.text "output"
    t.string "task_type"
    t.index ["workflow_id"], name: "index_tasks_on_workflow_id"
  end

  create_table "workflows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "scope"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "issue_id"
    t.string "workflow_type"
    t.index ["issue_id"], name: "index_workflows_on_issue_id"
  end

  add_foreign_key "admin_user_taggings", "admin_users"
  add_foreign_key "admin_user_taggings", "tags"
  add_foreign_key "affinities", "affinities", column: "replaced_by_id"
  add_foreign_key "affinities", "affinity_seeds"
  add_foreign_key "affinities", "people"
  add_foreign_key "affinities", "people", column: "related_person_id"
  add_foreign_key "affinity_seeds", "issues"
  add_foreign_key "affinity_seeds", "people", column: "related_person_id"
  add_foreign_key "allowance_seeds", "allowances", column: "fruit_id"
  add_foreign_key "allowance_seeds", "issues"
  add_foreign_key "allowances", "allowances", column: "replaced_by_id"
  add_foreign_key "allowances", "issues"
  add_foreign_key "allowances", "people"
  add_foreign_key "argentina_invoicing_detail_seeds", "argentina_invoicing_details", column: "fruit_id"
  add_foreign_key "argentina_invoicing_detail_seeds", "argentina_invoicing_details", column: "replaces_id"
  add_foreign_key "argentina_invoicing_detail_seeds", "issues"
  add_foreign_key "argentina_invoicing_details", "argentina_invoicing_details", column: "replaced_by_id"
  add_foreign_key "argentina_invoicing_details", "issues"
  add_foreign_key "argentina_invoicing_details", "people"
  add_foreign_key "attachments", "people"
  add_foreign_key "chile_invoicing_detail_seeds", "chile_invoicing_details", column: "fruit_id"
  add_foreign_key "chile_invoicing_detail_seeds", "chile_invoicing_details", column: "replaces_id"
  add_foreign_key "chile_invoicing_detail_seeds", "issues"
  add_foreign_key "chile_invoicing_details", "chile_invoicing_details", column: "replaced_by_id"
  add_foreign_key "chile_invoicing_details", "issues"
  add_foreign_key "chile_invoicing_details", "people"
  add_foreign_key "domicile_seeds", "domiciles", column: "fruit_id"
  add_foreign_key "domicile_seeds", "issues"
  add_foreign_key "domiciles", "domiciles", column: "replaced_by_id"
  add_foreign_key "domiciles", "issues"
  add_foreign_key "domiciles", "people"
  add_foreign_key "email_seeds", "emails", column: "fruit_id"
  add_foreign_key "email_seeds", "emails", column: "replaces_id"
  add_foreign_key "email_seeds", "issues"
  add_foreign_key "emails", "emails", column: "replaced_by_id"
  add_foreign_key "emails", "issues"
  add_foreign_key "emails", "people"
  add_foreign_key "event_logs", "admin_users"
  add_foreign_key "fund_deposits", "people"
  add_foreign_key "fund_transfers", "people", column: "source_person_id"
  add_foreign_key "fund_transfers", "people", column: "target_person_id"
  add_foreign_key "fund_withdrawals", "people"
  add_foreign_key "fundings", "fundings", column: "replaced_by_id"
  add_foreign_key "fundings", "issues"
  add_foreign_key "fundings", "people"
  add_foreign_key "identification_seeds", "identifications", column: "fruit_id"
  add_foreign_key "identification_seeds", "issues"
  add_foreign_key "identifications", "identifications", column: "replaced_by_id"
  add_foreign_key "identifications", "issues"
  add_foreign_key "identifications", "people"
  add_foreign_key "issue_taggings", "issues"
  add_foreign_key "issue_taggings", "tags"
  add_foreign_key "issues", "admin_users", column: "lock_admin_user_id"
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
  add_foreign_key "note_seeds", "issues"
  add_foreign_key "note_seeds", "notes", column: "fruit_id"
  add_foreign_key "note_seeds", "notes", column: "replaces_id"
  add_foreign_key "notes", "issues"
  add_foreign_key "notes", "notes", column: "replaced_by_id"
  add_foreign_key "notes", "people"
  add_foreign_key "observations", "issues"
  add_foreign_key "person_taggings", "people"
  add_foreign_key "person_taggings", "tags"
  add_foreign_key "phone_seeds", "issues"
  add_foreign_key "phone_seeds", "phones", column: "fruit_id"
  add_foreign_key "phone_seeds", "phones", column: "replaces_id"
  add_foreign_key "phones", "issues"
  add_foreign_key "phones", "people"
  add_foreign_key "phones", "phones", column: "replaced_by_id"
  add_foreign_key "risk_score_seeds", "issues"
  add_foreign_key "risk_score_seeds", "risk_scores", column: "fruit_id"
  add_foreign_key "risk_scores", "issues"
  add_foreign_key "risk_scores", "people"
  add_foreign_key "risk_scores", "risk_scores", column: "replaced_by_id"
  add_foreign_key "tasks", "workflows"
  add_foreign_key "workflows", "issues"
end
