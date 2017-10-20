class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :description
      t.belongs_to :warehouse
      t.integer :manager_id, foreign_key: true

      t.timestamps
    end
  end
end
