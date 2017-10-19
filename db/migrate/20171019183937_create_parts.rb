class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.integer :part_no
      t.string :name
      t.belongs_to :warehouse, foreign_key: true
      t.integer :removed_by_id, foreign_key: true
      t.integer :added_by_id, foreign_key: true
      t.boolean :removed

      t.timestamps
    end
  end
end
