class AgregarRespuestaAServicio < ActiveRecord::Migration
  def change
    add_column :services, :respuesta, :time
  end
end
