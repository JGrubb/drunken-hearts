class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :null => false
      t.string :download
      t.text :description
      t.integer :price, :null => false

      t.timestamps
    end
  end
end
