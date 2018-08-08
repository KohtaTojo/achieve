class Tweet < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  validates :name, length: {minimum: 1}
  validates :content, length: {in:1..150}
end
