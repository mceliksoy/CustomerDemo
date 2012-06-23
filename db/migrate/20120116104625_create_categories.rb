class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false, :limit => 100, :index => { :unique => true }

      t.timestamps
    end    
  end
end
