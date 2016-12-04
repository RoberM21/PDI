class AddNameToEquipo < ActiveRecord::Migration
  def change
    add_column :equipment, :codigo, :string
  end
end
