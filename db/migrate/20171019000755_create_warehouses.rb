class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :city
      t.string :location_code

      t.timestamps
    end
  end
end
