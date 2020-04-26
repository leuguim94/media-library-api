# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  plot       :string
#  number     :integer
#  season_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Episode < ApplicationRecord
  belongs_to :season, touch: true

  validates :title, :number, :season, presence: true
  validates_uniqueness_of :number, scope: :season_id

  default_scope { order(number: :asc) }
end
