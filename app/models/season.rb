# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  plot       :string
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Season < ApplicationRecord
  has_many :purchases
  has_many :episodes, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :number, presence: true
end
