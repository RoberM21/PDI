class DeleteCategoryToServices < ActiveRecord::Migration
  def change
    remove_column :services, :categoria
    add_column :services, :area_id, :integer
  end
end
