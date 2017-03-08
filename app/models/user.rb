class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :image, ImageUploader

  has_many :rants
  has_many :favorites
  has_many :comments
  has_many :user_comments

  belongs_to :disable

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship'

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name:  'FollowingRelationship'
  has_many :followers, through: :follower_relationships

  before_create :create_confirmation_token

  def create_confirmation_token
    self.confirmation_token = SecureRandom.uuid
  end

  def unconfirmed?
    confirmation_token != nil
  end


  validates :username, presence: true, uniqueness: true, length: { maximum: 155 }
  validates :first_name, presence: true, length: { maximum: 155 }
  validates :last_name, presence: true, length: { maximum: 155 }
  validates :bio, presence: true, length: { maximum: 255 }
  validates :rate, presence: true
  validates :password, length: { minimum: 8 }, allow_nil: true
  # validates :image, :presence => true


end
