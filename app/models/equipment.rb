class Equipment < ActiveRecord::Base
  belongs_to :client
  has_many :incidences
end
