class Employee < ApplicationRecord
  has_secure_password

  belongs_to :warehouse
  has_many :parts, foreign_key: :removed_by_id
  has_many :parts, foreign_key: :added_by_id
end
