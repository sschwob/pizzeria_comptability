class CreateBalanceSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :balance_sheets do |t|
      t.references :pizzerium, null: false, foreign_key: true
      t.date :month, null: false
      t.float :turnover, default: 0.0

      t.timestamps
    end
    add_index :balance_sheets, :month
  end
end
