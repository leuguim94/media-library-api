class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :movie, required: false
  belongs_to :season, required: false
  
  enum quality: %i(SD HD)

  before_create :set_expire_date

  # Set expire date before creating the purchase
  def set_expire_date
    self.expire_date =  DateTime.now + 3.days
  end
end
