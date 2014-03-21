class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  #validates_presence_of :cart, :product
  def total_price
    (product.price * quantity).to_f / 100
  end
end
