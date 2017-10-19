class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :city
      t.integer :location_id

      t.timestamps
    end
  end
end
