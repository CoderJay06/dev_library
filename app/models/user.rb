class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :downloads
  has_many :books, through: :downloads
  
  validates :first_name, :last_name, :email, :username, 
  :password, presence: true
  validates_confirmation_of :email, :password, unless: 
  Proc.new { |u| u.provider.blank? }
  validates :first_name, :last_name, length: { in: 1..40 }
  validates :password, length: { in: 4..50 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, :email, uniqueness: true 
  validates :email, :password_confirmation, confirmation: true

  # signup new user or login existing user through Google Omniauth
  def self.find_or_create_from_omniauth(auth_hash)
    self.find_or_create_by(email: auth_hash.info.email) do |user|
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
      user.first_name = auth_hash.info.name.split(' ')[0]
      user.last_name = auth_hash.info.name.split(' ')[1]
      user.email = auth_hash.info.email
      user.username = auth_hash.info.email
      user.password = SecureRandom.hex;
    end
  end
end
