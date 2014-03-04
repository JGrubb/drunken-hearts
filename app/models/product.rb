class Product < ActiveRecord::Base
  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images,
      :reject_if => lambda { |pi| pi[:image].blank? },
      :allow_destroy => true
  validates :title, :description, :price, :presence => true

  scope :published, -> { where(published: true) }

  def price_in_dollars
    price.to_d / 100 if price
  end

  def price_in_dollars=(dollars)
    self.price = dollars.to_d * 100 if dollars.present?
  end
end
