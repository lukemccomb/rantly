class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :rant

  validates_uniqueness_of :user_id, scope: :rant_id

end
