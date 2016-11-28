class AddAreaIdToTecnico < ActiveRecord::Migration
  def change
    add_column :technicals, :area_id, :integer
  end
end
