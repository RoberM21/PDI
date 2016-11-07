class User < ActiveRecord::Base
  has_many :technicals, dependent: :destroy
  has_many :clients, dependent: :destroy
  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :technicals
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :token, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, on: :create

  validates :password, :password_confirmation,
      presence: true, confirmation: true, length: { minimum: 6 }, on: [:create]

  has_secure_password

  self.table_name = "users"
  before_save { self.email = email.downcase unless self.email.blank? }
  before_create :confirm_token

  private
  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
end
