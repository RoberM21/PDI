class AddEquipoToincidence < ActiveRecord::Migration
  def change
    add_column :incidences, :equipment_id, :integer
  end
end
