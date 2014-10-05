class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  validates :username, presence: true, uniqueness: true
  validates :password, :presence => true, length: {minimum: 8}
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :bio, :presence => true
  validates :rate, :presence => true


end
