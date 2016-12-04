class Incidence < ActiveRecord::Base
  belongs_to :technical
  belongs_to :client
  belongs_to :equipment
end
