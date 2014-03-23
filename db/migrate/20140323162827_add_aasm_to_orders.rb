class AddAasmToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string
    add_column :orders, :stripe_id, :string
    add_column :orders, :stripe_token, :string
    add_column :orders, :card_expiration, :date
    add_column :orders, :error, :text
    add_column :orders, :fee_amount, :integer
  end
end
