class DeleteResToService < ActiveRecord::Migration
  def change
    remove_column :services, :res
  end
end
