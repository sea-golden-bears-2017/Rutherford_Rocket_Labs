class Part < ApplicationRecord
  belongs_to :warehouse
  belongs_to :remover, foreign_key: :removed_by_id, class_name: :Employee, optional: true
  belongs_to :receiver, foreign_key: :received_by_id, class_name: :Employee, optional: true
  belongs_to :order, optional: true
  # paginates_per 50

  def self.all_of_type_in_inventory(part_no)
    Part.where(received_by_id: !nil, removed: false, part_no: part_no)
  end

  def self.number_of(part_no, warehouse_id)
    Part.where(received_by_id: !nil, removed: false, part_no: part_no, warehouse_id: warehouse_id).count
  end

  def self.unique_parts_in_inventory(warehouse_id)
    Part.where(warehouse_id: warehouse_id, received_by_id: !nil, removed: false).select('distinct on (name) *')
  end

  def self.number_and_name
    Part.all.map { |part| "#{part.part_no}-#{part.name.capitalize}" }.uniq
  end

end
