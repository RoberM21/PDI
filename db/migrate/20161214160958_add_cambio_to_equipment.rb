class AddCambioToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :cambio, :text
  end
end
