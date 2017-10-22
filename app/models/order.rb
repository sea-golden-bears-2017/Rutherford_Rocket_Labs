class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :employee
  has_many :parts
  validates :description, presence: true

  def order_name
    self.employee.first_name + " " + self.warehouse.location_code  + " " + self.created_at.to_date.to_s
  end

  def unique_parts
    self.parts.map{ |part| [part.part_no, part.name] }.uniq
  end

  def part_count(part)
    self.parts.where(part_no: part[0]).count
  end

  def self.unmanaged_order

  end


  def full_orders
    Order.all.select{ |order| order.parts.count > 0 }
  end


end
