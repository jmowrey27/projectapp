class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :variants, class_name: "ProductVariant", dependent: :destroy
  has_many :order_items
  accepts_nested_attributes_for :variants, allow_destroy: true
  has_one_attached :image
  validates :name, presence: true
end
