class CreateInventor < ActiveRecord::Migration[8.0]
  def change
    create_table :inventors do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end

    add_column :widgets, :inventor_id, :integer
  end
end
