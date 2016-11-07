class CreateTechnicals < ActiveRecord::Migration
  def change
    create_table :technicals do |t|
      t.string :name
      t.boolean :ststus
      t.string :especialidad
      t.time :horaE
      t.time :horaS
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
