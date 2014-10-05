class Rant < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :rant, presence: true

end
