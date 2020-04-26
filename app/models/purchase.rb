class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :movie, required: false
  belongs_to :season, required: false

  validates_presence_of :user, :price, :quality
  validates_uniqueness_of :movie, scope: %i[user], if: -> (purchase) {purchase.movie_id.present?}, conditions: -> {where('expire_date > ?', DateTime.now)}
  validates_uniqueness_of :season, scope: %i[user], if: -> (purchase) {purchase.season_id.present?}, conditions: -> {where('expire_date > ?', DateTime.now)}

  before_create :set_expire_date

  enum quality: %i(SD HD)

  # Set expire date before creating the purchase
  def set_expire_date
    self.expire_date =  DateTime.now + 3.days
  end
end
