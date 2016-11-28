class Area < ActiveRecord::Base
  has_many :technicals
  has_many :services
end
