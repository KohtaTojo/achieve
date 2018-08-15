class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {in:1..140}
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
