class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.date :date
      t.string :venue
      t.string :city
      t.string :link
      t.text :info

      t.timestamps
    end
  end
end
