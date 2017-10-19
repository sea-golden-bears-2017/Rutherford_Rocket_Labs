class Employee < ApplicationRecord

  validates :first_name, :last_name, :employee_id, presence: true
  has_secure_password

  belongs_to :warehouse
end
