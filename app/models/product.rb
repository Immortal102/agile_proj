class Product < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'URL must be GIF, JPG or PNG format.'
  }
  attr_accessible :description, :image_url, :price, :title
end
