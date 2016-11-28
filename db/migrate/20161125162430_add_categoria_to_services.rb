class AddCategoriaToServices < ActiveRecord::Migration
  def change
    add_column :services, :categoria, :string
  end
end
