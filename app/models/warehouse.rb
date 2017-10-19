class Warehouse < ApplicationRecord
  has_many :employees
  has_many :parts
end
