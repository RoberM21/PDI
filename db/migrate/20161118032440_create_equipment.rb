class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :marca
      t.string :tipo
      t.string :garantia
      t.date :entrada

      t.timestamps null: false
    end
  end
end
