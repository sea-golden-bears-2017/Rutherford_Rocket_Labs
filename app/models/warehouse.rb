class Warehouse < ApplicationRecord
  validates :city, presence: true
  has_many :employees
  has_many :parts
end
