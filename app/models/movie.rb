# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string
#  plot       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases

  validates :title, presence: true, uniqueness: true
end
