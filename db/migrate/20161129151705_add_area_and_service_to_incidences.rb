class AddAreaAndServiceToIncidences < ActiveRecord::Migration
  def change
    remove_column :incidences, :tipo
    add_column :incidences, :area_id, :integer
  end
end
