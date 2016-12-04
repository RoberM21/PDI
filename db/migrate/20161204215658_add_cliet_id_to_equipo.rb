class AddClietIdToEquipo < ActiveRecord::Migration
  def change
    add_column :equipment, :client_id, :integer
  end
end
