class RenameLinksInShows < ActiveRecord::Migration
  def up
    rename_column :shows, :link, :tickets_link
    rename_column :shows, :tickets_link, :venue_link
  end

  def down
    rename_column :shows, :tickets_link, :link
    rename_column :shows, :venue_link, :tickets_link
  end
end
