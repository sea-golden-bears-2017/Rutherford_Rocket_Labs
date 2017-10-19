class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :employee_id
      t.string :password_digest
      t.boolean :is_manager
      t.belongs_to :warehouse

      t.timestamps
    end
  end
end
