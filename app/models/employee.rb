class Employee < ApplicationRecord
  has_secure_password

  belongs_to :warehouse
  has_many :removed_parts, foreign_key: :removed_by_id, class_name: :Part
  has_many :added_parts, foreign_key: :added_by_id, class_name: :Part
end
