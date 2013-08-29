class AddTicketsLinkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :tickets_link, :string
  end
end
