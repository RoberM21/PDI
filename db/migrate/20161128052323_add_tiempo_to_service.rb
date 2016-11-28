class AddTiempoToService < ActiveRecord::Migration
  def change
    add_column :services, :res, :time
    add_column :services, :resolucion, :time
  end
end
