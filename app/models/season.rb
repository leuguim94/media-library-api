class Season < ApplicationRecord
  has_many :purchases
  has_many :episodes, ->{order(number: :asc)}, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates_presence_of :number
end
