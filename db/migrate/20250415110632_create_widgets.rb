class CreateWidgets < ActiveRecord::Migration[8.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.decimal :cost
      t.integer :stock
      t.integer :size
      t.boolean :toxic

      t.timestamps
    end
  end
end
