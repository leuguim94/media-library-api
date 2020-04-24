class Movie < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases

  validates :title, presence: true, uniqueness: true
end
