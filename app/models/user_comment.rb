class UserComment < ActiveRecord::Base

  belongs_to :user
  belongs_to :commenter, class_name: User

end