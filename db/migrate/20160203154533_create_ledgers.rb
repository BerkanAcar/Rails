class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.decimal :income
      t.decimal :expense

      t.timestamps null: false
    end
  end
end
