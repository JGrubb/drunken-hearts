json.(@cart, :updated_at, :total_price)
json.line_items @cart.line_items, :id, :quantity, :product, :total_price
