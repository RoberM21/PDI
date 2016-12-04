class ModificacionToEquipo < ActiveRecord::Migration
  def change
    #remove_column :equipment, :client_id
    add_column :equipment, :area_id, :integer
  end
end
