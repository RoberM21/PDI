class AddTecIdToIncidences < ActiveRecord::Migration
  def change
    add_column :incidences, :technical_id, :integer
  end
end
