class User < ApplicationRecord
  has_many :purchases, dependent: :destroy
  has_many :movies, through: :purchases
  has_many :seasons, through: :purchases
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
