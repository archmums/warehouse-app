class Warehouse < ApplicationRecord
  validates :name, :code, :area, :description, :address, :cep, :city, presence: true
  validates :code, uniqueness: true 
  validates :cep, format: {with:/\d{5}-\d{3}\Z/}
end
