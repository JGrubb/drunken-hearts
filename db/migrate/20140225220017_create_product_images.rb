class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.references :product, index: true
      t.string :image

      t.timestamps
    end
  end
end