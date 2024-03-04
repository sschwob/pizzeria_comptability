class CreatePizzeria < ActiveRecord::Migration[6.1]
  def change
    create_table :pizzeria do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :pizzeria, :name
  end
end
