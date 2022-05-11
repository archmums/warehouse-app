class Supplier < ApplicationRecord
  validates :corporate_name, :registration_number, :brand_name, :email, presence: true
  validates :registration_number, length: {is: 13}
  validates :registration_number, uniqueness: true
end
