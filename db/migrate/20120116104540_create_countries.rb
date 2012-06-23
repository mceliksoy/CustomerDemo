class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code, :null => false, :limit => 10, :index => { :unique => true }
      t.string :name, :null => false, :limit => 100, :index => { :unique => true }

      t.timestamps
    end
  end
end
