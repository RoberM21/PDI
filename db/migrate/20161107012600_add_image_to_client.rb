class AddImageToClient < ActiveRecord::Migration
    def up
    add_attachment :clients, :avatar
  end

  def down
    remove_attachment :clients, :avatar
  end
end
