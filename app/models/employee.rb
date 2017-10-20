class Employee < ApplicationRecord

  validates :first_name, :last_name, :employee_id, presence: true
  validates :is_manager, inclusion: { in: [ true, false ]}
  has_secure_password

  belongs_to :warehouse
  has_many :removed_parts, foreign_key: :removed_by_id, class_name: :Part
  has_many :added_parts, foreign_key: :added_by_id, class_name: :Part

  has_many :orders, foreign_key: :manager_id
end
