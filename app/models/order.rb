class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :employee
  has_many :parts

  def order_name
    self.employee.first_name + " " + self.warehouse.location_code  + " " + self.created_at.to_date.to_s
  end
end
