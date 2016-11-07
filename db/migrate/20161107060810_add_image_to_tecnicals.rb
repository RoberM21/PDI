class AddImageToTecnicals < ActiveRecord::Migration
  def up
  add_attachment :technicals, :avatar
end

def down
  remove_attachment :technicals, :avatar
end
end
