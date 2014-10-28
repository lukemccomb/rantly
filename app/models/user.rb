class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  has_many :favorites
  has_many :comments

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship'

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name:  'FollowingRelationship'
  has_many :followers, through: :follower_relationships

  validates :username, presence: true, uniqueness: true, length: { maximum: 155 }
  validates :first_name, presence: true, length: { maximum: 155 }
  validates :last_name, presence: true, length: { maximum: 155 }
  validates :bio, presence: true, length: { maximum: 255 }
  validates :rate, presence: true
  validates :password, length: { minimum: 8 }, allow_nil: true

end
