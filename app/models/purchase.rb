# == Schema Information
#
# Table name: purchases
#
#  id          :integer          not null, primary key
#  movie_id    :integer
#  season_id   :integer
#  user_id     :integer          not null
#  price       :float            not null
#  quality     :integer          not null
#  expire_date :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
  belongs_to :season, optional: true

  validates :user, :price, :quality, presence: true
  validates_uniqueness_of :movie, scope: %i[user], if: ->(purchase) { purchase.movie_id.present? }, conditions: -> { where('expire_date > ?', DateTime.now) }
  validates_uniqueness_of :season, scope: %i[user], if: ->(purchase) { purchase.season_id.present? }, conditions: -> { where('expire_date > ?', DateTime.now) }

  before_create :set_expire_date

  enum quality: { SD: 0, HD: 1 }

  # Set expire date before creating the purchase
  def set_expire_date
    self.expire_date = DateTime.now + 3.days
  end
end
