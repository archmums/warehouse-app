class ProductModel < ApplicationRecord
  validates :name, :weight, :width, :height, :depth, :sku, presence: true
  validates :sku, length: {is: 20}
  validates :weight, :height, :width, :depth, numericality: {greater_than: 0}
  validates :sku, uniqueness: true
  belongs_to :supplier
end
