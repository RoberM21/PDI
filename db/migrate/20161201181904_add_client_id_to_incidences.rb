class AddClientIdToIncidences < ActiveRecord::Migration
  def change
    add_column :incidences, :client_id, :integer
  end
end
