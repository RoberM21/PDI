class DeleteEspecilidadToTecnichal < ActiveRecord::Migration
  def change
    remove_column :technicals, :especialidad
  end
end
