class Part < ApplicationRecord
  belongs_to :warehouse
  belongs_to :remover, foreign_key: :removed_by_id, class_name: :Employee, optional: true
  belongs_to :adder, foreign_key: :added_by_id, class_name: :Employee
end
