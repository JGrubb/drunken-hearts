class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :download
      t.text :description
      t.integer :price
      t.string :slug

      t.timestamps
    end
    add_index :products, :slug
  end
end
