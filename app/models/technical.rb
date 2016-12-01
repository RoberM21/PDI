class Technical < ActiveRecord::Base
  belongs_to :user
  belongs_to :area
  has_many :incidences
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
