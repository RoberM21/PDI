class AddServicesToIncidences < ActiveRecord::Migration
  def change
    add_column :incidences, :service_id, :integer
  end
end
