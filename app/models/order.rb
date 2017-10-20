class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :manager, class_name: :Employee
  has_many :parts

  def order_name
    
  end
end
