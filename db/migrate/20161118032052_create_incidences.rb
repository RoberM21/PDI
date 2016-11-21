class CreateIncidences < ActiveRecord::Migration
  def change
    create_table :incidences do |t|
      t.string :tipo
      t.string :prioridad
      t.string :estado
      t.text :comentario

      t.timestamps null: false
    end
  end
end
