class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_user, class_name: 'User'

  validates_uniqueness_of :followed_user_id, scope: :follower_id

end
