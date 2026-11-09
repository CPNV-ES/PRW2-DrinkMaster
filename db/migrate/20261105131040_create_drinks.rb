class CreateDrinks < ActiveRecord::Migration[8.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :barcode
      t.decimal :price, precision: 8, scale: 2
      t.integer :volume

      t.timestamps
    end
  end
end
