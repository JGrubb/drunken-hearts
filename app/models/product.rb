# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  download    :string(255)
#  description :text
#  price       :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  published   :boolean          default(FALSE)
#

class Product < ActiveRecord::Base
  has_many :product_images, :dependent => :destroy

  has_many :line_items
  has_many :carts, :through => :line_items

  before_destroy :ensure_not_in_any_carts

  accepts_nested_attributes_for :product_images,
      :reject_if => lambda { |pi| pi[:image].blank? },
      :allow_destroy => true
  validates :title, :description, :price, :presence => true

  scope :published, -> { where(published: true) }

  def ensure_not_in_any_carts
    if line_item.count.zero?
      return true
    else
      errors.add(:base, 'This product is in some peoples\' carts.')
      return false
    end
  end

  def price_in_dollars
    price.to_d / 100 if price
  end

  def price_in_dollars=(dollars)
    self.price = dollars.to_d * 100 if dollars.present?
  end
end
