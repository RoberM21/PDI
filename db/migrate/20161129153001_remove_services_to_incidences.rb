class RemoveServicesToIncidences < ActiveRecord::Migration
  def change
    remove_column :incidences, :services_id
  end
end
