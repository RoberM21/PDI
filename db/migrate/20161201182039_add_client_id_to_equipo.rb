class AddClientIdToEquipo < ActiveRecord::Migration
  def change
    add_column :technicals, :client_id, :integer
  end
end
