class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments

  validates :title, presence: true, length: { maximum: 50 }
  validates :rant, presence: true, length: { minimum: 140 }

  scope :not_spam, -> {where( spam: false)}

  scope :spam, -> { where(spam: true) }

  def self.search term
    self.where("rant iLIKE ?", "%#{term}%")
  end

end

