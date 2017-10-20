class Part < ApplicationRecord
  belongs_to :warehouse
  belongs_to :remover, foreign_key: :removed_by_id, class_name: :Employee, optional: true
  belongs_to :receiver, foreign_key: :received_by_id, class_name: :Employee, optional: true
  belongs_to :order, optional: true

  def self.all_of_type(part_no)
    Part.where(part_no: part_no)
  end

  def self.number_of(part_no, warehouse_id)
    Part.where(part_no: part_no, warehouse_id: warehouse_id).count
  end

  def self.unique_parts(warehouse_id)
    Part.where(warehouse_id: warehouse_id).select('distinct on (name) *')
  end
end
