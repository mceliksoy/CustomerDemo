class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :company_name, :null => false, :limit => 100, :index => { :unique => true }
      t.string :contact_title, :limit => 50
      t.string :contact_first_name, :limit => 50
      t.string :contact_last_name, :limit => 50
      t.belongs_to :category, :null => false, :on_update => :cascade, :on_delete => :restrict
      t.text :address
      t.string :city, :limit => 50
      t.string :region, :limit => 50
      t.integer :postal_code, :limit => 50
      t.belongs_to :country, :null => false, :on_update => :cascade, :on_delete => :restrict
      t.string :phone, :limit => 50
      t.string :fax, :limit => 50
      t.string :mobile, :limit => 50
      t.string :email, :limit => 50
      t.string :homepage, :limit => 50
      t.string :skype, :limit => 50
      t.text :notes            

      t.timestamps
    end
  end
end