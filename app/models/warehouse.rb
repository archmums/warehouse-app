class Warehouse < ApplicationRecord
  validates :name, :code, :area, :description, :address, :cep, :city, presence: true
  validates :code, uniqueness: true 
end
