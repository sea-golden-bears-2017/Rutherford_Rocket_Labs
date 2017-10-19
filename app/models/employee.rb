class Employee < ApplicationRecord

  validates :first_name, :last_name, :employee_id, presence: true
  validates :is_manager, inclusion: { in: [ true, false ]}
  has_secure_password

  belongs_to :warehouse
end
