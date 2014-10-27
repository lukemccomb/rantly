class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments

  validates :title, presence: true
  validates :rant, presence: true, length: { minimum: 140, maximum: 255 }

  def self.search term
    self.where("rant iLIKE ?", "%#{term}%")
  end

end
