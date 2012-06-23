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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120117103619) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], :name => "index_categories_on_name", :unique => true
  end

  create_table "countries", :force => true do |t|
    t.string   "code",       :limit => 10,  :null => false
    t.string   "name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], :name => "index_countries_on_code", :unique => true
    t.index ["name"], :name => "index_countries_on_name", :unique => true
  end

  create_table "customers", :force => true do |t|
    t.string   "company_name",       :limit => 100, :null => false
    t.string   "contact_title",      :limit => 50
    t.string   "contact_first_name", :limit => 50
    t.string   "contact_last_name",  :limit => 50
    t.integer  "category_id"
    t.text     "address"
    t.string   "city",               :limit => 50
    t.string   "region",             :limit => 50
    t.integer  "postal_code"
    t.integer  "country_id"
    t.string   "phone",              :limit => 50
    t.string   "fax",                :limit => 50
    t.string   "mobile",             :limit => 50
    t.string   "email",              :limit => 50
    t.string   "homepage",           :limit => 50
    t.string   "skype",              :limit => 50
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["company_name"], :name => "index_customers_on_company_name", :unique => true
  end

  create_table "customers_notes", :force => true do |t|
    t.integer  "customer_id", :null => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customer_id"], :name => "index_customers_notes_on_customer_id"
    t.foreign_key ["customer_id"], "customers", ["id"], :on_update => :cascade, :on_delete => :restrict, :name => "customers_notes_ibfk_1"
  end

end
